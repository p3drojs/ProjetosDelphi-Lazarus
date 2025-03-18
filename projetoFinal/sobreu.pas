unit sobreU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TsobreF }

  TsobreF = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  sobreF: TsobreF;

implementation

{$R *.lfm}

{ TsobreF }

procedure TsobreF.Memo1Change(Sender: TObject);
begin

end;

end.

