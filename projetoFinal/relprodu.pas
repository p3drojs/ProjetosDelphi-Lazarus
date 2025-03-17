unit relProdU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  ZAbstractRODataset, LR_Class, LR_DBSet;

type

  { TrelProdF }

  TrelProdF = class(TForm)
    prodBtn: TBitBtn;
    frDbRelProd: TfrDBDataSet;
    frRelProd: TfrReport;
    qryRelProd: TZQuery;
    qryRelProdcategoriaprodutoid: TZIntegerField;
    qryRelProdds_produto: TZRawStringField;
    qryRelProddt_cadastro_produto: TZDateTimeField;
    qryRelProdobs_produto: TZRawStringField;
    qryRelProdprodutoid: TZIntegerField;
    qryRelProdstatus_produto: TZRawStringField;
    qryRelProdvl_venda_produto: TZBCDField;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure prodBtnClick(Sender: TObject);
  private

  public

  end;

var
  relProdF: TrelProdF;

implementation

{$R *.lfm}

{ TrelProdF }

procedure TrelProdF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryRelProd.close;
end;

procedure TrelProdF.FormCreate(Sender: TObject);
begin
  qryRelProd.Open;
end;

procedure TrelProdF.prodBtnClick(Sender: TObject);
begin
   frRelProd.LoadFromFile('C:\Users\professor\Documents\Pedro\projetoFinal\RELATORIOS\relatorioProdutos.lrf');
   frRelProd.PrepareReport;
   frRelProd.ShowReport;
end;

end.

