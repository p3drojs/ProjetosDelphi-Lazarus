unit relOrca;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, LR_Class,
  LR_DBSet, ZDataset, ZAbstractRODataset;

type

  { TrelOrcaF }

  TrelOrcaF = class(TForm)
    frRelOrca: TfrReport;
    qryRelOrcaclienteid: TZIntegerField;
    qryRelOrcadt_orcamento: TZDateTimeField;
    qryRelOrcadt_validade_orcamento: TZDateTimeField;
    qryRelOrcaorcamentoid: TZIntegerField;
    qryRelOrcavl_total_orcamento: TZBCDField;
    relOrcaBtn: TBitBtn;
    frDbRelOrca: TfrDBDataSet;
    qryRelOrca: TZQuery;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure relOrcaBtnClick(Sender: TObject);
  private

  public

  end;

var
  relOrcaF: TrelOrcaF;

implementation

{$R *.lfm}

{ TrelOrcaF }

procedure TrelOrcaF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
    qryRelOrca.close;
end;

procedure TrelOrcaF.FormCreate(Sender: TObject);
begin
    qryRelOrca.open;
end;

procedure TrelOrcaF.relOrcaBtnClick(Sender: TObject);
begin
   frrelOrca.LoadFromFile('C:\Users\professor\Documents\Pedro\projetoFinal\RELATORIOS\relatorioOrcamento.lrf');
   frrelOrca.PrepareReport;
   frrelOrca.ShowReport;
end;

end.

