unit seleCadProdU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, DBGrids, ZDataset, ZAbstractRODataset, cadCategoriaU;

type


  { TselectCadF }

  TselectCadF = class(TForm)
    saveBtn: TButton;
    dsCategoriasProd: TDataSource;
    gridCatProd: TDBGrid;
    qryCatProdcategoriaprodutoid: TZIntegerField;
    qryCatProdds_categoria_produto: TZRawStringField;
    searchCatEdt: TEdit;
    searchCatLabel: TLabel;
    searchCatBtn: TSpeedButton;
    topGB: TGroupBox;
    bottomGB: TGroupBox;
    mainPageSelectCat: TPageControl;
    searchCat: TTabSheet;
    qryCatProd: TZQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridCatProdDblClick(Sender: TObject);
    procedure saveBtnClick(Sender: TObject);
    procedure searchCatEdtChange(Sender: TObject);
  private

  public

  end;

var
  selectCadF: TselectCadF;

implementation

uses cadProdutosU;

{$R *.lfm}

{ TselectCadF }

procedure TselectCadF.searchCatEdtChange(Sender: TObject);
begin
   if searchCatEdt.Text <> '' then
    qryCatProd.SQL.Text := 'select * from CATEGORIA_PRODUTO where CATEGORIAPRODUTOID=' + searchCatEdt.Text
  else
    qryCatProd.SQL.Text := 'select * from CATEGORIA_PRODUTO';
  qryCatProd.Open;
end;

procedure TselectCadF.gridCatProdDblClick(Sender: TObject);
begin
  cadProdutosF.qryProdutoscategoriaprodutoid.AsString := qryCatProd.FieldByName('categoriaprodutoid').AsString;
  close;
end;

procedure TselectCadF.saveBtnClick(Sender: TObject);
begin
   cadProdutosF.qryProdutoscategoriaprodutoid.AsString := qryCatProd.FieldByName('categoriaprodutoid').AsString;
   close;
end;

procedure TselectCadF.FormShow(Sender: TObject);
begin
  qryCatProd.Open;
end;

procedure TselectCadF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryCatProd.close;
end;

end.

