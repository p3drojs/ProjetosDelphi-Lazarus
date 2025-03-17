unit seleClienteOrcaU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  Buttons, ZDataset, ZSqlUpdate, ZAbstractRODataset;

type

  { TseleClienteOrcaF }

  TseleClienteOrcaF = class(TForm)
    dsSeleClienteOrcaU: TDataSource;
    qrySeleClienteOrcaclienteid: TZIntegerField;
    qrySeleClienteOrcacpf_cnpj_cliente: TZRawStringField;
    qrySeleClienteOrcanome_cliente: TZRawStringField;
    qrySeleClienteOrcatipo_cliente: TZRawStringField;
    searchLabel: TLabel;
    searchEdt: TEdit;
    showClientsGrid: TDBGrid;
    searchButton: TSpeedButton;
    selecBtn: TSpeedButton;
    goBackBtn: TSpeedButton;
    topGB: TGroupBox;
    bottomGB: TGroupBox;
    qrySeleClienteOrca: TZQuery;
    updSeleClienteOrcaU: TZUpdateSQL;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure goBackBtnClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure selecBtnClick(Sender: TObject);
    procedure showClientsGridDblClick(Sender: TObject);
  private

  public

  end;

var
  seleClienteOrcaF: TseleClienteOrcaF;

implementation

uses cadOrcamentoU;

{$R *.lfm}

{ TseleClienteOrcaF }

procedure TseleClienteOrcaF.FormCreate(Sender: TObject);
begin
  qrySeleClienteOrca.Open;
end;

procedure TseleClienteOrcaF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qrySeleClienteOrca.close;
end;
//CHECAR CLIENTS, DELETE

procedure TseleClienteOrcaF.goBackBtnClick(Sender: TObject);
begin
  close;
end;

procedure TseleClienteOrcaF.searchButtonClick(Sender: TObject);
begin
  if searchEdt.Text <> '' then
    qrySeleClienteOrca.SQL.Text := 'select * from CLIENTE where CLIENTEID=' + searchEdt.Text
  else
    qrySeleClienteOrca.SQL.Text := 'select * from CLIENTE';
  qrySeleClienteOrca.Open;
end;

procedure TseleClienteOrcaF.selecBtnClick(Sender: TObject);
begin
   cadOrcamentoF.qryOrcamentoCLIENTEID.AsInteger := qrySeleClienteOrca.FieldByName('CLIENTEID').AsInteger;
   close;
end;

procedure TseleClienteOrcaF.showClientsGridDblClick(Sender: TObject);
begin
  cadOrcamentoF.qryOrcamentoCLIENTEID.AsInteger := qrySeleClienteOrca.FieldByName('CLIENTEID').AsInteger;
  close;
end;

end.

