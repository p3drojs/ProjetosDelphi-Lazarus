unit cadUsuariosU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZSqlUpdate, ZDataset, ZAbstractRODataset, xCadPaiU, DB, dataModuleU;

type

  { TcadUsuariosF }

  TcadUsuariosF = class(TxCadPai)
    idUser: TDBEdit;
    completeNameLabel: TLabel;
    informLabel: TLabel;
    passwordLabel: TLabel;
    qryUsuariossenha: TZRawStringField;
    userNameLabel: TLabel;
    userNameEdt: TDBEdit;
    passwordEdt: TDBEdit;
    completeNameEdt: TDBEdit;
    dsUsuarios: TDataSource;
    idLabel: TLabel;
    qryUsuarios: TZQuery;
    qryUsuariosid: TZIntegerField;
    qryUsuariosnome_completo: TZRawStringField;
    qryUsuariosusuario: TZRawStringField;
    updUsuarios: TZUpdateSQL;
    procedure editButtonClick(Sender: TObject);
    procedure excludeButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure goBackButtonClick(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure qryUsuariosAfterInsert(DataSet: TDataSet);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure showGridDblClick(Sender: TObject);
  private

  public

  end;

var
  cadUsuariosF: TcadUsuariosF;

implementation

{$R *.lfm}

{ TcadUsuariosF }

procedure TcadUsuariosF.searchButtonClick(Sender: TObject);
begin
  inherited;
  if searhEdt.Text <> '' then
    qryUsuarios.SQL.Text := 'select * from USUARIOS where ID=' + searhEdt.Text
  else
    qryUsuarios.SQL.Text := 'select * from USUARIOS';
  qryUsuarios.Open;
end;

procedure TcadUsuariosF.showGridDblClick(Sender: TObject);
begin
  qryUsuarios.Edit;
  mainPageControl.ActivePageIndex := 1;
end;

procedure TcadUsuariosF.FormShow(Sender: TObject);
begin
  qryUsuarios.active := True;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TcadUsuariosF.goBackButtonClick(Sender: TObject);
begin
  inherited;
  qryUsuarios.Cancel;
end;

procedure TcadUsuariosF.editButtonClick(Sender: TObject);
begin
  qryUsuarios.Edit;
end;

procedure TcadUsuariosF.excludeButtonClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsUsuarios.DataSet.Delete;
  end;
end;

procedure TcadUsuariosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryUsuarios.close;
end;

procedure TcadUsuariosF.leaveButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TcadUsuariosF.newButtonClick(Sender: TObject);
begin
  inherited;
  if qryUsuarios.State in [dsInsert,dsEdit] then;
  begin
       qryUsuarios.Cancel;
  end;
  qryUsuarios.insert;
end;

procedure TcadUsuariosF.qryUsuariosAfterInsert(DataSet: TDataSet);
begin
  qryUSUARIOSID.AsInteger := StrToInt(dataModuleMD.getSequence('usuario_oid'));
end;

procedure TcadUsuariosF.saveButtonClick(Sender: TObject);
begin
  inherited;
  if (userNameEdt.text = '') or (passwordEdt.text = '') or (completeNameEdt.text = '') then
  begin
    ShowMessage('PREENCHA TODOS OS CAMPOS!!!');
    Exit;
  end;
  if (Length(passwordEdt.text) < 6) then
  begin
    ShowMessage('A SENHA DEVE CONTER 6 OU MAIS DIGITOS');
  end;
  qryUsuarios.Post;
end;

end.
