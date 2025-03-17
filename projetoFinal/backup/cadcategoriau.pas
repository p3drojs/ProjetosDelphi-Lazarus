unit cadCategoriaU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZSqlUpdate, ZDataset, ZAbstractRODataset, xCadPaiU, DB,dataModuleU;

type

  { TcadCategoriasF }

  TcadCategoriasF = class(TxCadPai)
    dsCategorias: TDataSource;
    idCatEdt: TDBEdit;
    dsCatEdt: TDBEdit;
    idLabel: TLabel;
    descLabel: TLabel;
    qryCategoriascategoriaprodutoid: TZIntegerField;
    qryCategoriasds_categoria_produto: TZRawStringField;
    UpdCategorias: TZUpdateSQL;
    qryCategorias: TZQuery;
    procedure editButtonClick(Sender: TObject);
    procedure excludeButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure goBackButtonClick(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure qryCategoriasAfterInsert(DataSet: TDataSet);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure showGridDblClick(Sender: TObject);
  private

  public

  end;

var
  cadCategoriasF: TcadCategoriasF;

implementation

{$R *.lfm}

{ TcadCategoriasF }

procedure TcadCategoriasF.newButtonClick(Sender: TObject);
begin
  inherited;
  if qryCategorias.State in [dsInsert,dsEdit] then;
  begin
       qryCategorias.Cancel;
  end;
  qryCategorias.insert;
end;

procedure TcadCategoriasF.qryCategoriasAfterInsert(DataSet: TDataSet);
begin
  qryCategoriasCATEGORIAPRODUTOID.AsInteger := StrToInt(dataModuleMD.getSequence('categoria_produto_categoriaprodutoid_seq'));
end;

procedure TcadCategoriasF.saveButtonClick(Sender: TObject);
begin
  inherited;
  if (dsCatEdt.Field.AsString = '') then
  begin
       ShowMessage('INSIRA UMA DESCRIÇÃO');
       dsCatEdt.setFocus;
  end;
  qryCategorias.Post;
end;

procedure TcadCategoriasF.searchButtonClick(Sender: TObject);
begin
  inherited;
  if searhEdt.Text <> '' then
      qryCategorias.SQL.Text := 'select * from CATEGORIA_PRODUTO where CATEGORIAPRODUTOID=' + searhEdt.Text
  else
      qryCategorias.SQL.Text := 'select * from CATEGORIA_PRODUTO';
  qryCategorias.Open;
end;

procedure TcadCategoriasF.showGridDblClick(Sender: TObject);
begin
   mainPageControl.ActivePageIndex := 1;
   qryCategorias.Edit;
end;

procedure TcadCategoriasF.leaveButtonClick(Sender: TObject);
begin
  cadCategoriasF.close;
end;

procedure TcadCategoriasF.editButtonClick(Sender: TObject);
begin
  qryCategorias.Edit;
end;

procedure TcadCategoriasF.excludeButtonClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       dsCategorias.DataSet.delete;
  end;
end;

procedure TcadCategoriasF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryCategorias.close;
end;

procedure TcadCategoriasF.FormShow(Sender: TObject);
begin
  qryCategorias.active := true;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TcadCategoriasF.goBackButtonClick(Sender: TObject);
begin
  inherited;
  qryCategorias.cancel;
end;

end.

