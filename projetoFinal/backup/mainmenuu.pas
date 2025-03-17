unit mainMenuU;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, LR_DBSet,
  LR_Class, ZDataset, ZAbstractRODataset, cadastroU, cadCategoriaU,
  cadProdutosU, cadUsuariosU, cadOrcamentoU, relaClienteU, relProdU, relOrca,
  relCatU, sobreU;

type

  { TmainMenuF }

  TmainMenuF = class(TForm)
    frDBCategorias: TfrDBDataSet;
    frDBRelProdutos: TfrDBDataSet;
    frDBRelrcamentos: TfrDBDataSet;
    frDBRelClientes: TfrDBDataSet;
    frRelClientes: TfrReport;
    frRelOrcamento: TfrReport;
    frRelCategorias: TfrReport;
    frRelProdutos: TfrReport;
    MainMenu1: TMainMenu;
    leaveButton: TMenuItem;
    clientsSubMenu: TMenuItem;
    catSubMenu: TMenuItem;
    clientesSubMenu: TMenuItem;
    prodSubMenu: TMenuItem;
    catRelSubMenu: TMenuItem;
    orcaRelSubMenu: TMenuItem;
    orcaSubMenu: TMenuItem;
    productSubMenu: TMenuItem;
    qryRelCategoriascategoriaprodutoid: TZIntegerField;
    qryRelCategoriasds_categoria_produto: TZRawStringField;
    qryRelOrcamentosclienteid: TZIntegerField;
    qryRelOrcamentosdt_orcamento: TZDateTimeField;
    qryRelOrcamentosdt_validade_orcamento: TZDateTimeField;
    qryRelOrcamentosorcamentoid: TZIntegerField;
    qryRelOrcamentosvl_total_orcamento: TZBCDField;
    qryRelClientesclienteid: TZIntegerField;
    qryRelClientescpf_cnpj_cliente: TZRawStringField;
    qryRelClientesnome_cliente: TZRawStringField;
    qryRelClientestipo_cliente: TZRawStringField;
    qryRelProdutoscategoriaprodutoid: TZIntegerField;
    qryRelProdutosds_produto: TZRawStringField;
    qryRelProdutosdt_cadastro_produto: TZDateTimeField;
    qryRelProdutosobs_produto: TZRawStringField;
    qryRelProdutosprodutoid: TZIntegerField;
    qryRelProdutosstatus_produto: TZRawStringField;
    qryRelProdutosvl_venda_produto: TZBCDField;
    userSubMenu: TMenuItem;
    sellsMenu: TMenuItem;
    registerMenu: TMenuItem;
    relatorMenu: TMenuItem;
    sobreMenu: TMenuItem;
    qryRelClientes: TZQuery;
    qryRelOrcamentos: TZQuery;
    qryRelCategorias: TZQuery;
    qryRelProdutos: TZQuery;
    procedure catRelSubMenuClick(Sender: TObject);
    procedure catSubMenuClick(Sender: TObject);
    procedure clientesSubMenuClick(Sender: TObject);
    procedure clientsSubMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure leaveButtonClick(Sender: TObject);
    procedure orcaMenuClick(Sender: TObject);
    procedure orcaRelSubMenuClick(Sender: TObject);
    procedure orcaSubMenuClick(Sender: TObject);
    procedure prodSubMenuClick(Sender: TObject);
    procedure productSubMenuClick(Sender: TObject);
    procedure sobreMenuClick(Sender: TObject);
    procedure userSubMenuClick(Sender: TObject);
  private

  public

  end;

var
  mainMenuF: TmainMenuF;

implementation

uses loginScreenU;
//RELATORIOS LINKAR NO MENU E FAZER RELATORIO DO ORÇAMENTO ITENS

{$R *.lfm}

{ TmainMenuF }

procedure TmainMenuF.leaveButtonClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TmainMenuF.orcaMenuClick(Sender: TObject);
begin
   //pente fino, orcamento valor total ver
end;

procedure TmainMenuF.orcaRelSubMenuClick(Sender: TObject);
begin
  frRelOrcamento.LoadFromFile('C:\Users\SaberTI\Desktop\projetoFinal\projetoFinal\RELATORIOS\relatorioProdutos.lrf');
  frRelProdutos.PrepareReport;
  frRelProdutos.ShowReport
end;

procedure TmainMenuF.orcaSubMenuClick(Sender: TObject);
begin
  cadOrcamentoF := TcadOrcamentoF.create(self);
  cadOrcamentoF.ShowModal;
end;

procedure TmainMenuF.prodSubMenuClick(Sender: TObject);
begin
  frRelProdutos.LoadFromFile('C:\Users\SaberTI\Desktop\projetoFinal\projetoFinal\RELATORIOS\relatorioProdutos.lrf');
  frRelProdutos.PrepareReport;
  frRelProdutos.ShowReport
end;

procedure TmainMenuF.productSubMenuClick(Sender: TObject);
begin
    cadProdutosF := TcadProdutosF.create(self);
    cadProdutosF.ShowModal;
end;

procedure TmainMenuF.sobreMenuClick(Sender: TObject);
begin
   sobreF := TsobreF.create(self);
   sobreF.ShowModal;
end;

procedure TmainMenuF.userSubMenuClick(Sender: TObject);
begin
   cadUsuariosF := TcadUsuariosF.create(self);
   cadUsuariosF.ShowModal;
end;

procedure TmainMenuF.clientsSubMenuClick(Sender: TObject);
begin
  registerTabF := TregisterTabF.Create(Self);
  registerTabF.ShowModal;
end;

procedure TmainMenuF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TmainMenuF.FormCreate(Sender: TObject);
begin

end;

procedure TmainMenuF.FormShow(Sender: TObject);
begin

end;

procedure TmainMenuF.catSubMenuClick(Sender: TObject);
begin
  cadCategoriasF := TcadCategoriasF.Create(Self);
  cadCategoriasF.ShowModal;
end;

procedure TmainMenuF.catRelSubMenuClick(Sender: TObject);
begin

end;

procedure TmainMenuF.clientesSubMenuClick(Sender: TObject);
begin
  frRelClientes.LoadFromFile('C:\Users\SaberTI\Desktop\projetoFinal\projetoFinal\RELATORIOS\relatorioClientes.lrf');
  frRelClientes.PrepareReport;
  frRelClientes.ShowReport;
end;

end.
