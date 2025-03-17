unit xCadPaiU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ComCtrls,
  StdCtrls, DBGrids;

type

  { TxCadPai }

  TxCadPai = class(TForm)
    excludeButton: TSpeedButton;
    goBackButton: TSpeedButton;
    leaveButton: TSpeedButton;
    editButton: TSpeedButton;
    showGrid: TDBGrid;
    Label1: TLabel;
    searhEdt: TEdit;
    searchButton: TSpeedButton;
    newButton: TSpeedButton;
    saveButton: TSpeedButton;
    topGroupBox: TGroupBox;
    mainPageControl: TPageControl;
    searchTab: TTabSheet;
    registerTab: TTabSheet;
    bottomGroupBox: TGroupBox;
    procedure goBackButtonClick(Sender: TObject);
    procedure newButtonClick(Sender: TObject);
    procedure saveButtonClick(Sender: TObject);
    procedure searchButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  xCadPai: TxCadPai;

implementation

{$R *.lfm}

{ TxCadPai }

procedure TxCadPai.SpeedButton1Click(Sender: TObject);
begin

end;

procedure TxCadPai.searchButtonClick(Sender: TObject);
begin

end;

procedure TxCadPai.newButtonClick(Sender: TObject);
begin
  mainPageControl.ActivePageIndex := 1;
end;

procedure TxCadPai.goBackButtonClick(Sender: TObject);
begin
  mainPageControl.ActivePageIndex := 0;
end;


procedure TxCadPai.saveButtonClick(Sender: TObject);
begin
  mainPageControl.ActivePageIndex := 0;
end;

end.

