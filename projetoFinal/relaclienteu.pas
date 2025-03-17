unit relaClienteU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ZDataset,
  ZAbstractRODataset, LR_Class, LR_DBSet, dataModuleU;

type

  { TrelaClientesF }

  TrelaClientesF = class(TForm)
    frDbClientes: TfrDBDataSet;
    frClientes: TfrReport;
    qryClientesRelaclienteid: TZIntegerField;
    qryClientesRelacpf_cnpj_cliente: TZRawStringField;
    qryClientesRelanome_cliente: TZRawStringField;
    qryClientesRelatipo_cliente: TZRawStringField;
    relaBtn: TBitBtn;
    qryClientesRela: TZQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure relaBtnClick(Sender: TObject);
  private

  public

  end;

var
  relaClientesF: TrelaClientesF;

implementation

{$R *.lfm}

{ TrelaClientesF }

procedure TrelaClientesF.relaBtnClick(Sender: TObject);
begin
   frClientes.LoadFromFile('C:\Users\professor\Documents\Pedro\projetoFinal\RELATORIOS\relatorioClientes.lrf');
   frClientes.PrepareReport;
   frClientes.ShowReport;
end;

procedure TrelaClientesF.FormCreate(Sender: TObject);
begin
   qryClientesRela.Open;
end;

procedure TrelaClientesF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
   qryClientesRela.Close;
end;

end.

