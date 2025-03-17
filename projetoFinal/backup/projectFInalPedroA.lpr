program projectFInalPedroA;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, xCadPaiU, dataModuleU, mainMenuU, cadastroU, cadCategoriaU,
  cadProdutosU, seleCadProdU, cadUsuariosU, cadOrcamentoU, seleClienteOrcaU,
  selecProdOrcaU, relaClienteU, relProdU, relOrca, relCatU, sobreU, 
loginScreenU, selecProdU;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdataModuleMD, dataModuleMD);
  Application.CreateForm(TloginScreenF, loginScreenF);
  Application.Run;
end.

