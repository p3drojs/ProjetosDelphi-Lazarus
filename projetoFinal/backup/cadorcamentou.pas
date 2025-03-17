unit cadOrcamentoU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  DBCtrls, Buttons, LR_Class, LR_DBSet, ZDataset, ZSqlUpdate,
  ZAbstractRODataset, xCadPaiU, DB, dataModuleU, seleClienteOrcaU, selecProdU,
  Types, LR_DSet;

type

  { TcadOrcamentoF }

  TcadOrcamentoF = class(TxCadPai)
    imprimirBtn: TBitBtn;
    clientShowButton: TButton;
    dtOrcamentoEdt: TDBEdit;
    dataOrcamentoLabel: TLabel;
    dataValidadeLabel: TLabel;
    dtValidadeEdt: TDBEdit;
    frDbOrcamentoItem: TfrDBDataSet;
    frOrcamentoItem: TfrReport;
    qryOrcamentoItemprodutodesc: TZRawStringField;
    selecBtn: TSpeedButton;
    deleteBtn: TSpeedButton;
    totalOrcamentoEdt: TDBEdit;
    orcamentoIDEdt: TDBEdit;
    clientIDEdt: TDBEdit;
    totalOrcamentoLabel: TLabel;
    dsOrcamentoItem: TDataSource;
    idLabel: TLabel;
    clientIdLabel: TLabel;
    orcamentoItensG: TDBGrid;
    dsOrcamento: TDataSource;
    qryOrcamentoclienteid: TZIntegerField;
    qryOrcamentodt_orcamento: TZDateTimeField;
    qryOrcamentodt_validade_orcamento: TZDateTimeField;
    qryOrcamentoItemorcamentoid: TZIntegerField;
    qryOrcamentoItemorcamentoitemid: TZIntegerField;
    qryOrcamentoItemprodutoid: TZIntegerField;
    qryOrcamentoItemqt_produto: TZBCDField;
    qryOrcamentoItemvl_total: TZBCDField;
    qryOrcamentoItemvl_unitario: TZBCDField;
    qryOrcamentoorcamentoid: TZIntegerField;
    qryOrcamentovl_total_orcamento: TZBCDField;
    toGB: TGroupBox;
    qryOrcamento: TZQuery;
    updOrcamento: TZUpdateSQL;
    qryOrcamentoItem: TZQuery;
    updOrcamentoItem: TZUpdateSQL;
    procedure bottomGroupBoxClick(Sender: TObject);
    procedure deleteBtnClick(Sender: TObject);
    procedure dsOrcamentoDataChange(Sender: TObject; Field: TField);
    procedure dsOrcamentoItemDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frDbOrcamentoItemCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure imprimirBtnClick(Sender: TObject);
    procedure clientIDEdtChange(Sender: TObject);
    procedure clientShowButtonClick(Sender: TObject);
    procedure editButtonClick(Sender: TObject);
    procedure excludeButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure goBackButtonClick(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure mainPageControlChange(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure orcamentoItensGColExit(Sender: TObject);
    procedure orcamentoItensGDblClick(Sender: TObject);
    procedure qryOrcamentoAfterInsert(DataSet: TDataSet);
    procedure qryOrcamentoAfterPost(DataSet: TDataSet);
    procedure qryOrcamentoItemAfterInsert(DataSet: TDataSet);
    procedure qryOrcamentoItemAfterPost(DataSet: TDataSet);
    procedure registerTabContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: boolean);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure showGridDblClick(Sender: TObject);
    procedure selecBtnClick(Sender: TObject);
    procedure toGBClick(Sender: TObject);
  private

  public
    procedure AbreOrcItens(orcamentoid: integer);
    procedure CalcularTotalOrcamento;
  end;

var
  cadOrcamentoF: TcadOrcamentoF;

implementation

{$R *.lfm}

{ TcadOrcamentoF }

//terminar conta e mudar quantidade

procedure TcadOrcamentoF.CalcularTotalOrcamento;
begin
if not (qryOrcamento.State in [dsEdit, dsInsert]) then
begin
    qryOrcamento.Edit;
end;
if not (qryOrcamentoItem.State in [dsEdit, dsInsert]) then
begin
    qryOrcamentoItem.Edit;
end;
qryOrcamentoItem.first;
qryOrcamentovl_total_orcamento.AsFloat := 0;

while not qryOrcamentoItem.EoF do
begin
     qryOrcamentovl_total_orcamento.AsFloat := qryOrcamentovl_total_orcamento.AsFloat + qryOrcamentoItemvl_total.AsFloat;
     qryOrcamentoItem.next;
end;
end;

procedure TcadOrcamentoF.AbreOrcItens(orcamentoid: integer);
begin
  if orcamentoid <> 0 then
  begin
    qryOrcamentoItem.Close;
    qryOrcamentoItem.SQL.Clear;
    qryOrcamentoItem.SQL.add(
      'select ' +
      'ORCAMENTOITEMID, ' +
      'ORCAMENTOID, ' +
      'produtodesc, ' +
      'PRODUTOID, ' + 'QT_PRODUTO, ' +
      'VL_UNITARIO, ' + 'VL_TOTAL ' +
      'FROM ORCAMENTO_ITEM ' +
      'WHERE ORCAMENTOID = ' +
      IntToStr(orcamentoid) +
      ' ORDER BY ORCAMENTOID');
    qryOrcamentoItem.Open;
  end;
end;

procedure TcadOrcamentoF.clientIDEdtChange(Sender: TObject);
begin

end;

procedure TcadOrcamentoF.imprimirBtnClick(Sender: TObject);
begin
  frOrcamentoItem.LoadFromFile('C:\Users\SaberTI\Desktop\projetoFinal\projetoFinal\RELATORIOS\relatorioOrcamentoitem.lrf');
  frOrcamentoItem.PrepareReport;
  frOrcamentoItem.ShowReport;
end;

procedure TcadOrcamentoF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryOrcamento.Close;
  qryOrcamentoItem.Close;
end;

procedure TcadOrcamentoF.FormCreate(Sender: TObject);
begin

end;

procedure TcadOrcamentoF.frDbOrcamentoItemCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;

procedure TcadOrcamentoF.deleteBtnClick(Sender: TObject);
begin
   if MessageDlg('Você tem certeza que deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    qryOrcamentoItem.Delete;
  end;
      CalcularTotalOrcamento;

end;

procedure TcadOrcamentoF.dsOrcamentoDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TcadOrcamentoF.dsOrcamentoItemDataChange(Sender: TObject;Field: TField);

begin

end;

procedure TcadOrcamentoF.bottomGroupBoxClick(Sender: TObject);
begin

end;

procedure TcadOrcamentoF.clientShowButtonClick(Sender: TObject);
begin
  seleClienteOrcaF := TseleClienteOrcaF.Create(self);
  seleClienteOrcaF.ShowModal;
end;

procedure TcadOrcamentoF.editButtonClick(Sender: TObject);
begin
  qryOrcamento.edit;
  qryOrcamento.Post;
end;

procedure TcadOrcamentoF.excludeButtonClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dsOrcamento.DataSet.Delete;
    dsOrcamentoItem.DataSet.Delete;
    mainPageControl.ActivePageIndex := 0;
  end;
end;

procedure TcadOrcamentoF.FormShow(Sender: TObject);
begin
  qryOrcamento.Open;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TcadOrcamentoF.goBackButtonClick(Sender: TObject);
begin
  inherited;
  qryOrcamento.Cancel;
end;

procedure TcadOrcamentoF.leaveButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TcadOrcamentoF.mainPageControlChange(Sender: TObject);
begin
  AbreOrcitens(qryOrcamentoorcamentoid.AsInteger);
end;

procedure TcadOrcamentoF.newButtonClick(Sender: TObject);
begin
  inherited;
  if qryOrcamento.State in [dsInsert, dsEdit] then;
  begin
    qryOrcamento.Cancel;
  end;
  qryOrcamentoItem.open;
  qryOrcamento.Insert;
  qryOrcamentoItem.Insert;
  AbreOrcitens(qryOrcamentoorcamentoid.AsInteger);
  qryOrcamento.FieldByName('DT_ORCAMENTO').AsDateTime := Trunc(Now);
  qryOrcamento.FieldByName('DT_VALIDADE_ORCAMENTO').AsDateTime := Trunc(Now) + 15;
end;

procedure TcadOrcamentoF.orcamentoItensGColExit(Sender: TObject);
begin

end;

procedure TcadOrcamentoF.orcamentoItensGDblClick(Sender: TObject);
begin
  qryOrcamento.Edit;
  qryOrcamentoItem.Edit;
  selecProdF := TselecProdF.Create(self);
  selecProdF.ShowModal;
end;

procedure TcadOrcamentoF.qryOrcamentoAfterInsert(DataSet: TDataSet);
begin
  qryOrcamentoORCAMENTOID.AsInteger := StrToInt(dataModuleMD.getSequence('orcamento_orcamentoid_seq'));
end;

procedure TcadOrcamentoF.qryOrcamentoAfterPost(DataSet: TDataSet);
begin
  CalcularTotalOrcamento;
end;

procedure TcadOrcamentoF.qryOrcamentoItemAfterInsert(DataSet: TDataSet);
begin
  qryOrcamentoItemorcamentoid.AsInteger := qryOrcamentoorcamentoid.AsInteger;
  qryOrcamentoItemorcamentoitemid.AsInteger := StrToInt(dataModuleMd.getSequence('orcamento_item_id'));
  qryOrcamentoItemVL_TOTAL.AsFloat := 0;
end;

procedure TcadOrcamentoF.qryOrcamentoItemAfterPost(DataSet: TDataSet);
begin

end;

procedure TcadOrcamentoF.registerTabContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: boolean);
begin

end;

procedure TcadOrcamentoF.saveButtonClick(Sender: TObject);
begin
  inherited;
  mainPageControl.ActivePageIndex := 0;
end;

procedure TcadOrcamentoF.searchButtonClick(Sender: TObject);
begin
  inherited;
  if searhEdt.Text <> '' then
    qryOrcamento.SQL.Text := 'select * from ORCAMENTO where ORCAMENTOID=' + searhEdt.Text
  else
    qryOrcamento.SQL.Text := 'select * from ORCAMENTO';
  qryOrcamento.Open;
end;

procedure TcadOrcamentoF.showGridDblClick(Sender: TObject);
begin
  AbreOrcitens(qryOrcamentoorcamentoid.AsInteger);
  qryOrcamentoitem.edit;
  mainPageControl.ActivePageIndex := 1;
end;

procedure TcadOrcamentoF.selecBtnClick(Sender: TObject);
begin
qryOrcamento.Edit;
  if qryOrcamentoItem.State = dsInsert then
  begin
       if qryOrcamentoCLIENTEID.AsInteger = 0 then
       begin
            ShowMessage('SELECIONE UM CLIENTE');
            exit;
       end;
       selecProdF := TselecProdF.Create(self);
       selecProdF.ShowModal;
  end
  else
  begin
    qryOrcamentoItem.Insert;
      if qryOrcamentoCLIENTEID.AsInteger = 0 then
      begin
           ShowMessage('SELECIONE UM CLIENTE');
           exit;
      end;
      selecProdF := TselecProdF.Create(self);
      selecProdF.ShowModal;
  end;
end;

procedure TcadOrcamentoF.toGBClick(Sender: TObject);
begin

end;

end.
