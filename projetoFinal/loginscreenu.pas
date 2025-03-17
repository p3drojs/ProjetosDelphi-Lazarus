unit loginScreenU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ZDataset,mainMenuU, DB;

type

  { TloginScreenF }

  TloginScreenF = class(TForm)
    leaveBtn: TButton;
    nameEdt: TEdit;
    passWordEdt: TEdit;
    loginBtn: TBitBtn;
    accionImg: TImage;
    qryLogin: TZQuery;
    procedure accionImgClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure forgetPassWordBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure leaveBtnClick(Sender: TObject);
    procedure loginBtnClick(Sender: TObject);
    procedure loginGBClick(Sender: TObject);
  private

  public

  end;

var
  loginScreenF: TloginScreenF;

implementation

{$R *.lfm}

{ TloginScreenF }

procedure TloginScreenF.loginBtnClick(Sender: TObject);
begin
   if ((nameEdt.text = '') or (passWordEdt.text = '')) then
   begin
     ShowMessage('Preencha todos os campos');
     exit;
   end;

   qryLogin.close;
   qryLogin.SQL.Clear;
   qryLogin.SQL.add('SELECT ID AS NUMBER '+
                    'FROM USUARIOS ' +
                    'WHERE USUARIO = ' + QuotedStr(nameEdt.text) + ' ' +
                    'AND SENHA = ' + QuotedStr(passWordEdt.text));
   qryLogin.open;
   if qryLogin.IsEmpty then
   begin
        ShowMessage('SENHA OU USUARIOS INCORRETOS');
        exit;
   end
   else
   begin
         mainMenuF := TmainMenuF.create(self);
         mainMenuF.ShowModal;
   end;

end;

procedure TloginScreenF.loginGBClick(Sender: TObject);
begin

end;

procedure TloginScreenF.forgetPassWordBtnClick(Sender: TObject);
begin

end;

procedure TloginScreenF.Button1Click(Sender: TObject);
begin
   mainMenuF := TmainMenuF.create(self);
   mainMenuF.ShowModal;
end;

procedure TloginScreenF.accionImgClick(Sender: TObject);
begin
   mainMenuF := TmainMenuF.create(self);
   mainMenuF.ShowModal;
end;

procedure TloginScreenF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   qryLogin.close;
end;

procedure TloginScreenF.leaveBtnClick(Sender: TObject);
begin
  Application.terminate;
end;

end.

