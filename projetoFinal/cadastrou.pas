unit cadastroU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZSqlUpdate, ZDataset, ZAbstractRODataset, xCadPaiU, DB,dataModuleU;

type

  { TregisterTabF }

  TregisterTabF = class(TxCadPai)
    clientNameEdt: TDBEdit;
    idClienteEdt: TDBEdit;
    dsClientes: TDataSource;
    idLabel: TLabel;
    Label4: TLabel;
    tipoClienteLabel: TLabel;
    Label3: TLabel;
    tipoCliente: TDBEdit;
    qryClientes: TZQuery;
    qryClientesclienteid: TZIntegerField;
    qryClientescpf_cnpj_cliente: TZRawStringField;
    qryClientesnome_cliente: TZRawStringField;
    qryClientestipo_cliente: TZRawStringField;
    dadosEdt: TDBEdit;
    updateClientes: TZUpdateSQL;
    procedure dadosEdtChange(Sender: TObject);
    procedure dadosEdtExit(Sender: TObject);
    procedure dsClientesDataChange(Sender: TObject; Field: TField);
    procedure editButtonClick(Sender: TObject);
    procedure excludeButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure goBackButtonClick(Sender: TObject);
    procedure idClienteEdtChange(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure mainPageControlChange(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure qryClientesAfterInsert(DataSet: TDataSet);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure showGridDblClick(Sender: TObject);
    procedure tipoClienteChange(Sender: TObject);
  private

  public
      function ValidarDocumento(Documento: String): Boolean;
  end;

var
  registerTabF: TregisterTabF;

implementation

{$R *.lfm}

{ TregisterTabF }

function TregisterTabF.ValidarDocumento(Documento: string): Boolean;
var
  i, Soma, Resto, Digito1, Digito2: Integer;
  Peso: array[1..12] of Integer;
  DocumentoLimpo: string;
begin
  DocumentoLimpo := '';
  for i := 1 to Length(Documento) do
  begin
    if Documento[i] in ['0'..'9'] then
      DocumentoLimpo := DocumentoLimpo + Documento[i];
  end;

  if Length(DocumentoLimpo) = 11 then
  begin
    Peso[1] := 10; Peso[2] := 9; Peso[3] := 8; Peso[4] := 7;
    Peso[5] := 6; Peso[6] := 5; Peso[7] := 4; Peso[8] := 3;
    Peso[9] := 2;
    Soma := 0;
    for i := 1 to 9 do
      Soma := Soma + StrToInt(DocumentoLimpo[i]) * Peso[i];
    Resto := Soma mod 11;
    if (Resto < 2) then
      Digito1 := 0
    else
      Digito1 := 11 - Resto;

    Peso[1] := 11; Peso[2] := 10; Peso[3] := 9; Peso[4] := 8;
    Peso[5] := 7; Peso[6] := 6; Peso[7] := 5; Peso[8] := 4;
    Peso[9] := 3; Peso[10] := 2;
    Soma := 0;
    for i := 1 to 9 do
      Soma := Soma + StrToInt(DocumentoLimpo[i]) * Peso[i];
    Soma := Soma + Digito1 * Peso[10];
    Resto := Soma mod 11;
    if (Resto < 2) then
      Digito2 := 0
    else
      Digito2 := 11 - Resto;

    Result := (Digito1 = StrToInt(DocumentoLimpo[10])) and (Digito2 = StrToInt(DocumentoLimpo[11]));
  end
  else if Length(DocumentoLimpo) = 14 then
  begin
    Peso[1] := 5; Peso[2] := 4; Peso[3] := 3; Peso[4] := 2;
    Peso[5] := 9; Peso[6] := 8; Peso[7] := 7; Peso[8] := 6;
    Peso[9] := 5; Peso[10] := 4; Peso[11] := 3; Peso[12] := 2;
    Soma := 0;
    for i := 1 to 12 do
      Soma := Soma + StrToInt(DocumentoLimpo[i]) * Peso[i];
    Resto := Soma mod 11;
    if (Resto < 2) then
      Digito1 := 0
    else
      Digito1 := 11 - Resto;

    Peso[1] := 6; Peso[2] := 5; Peso[3] := 4; Peso[4] := 3;
    Peso[5] := 2; Peso[6] := 9; Peso[7] := 8; Peso[8] := 7;
    Peso[9] := 6; Peso[10] := 5; Peso[11] := 4; Peso[12] := 3;
    Peso[13] := 2;
    Soma := 0;
    for i := 1 to 12 do
      Soma := Soma + StrToInt(DocumentoLimpo[i]) * Peso[i];
    Soma := Soma + Digito1 * Peso[13];
    Resto := Soma mod 11;
    if (Resto < 2) then
      Digito2 := 0
    else
      Digito2 := 11 - Resto;

    Result := (Digito1 = StrToInt(DocumentoLimpo[13])) and (Digito2 = StrToInt(DocumentoLimpo[14]));
  end
  else
  begin
    Result := False;
  end;
end;

procedure TregisterTabF.dsClientesDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TregisterTabF.dadosEdtChange(Sender: TObject);
begin

end;

procedure TregisterTabF.dadosEdtExit(Sender: TObject);
begin
  if not ValidarDocumento(dadosEdt.Text) then
  begin
    ShowMessage('CPF/CNPJ ESTÁ INCORRETO');
    dadosEdt.SetFocus;
  end;
end;

procedure TregisterTabF.editButtonClick(Sender: TObject);
begin
  qryClientes.Edit;
end;

procedure TregisterTabF.excludeButtonClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsClientes.DataSet.delete;
  end;
end;

procedure TregisterTabF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryClientes.close
end;

procedure TregisterTabF.FormShow(Sender: TObject);
begin
  qryClientes.Active := True;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TregisterTabF.goBackButtonClick(Sender: TObject);
begin
  inherited;
  qryClientes.close;
end;

procedure TregisterTabF.idClienteEdtChange(Sender: TObject);
begin

end;

procedure TregisterTabF.leaveButtonClick(Sender: TObject);
begin
  registerTabF.close;
end;

procedure TregisterTabF.mainPageControlChange(Sender: TObject);
begin
  qryClientes.Cancel;
end;

procedure TregisterTabF.newButtonClick(Sender: TObject);
begin
  inherited;
  if qryClientes.State in [dsInsert,dsEdit] then;
  begin
       qryClientes.Cancel;
  end;
  qryClientes.Insert;
end;

procedure TregisterTabF.qryClientesAfterInsert(DataSet: TDataSet);
begin
   qryClientesclienteid.AsInteger := StrToInt(dataModuleMD.getSequence('cliente_clienteid'));
end;

procedure TregisterTabF.saveButtonClick(Sender: TObject);
begin
  inherited;
    if not ValidarDocumento(dadosEdt.Text) then
  begin
       ShowMessage('CPF/CNPJ ESTÁ INCORRETO');
       exit;
  end;
  if (clientNameEdt.Field.AsString = '') or (tipoCliente.Field.AsString = '') or
  (idClienteEdt.Field.AsString = '') then
  begin
       ShowMessage('PREENCHA TODOS OS CAMPOS!!!');
       Exit;
  end;
  qryClientes.Post;
end;

procedure TregisterTabF.searchButtonClick(Sender: TObject);
begin
  inherited;
  if searhEdt.Text <> '' then
    qryClientes.SQL.Text := 'select * from CLIENTE where CLIENTEID=' + searhEdt.Text
  else
    qryClientes.SQL.Text := 'select * from CLIENTE';
  qryClientes.Open;
end;

procedure TregisterTabF.showGridDblClick(Sender: TObject);
begin
   mainPageControl.ActivePageIndex := 1;
   qryClientes.Edit;
end;

procedure TregisterTabF.tipoClienteChange(Sender: TObject);
begin

end;

end.
