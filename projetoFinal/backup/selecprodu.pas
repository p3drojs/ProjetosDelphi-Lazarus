unit selecProdU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  Buttons, selecProdOrcaU;

type

  { TselecProdF }

  TselecProdF = class(TForm)
    confirmBtn: TBitBtn;
    cancelBtn: TBitBtn;
    searchProdBtn: TButton;
    idProdEdt: TDBEdit;
    descProdEdt: TDBEdit;
    qtdProdEdt: TDBEdit;
    vlUniEdt: TDBEdit;
    vlTotalEdt: TDBEdit;
    qtdProdLabel: TLabel;
    vlUniLabel: TLabel;
    vlTotalLabel: TLabel;
    descProdLabel: TLabel;
    idProdLabel: TLabel;
    procedure cancelBtnClick(Sender: TObject);
    procedure confirmBtnClick(Sender: TObject);
    procedure descProdEdtChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure idProdEdtChange(Sender: TObject);
    procedure qtdProdEdtChange(Sender: TObject);
    procedure qtdProdEdtEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure qtdProdEdtEnter(Sender: TObject);
    procedure qtdProdEdtExit(Sender: TObject);
    procedure searchProdBtnClick(Sender: TObject);
  private

  public

  end;

var
  selecProdF: TselecProdF;

implementation

uses cadOrcamentoU;

{$R *.lfm}

{ TselecProdF }

procedure TselecProdF.searchProdBtnClick(Sender: TObject);
begin
   selecProdOrcaF := TselecProdOrcaF.create(self);
   selecProdOrcaF.ShowModal;
end;

procedure TselecProdF.idProdEdtChange(Sender: TObject);
begin

end;

procedure TselecProdF.qtdProdEdtChange(Sender: TObject);
begin


end;

procedure TselecProdF.qtdProdEdtEndDrag(Sender, Target: TObject; X, Y: Integer);
begin

end;

procedure TselecProdF.qtdProdEdtEnter(Sender: TObject);
begin

end;

procedure TselecProdF.qtdProdEdtExit(Sender: TObject);
begin
  cadOrcamentoF.qryOrcamentoItemvl_total.AsFloat := cadOrcamentoF.qryOrcamentoItemvl_unitario.AsFloat * cadOrcamentoF.qryOrcamentoItem.FieldByName('QT_PRODUTO').Asinteger;
end;

procedure TselecProdF.confirmBtnClick(Sender: TObject);
begin
  if cadOrcamentoF.qryOrcamentoItemqt_produto.AsInteger = 0 then
  begin
    showMessage('PREENCHA A QUANTIDADE');
    qtdProdEdt.setfocus;
    Abort;
  end;
  cadOrcamentoF.qryOrcamentovl_total_orcamento.AsFloat := cadOrcamentoF.qryOrcamentovl_total_orcamento.AsFloat + cadOrcamentoF.qryOrcamentoItemvl_total.AsFloat;
  cadOrcamentoF.qryOrcamentoItem.Post;
  cadOrcamentoF.qryOrcamento.Post;
  close;
end;

procedure TselecProdF.descProdEdtChange(Sender: TObject);
begin

end;

procedure TselecProdF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TselecProdF.FormCreate(Sender: TObject);
begin

end;

procedure TselecProdF.FormShow(Sender: TObject);
begin
  cadOrcamentoF.qryOrcamentoItem.Edit;
  cadOrcamentoF.qryOrcamentoItem.FieldByName('QT_PRODUTO').Asinteger := 0;
end;

procedure TselecProdF.cancelBtnClick(Sender: TObject);
begin
  cadOrcamentoF.qryOrcamentoItem.cancel;
  close;
end;

end.

