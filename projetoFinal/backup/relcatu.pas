unit relCatU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  ZAbstractRODataset, LR_Class, LR_DBSet, LR_DSet;

type

  { TrelCatF }

  TrelCatF = class(TForm)
    qryRelCatcategoriaprodutoid: TZIntegerField;
    qryRelCatds_categoria_produto: TZRawStringField;
    relCatBtn: TBitBtn;
    frDbRelCat: TfrDBDataSet;
    frRelCat: TfrReport;
    qryRelCat: TZQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frDbRelCatCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure relCatBtnClick(Sender: TObject);
  private

  public

  end;

var
  relCatF: TrelCatF;

implementation

{$R *.lfm}

{ TrelCatF }

procedure TrelCatF.relCatBtnClick(Sender: TObject);
begin
   frRelCat.LoadFromFile('C:\Users\professor\Documents\Pedro\projetoFinal\RELATORIOS\relatorioCategorias.lrf');
   frRelCat.PrepareReport;
   frRelCat.ShowReport;
end;

procedure TrelCatF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   qryRelCat.Close;
end;

procedure TrelCatF.FormCreate(Sender: TObject);
begin
   qryRelCat.Open;
end;

procedure TrelCatF.frDbRelCatCheckEOF(Sender: TObject; var Eof: Boolean);
begin

end;

end.

