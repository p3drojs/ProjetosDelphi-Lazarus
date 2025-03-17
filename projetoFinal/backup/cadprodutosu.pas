unit cadProdutosU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZSqlUpdate, ZDataset, ZAbstractRODataset, xCadPaiU, DB, seleCadProdU,dataModuleU;

type

  { TcadProdutosF }

  TcadProdutosF = class(TxCadPai)
    catButton: TButton;
    descEdt: TDBEdit;
    obsLabel: TLabel;
    obsEdt: TDBEdit;
    dtProdutoEdt: TDBEdit;
    descLabel: TLabel;
    vlrVendaEdt: TDBEdit;
    Label3: TLabel;
    vlVendaEdt: TLabel;
    statusCB: TDBComboBox;
    idProdutoEdt: TDBEdit;
    dsProdutos: TDataSource;
    idLabel: TLabel;
    catIDprodEdt: TDBEdit;
    catLabel: TLabel;
    Label2: TLabel;
    qryProdutos: TZQuery;
    qryProdutoscategoriaprodutoid: TZIntegerField;
    qryProdutosds_produto: TZRawStringField;
    qryProdutosdt_cadastro_produto: TZDateTimeField;
    qryProdutosobs_produto: TZRawStringField;
    qryProdutosprodutoid: TZIntegerField;
    qryProdutosstatus_produto: TZRawStringField;
    qryProdutosvl_venda_produto: TZBCDField;
    updProdutos: TZUpdateSQL;
    procedure catButtonClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure dtProdutoEdtChange(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    procedure excludeButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure goBackButtonClick(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure qryProdutosAfterInsert(DataSet: TDataSet);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure showGridDblClick(Sender: TObject);
  private

  public

  end;

var
  cadProdutosF: TcadProdutosF;

implementation

{$R *.lfm}

{ TcadProdutosF }


procedure TcadProdutosF.ComboBox1Change(Sender: TObject);
begin

end;

procedure TcadProdutosF.catButtonClick(Sender: TObject);
begin
  selectCadF := TselectCadF.create(self);
  selectCadF.ShowModal;
end;

procedure TcadProdutosF.dtProdutoEdtChange(Sender: TObject);
begin

end;

procedure TcadProdutosF.editButtonClick(Sender: TObject);
begin
  qryProdutos.edit;
end;

procedure TcadProdutosF.excludeButtonClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsProdutos.DataSet.Delete;
  end;
end;

procedure TcadProdutosF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryProdutos.close;
end;

procedure TcadProdutosF.FormShow(Sender: TObject);
begin
  qryProdutos.active := True;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TcadProdutosF.goBackButtonClick(Sender: TObject);
begin
  inherited;
  qryProdutos.close;
end;

procedure TcadProdutosF.leaveButtonClick(Sender: TObject);
begin
  cadProdutosF.close;
end;

procedure TcadProdutosF.newButtonClick(Sender: TObject);
begin
  inherited;
  if qryProdutos.State in [dsInsert,dsEdit] then;
  begin
       qryProdutos.Cancel;
  end;
  qryProdutos.insert;
  qryProdutos.FieldByName('DT_CADASTRO_PRODUTO').AsDateTime := Trunc(Now);

end;

procedure TcadProdutosF.qryProdutosAfterInsert(DataSet: TDataSet);
begin
  qryProdutosPRODUTOID.AsInteger := StrToInt(dataModuleMD.getSequence('produto_produtoid'));
end;

procedure TcadProdutosF.saveButtonClick(Sender: TObject);
begin
  inherited;
  if (descEdt.text = '') or (vlrVendaEdt.text = '') then
  begin
    ShowMessage('PREENCHA TODOS OS CAMPOS!!!');
    Exit;
  end;
  qryProdutos.Post;
end;

procedure TcadProdutosF.searchButtonClick(Sender: TObject);
begin
  inherited;
  if searhEdt.Text <> '' then
    qryProdutos.SQL.Text := 'select * from PRODUTO where PRODUTOID=' + searhEdt.Text
  else
    qryProdutos.SQL.Text := 'select * from PRODUTO';
  qryProdutos.Open;
end;

procedure TcadProdutosF.showGridDblClick(Sender: TObject);
begin
  mainPageControl.ActivePageIndex := 1;
  qryProdutos.Edit;
end;

end.
