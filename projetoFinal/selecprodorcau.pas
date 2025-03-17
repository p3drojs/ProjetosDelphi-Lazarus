unit selecProdOrcaU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  Buttons, ZDataset, ZSqlUpdate, ZAbstractRODataset;

type

  { TselecProdOrcaF }

  TselecProdOrcaF = class(TForm)
    BitBtn1: TBitBtn;
    dsSelecProd: TDataSource;
    qrySelecProdcategoriaprodutoid: TZIntegerField;
    qrySelecProdds_produto: TZRawStringField;
    qrySelecProddt_cadastro_produto: TZDateTimeField;
    qrySelecProdobs_produto: TZRawStringField;
    qrySelecProdprodutoid: TZIntegerField;
    qrySelecProdstatus_produto: TZRawStringField;
    qrySelecProdvl_venda_produto: TZBCDField;
    searchEdt: TEdit;
    searchLabel: TLabel;
    showProdGrid: TDBGrid;
    searchBtn: TSpeedButton;
    topGB: TGroupBox;
    bottomGB: TGroupBox;
    qrySelecProd: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure searchBtnClick(Sender: TObject);
    procedure searchBtnDblClick(Sender: TObject);
    procedure showProdGridDblClick(Sender: TObject);
    procedure topGBClick(Sender: TObject);
  private

  public

  end;

var
  selecProdOrcaF: TselecProdOrcaF;

implementation
uses selecProdU, cadOrcamentoU;

{$R *.lfm}

{ TselecProdOrcaF }

procedure TselecProdOrcaF.FormCreate(Sender: TObject);
begin

end;

procedure TselecProdOrcaF.FormShow(Sender: TObject);
begin
  qrySelecProd.Open;
end;

procedure TselecProdOrcaF.searchBtnClick(Sender: TObject);
begin
  if searchEdt.Text <> '' then
    qrySelecProd.SQL.Text := 'select * from PRODUTO where PRODUTOID=' + searchEdt.Text
  else
    qrySelecProd.SQL.Text := 'select * from PRODUTO';
  qrySelecProd.Open;
end;

procedure TselecProdOrcaF.searchBtnDblClick(Sender: TObject);
begin


end;

procedure TselecProdOrcaF.showProdGridDblClick(Sender: TObject);
begin
  if qrySelecProd.FieldByName('STATUS_PRODUTO').AsString = 'INATIVO' then
    begin
         ShowMessage('PRODUTO COM STATUS INATIVO');
         exit
    end;
  cadOrcamentoF.qryOrcamentoItemPRODUTOID.AsString := qrySelecProd.FieldByName('PRODUTOID').AsString;
  cadOrcamentoF.qryOrcamentoItemVL_UNITARIO.AsString := qrySelecProd.FieldByName('VL_VENDA_PRODUTO').AsString;
  cadOrcamentoF.qryOrcamentoItemprodutodesc.AsString := qrySelecProd.FieldByName('DS_PRODUTO').AsString;
  close;
end;

procedure TselecProdOrcaF.topGBClick(Sender: TObject);
begin

end;

procedure TselecProdOrcaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
    qrySelecProd.close;
end;

procedure TselecProdOrcaF.BitBtn1Click(Sender: TObject);
begin
  if qrySelecProd.FieldByName('STATUS_PRODUTO').AsString = 'INATIVO' then
    begin
         ShowMessage('PRODUTO COM STATUS INATIVO');
         exit
    end;
  cadOrcamentoF.qryOrcamentoItemPRODUTOID.AsString := qrySelecProd.FieldByName('PRODUTOID').AsString;
  cadOrcamentoF.qryOrcamentoItemVL_UNITARIO.AsString := qrySelecProd.FieldByName('VL_VENDA_PRODUTO').AsString;
  cadOrcamentoF.qryOrcamentoItemprodutodesc.AsString := qrySelecProd.FieldByName('DS_PRODUTO').AsString;
  close;
end;

end.

