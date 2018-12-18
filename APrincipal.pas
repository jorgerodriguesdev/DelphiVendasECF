unit APrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBTables, ComCtrls, ExtCtrls, StdCtrls, Buttons,  formulariosFundo, Formularios,
  ToolWin, ExtDlgs, Inifiles, constMsg, FunObjeto, Db, DBCtrls, Grids,
  DBGrids, Componentes1, PainelGradiente, Tabela, Localizacao,
  Mask, UnPrincipal, jpeg, LabelCorMove, Formatar, numericos;

const
  CampoPermissaoModulo = 'c_mod_pon';
  CampoFormModulos = 'c_mod_pon';
  NomeModulo = 'Ponto Loja';

type
  TFPrincipal = class(TFormularioFundo)
    Menu: TMainMenu;
    MFAlteraSenha: TMenuItem;
    MAjuda: TMenuItem;
    BaseDados: TDatabase;
    BarraStatus: TStatusBar;
    MArquivo: TMenuItem;
    MSair: TMenuItem;
    N1: TMenuItem;
    MSobre: TMenuItem;
    MFAlterarFilialUso: TMenuItem;
    CorFoco: TCorFoco;
    CorForm: TCorForm;
    CorPainelGra: TCorPainelGra;
    MFAbertura: TMenuItem;
    N6: TMenuItem;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    MCadastros: TMenuItem;
    N2: TMenuItem;
    MFCadPaises: TMenuItem;
    MFCadEstados: TMenuItem;
    MFCidades: TMenuItem;
    MFEventos: TMenuItem;
    MFProfissoes: TMenuItem;
    MFSituacoesClientes: TMenuItem;
    MFClientes: TMenuItem;
    N4: TMenuItem;
    MFTransportadoras: TMenuItem;
    MFUsuarioMenu: TMenuItem;
    MCotacao: TMenuItem;
    MFConsultaPrecosProdutos: TMenuItem;
    MFSituacoes: TMenuItem;
    MFVendedores: TMenuItem;
    MFCondicoesPagamentos: TMenuItem;
    MFCotacao: TMenuItem;
    MFNovaCotacao: TMenuItem;
    MFNovaCotacao1: TMenuItem;
    MProdutos: TMenuItem;
    MFProdutos: TMenuItem;
    MFAdicionaProdFilial: TMenuItem;
    MFTabelaPreco: TMenuItem;
    MFFormacaoPreco: TMenuItem;
    MServico: TMenuItem;
    MFServicos: TMenuItem;
    MFFormacaoPrecoServico: TMenuItem;
    MFlocalizaServico: TMenuItem;
    MFaturamento: TMenuItem;
    MFNovaNotaFiscal: TMenuItem;
    MFVendaECF: TMenuItem;
    BaseEndereco: TDatabase;
    MImpDocumentos: TMenuItem;
    Manual1: TMenuItem;
    MFMostraEnvelope: TMenuItem;
    MFMostraRecibo: TMenuItem;
    MFMostraNotaPromissoria: TMenuItem;
    MFMostraCarne: TMenuItem;
    MFMostraBoleto: TMenuItem;
    MFMostraCheque: TMenuItem;
    MFMostraduplicata: TMenuItem;
    MFImprimeEnvelope: TMenuItem;
    MFImprimeCarne: TMenuItem;
    MFImprimeBoleto: TMenuItem;
    MCaixa: TMenuItem;
    MFAbreCaixa: TMenuItem;
    MFFechaCaixa: TMenuItem;
    N7: TMenuItem;
    MFNaturezas: TMenuItem;
    MFFormasPagamento: TMenuItem;
    MFSangriaSuprimento: TMenuItem;
    MFAbreCaixa1: TMenuItem;
    MFFechaCaixa1: TMenuItem;
    MFItensCaixa: TMenuItem;
    MAcionaGaveta: TMenuItem;
    MFAlteraItemCaixa: TMenuItem;
    MFMovimentoCaixa: TMenuItem;
    MFCadCaixas: TMenuItem;
    MAdministracao: TMenuItem;
    BMFProdutos: TSpeedButton;
    BMFVendaECF: TSpeedButton;
    BMFClientes: TSpeedButton;
    BMFNovaNotaFiscal: TSpeedButton;
    BMFNovaCotacao: TSpeedButton;
    BMFItensCaixa: TSpeedButton;
    BSaida: TSpeedButton;
    BMFConsultaPrecosProdutos: TSpeedButton;
    MFLeituraECF: TMenuItem;
    MFBancos: TMenuItem;
    MFCadTipoOperacao: TMenuItem;
    MVenda: TMenuItem;
    MFConsultaVendaPeriodo: TMenuItem;
    MFDocumentosRecebidos: TMenuItem;
    N8: TMenuItem;
    MFConsultaTEF: TMenuItem;
    MCartao: TMenuItem;
    MFCartao: TMenuItem;
    MFTipoTransacaoCartao: TMenuItem;
    MFRegiaoVenda: TMenuItem;
    MFVisualizaCupom: TMenuItem;
    Aux: TQuery;
    BMAdministracao: TSpeedButton;
    Ajuda1: TMenuItem;
    ndice1: TMenuItem;
    N9: TMenuItem;
    MFUnidades: TMenuItem;
    MFBackup: TMenuItem;
    MFCadIcmsEstado: TMenuItem;
    Bloquear1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    MFImprimeCodigoBarra: TMenuItem;
    MFHistoricoCliente: TMenuItem;
    MFMovHistoricoCliente: TMenuItem;
    MFconsultaHistorico: TMenuItem;
    MFConsultaAgenda: TMenuItem;
    N12: TMenuItem;
    Clientes1: TMenuItem;
    N13: TMenuItem;
    ClienteseFornecedores1: TMenuItem;
    MFAniversariante: TMenuItem;
    N14: TMenuItem;
    MFMovHistoricoCliente1: TMenuItem;
    MFEtiquetaClientes: TMenuItem;
    MFNovoProduto: TMenuItem;
    MFMovVendedorCliente: TMenuItem;
    MRelatorios: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes2: TMenuItem;
    MProdutosRel: TMenuItem;
    MEstoqueRel: TMenuItem;
    MServicosRel: TMenuItem;
    MNotaFiscalRel: TMenuItem;
    MFaturamentoRel: TMenuItem;
    MPedidosRel: TMenuItem;
    MOramentosRel: TMenuItem;
    MCupomFiscalRel: TMenuItem;
    MCaixaRel: TMenuItem;
    MFAdicionaClientesARegiao: TMenuItem;
    MFClientesTabelaPreco: TMenuItem;
    MFNovaNotaFiscal1: TMenuItem;
    MFNovaNotaFiscal2: TMenuItem;
    MFNovaNotaFiscal3: TMenuItem;
    MFNovaNotaFiscal5: TMenuItem;
    N5: TMenuItem;
    ManutenodeNotaeCupomFiscal1: TMenuItem;
    MFNovaNotaFiscal4: TMenuItem;
    MFCadItemPedido: TMenuItem;
    MFConsultaNotasFiscais: TMenuItem;
    MFImprimeNotas: TMenuItem;
    MFDemonstrativoFaturamento: TMenuItem;
    N15: TMenuItem;
    MFControleLigacao: TMenuItem;
    MFConsultaLigacao: TMenuItem;
    N16: TMenuItem;
    MFMostraRecados: TMenuItem;
    MFListaTelefonica: TMenuItem;
    MFCotacao1: TMenuItem;
    N17: TMenuItem;
    procedure MostraHint(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure ndice1Click(Sender: TObject);
    procedure MRelatoriosClick(Sender: TObject);
  private
    TipoSistema : string;
    procedure VerificaTransacaoPendente;
  public
     CodProduto : string;
     UnPri : TFuncoesPrincipal;
     VersaoSistema : Integer;
     function AbreBaseDados( Alias : string ) : Boolean;
     procedure AlteraNomeEmpresa;
     Function  VerificaPermisao( nome : string ) : Boolean;
     procedure erro(Sender: TObject; E: Exception);
     procedure abre(var Msg: TMsg; var Handled: Boolean);
     procedure VerificaMoeda;
     procedure ValidaBotoesGrupos( botoes : array of TComponent);
     procedure TeclaPressionada(var Msg: TWMKey; var Handled: Boolean);
     procedure AcionaGaveta;
     procedure SolicitacaoAdministrativaTEF;
     procedure VerificaPendenciaTEF_ECF;
     procedure ConfiguracaoModulos;
     procedure OrganizaBotoes;
     procedure CriaRelatorio(Sender: TObject);
     procedure CriaRelatorioGeral(Sender: TObject);

  end;


var
  FPrincipal: TFPrincipal;
  Ini : TInifile;

implementation

uses funString,UnEcf, unTEF, Constantes, UnRegistro, funsql, FunSistema,UnNotaFiscal, UnCotacao,
     Abertura, AAlterarSenha, ASobre, FunIni, AAlterarFilialUso,
      AProfissoes, ASituacoesClientes,
      AClientes, ACadPaises, ACadEstados, ACadCidades,
      AEventos,  ATransportadoras, Registry,
       UsuarioMenu, AConsultaPrecosProdutos, ASituacoes,
  AVendedores, ACondicoesPgtos, ALocalizaProdutos, ACotacao, ANovaCotacao,
  AProdutos, AAdicionaProdFilial, ATabelaPreco, AFormacaoPreco, AServicos,
  AFormacaoPrecoServico, ALocalizaServico, ANovaNotaFiscal, AVendaECF,
  AImprimeBoleto, AImprimeCarne, AImprimeEnvelope, AMostraDuplicata,
  AMostraCheque, AMostraBoleto, AMostraCarne, AMostraNotaPromissoria,
  AMostraRecibo, AMostraEnvelope, AAbreCaixa, AFechaCaixa, ANaturezas,
  AFormasPagamento, ASangriaSuprimento, AItensCaixa, AAlteraItens,
  AMovimentoCaixa, ACadCaixas, ALeituraECF, ABancos, ACadTipoOpera,
  AConsultaVendaPeriodo, ADocumentosRecebidos, AConsultaTEF, ACartao,
  ATipoTransacaoCartao, ARegiaoVenda, AVisualizaCupom, FTefDiscado,
  AUnidade, ABackup, ACadIcmsEstado, AImprimeCodigoBarra, AHistoricoCliente,
  AMovHistoricoCliente, AconsultaHistorico, AConsultaAgenda,
  AAniversarioCliente, AEtiquetaCliente, uncomandosimpcheque, ANovoProduto,
  AMovVendedorCliente, AInicio, ARelatoriosFaturamento, ARelatoriosGeral,
  AAdicionaClientesARegiao, AClientesTabelaPreco, AMostraMensages,
  AManutencaoNotas, ACadItemPedido, AConsultaNotasFiscais, AImprimeNotas,
  ADemosntrativoFaturamento, AControleLigacoes, AConsultaLigacoes,
  AMostraRecados, AListaTelefonica;

{$R *.DFM}

// ----- Verifica a permissão do formulários conforme tabela MovGrupoForm -------- //
Function TFPrincipal.VerificaPermisao( nome : string ) : Boolean;
begin
  result := UnPri.VerificaPermisao(nome);
  if not result then
    abort;
end;


// ------------------ Mostra os comentarios ma barra de Status ---------------- }
procedure TFPrincipal.MostraHint(Sender : TObject);
begin
  BarraStatus.Panels[3].Text := Application.Hint;
end;

// ------------------ Na criação do Formulário -------------------------------- }
procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  UnPri := TFuncoesPrincipal.criar(self, BaseDados, NomeModulo);
  Varia := TVariaveis.Create;   // classe das variaveis principais
  Config := TConfig.Create;     // Classe das variaveis Booleanas
  ConfigModulos := TConfigModulo.create; // classe das variaveis de configuracao do modulo.
  Application.OnHint := MostraHint;
  Application.HintColor := $00EDEB9E;        // cor padrão dos hints
  Application.Title := 'Ponto de Loja';  // nome a ser mostrado na barra de tarefa do Windows
  Application.OnException := Erro;
  Application.OnMessage := Abre;
  Application.OnShortCut := TeclaPressionada;
  CodProduto := '';
end;

{************ abre base de dados ********************************************* }
function TFPrincipal.AbreBaseDados( Alias : string ) : Boolean;
begin
  result := AbreBancoDadosAlias(BaseDados, alias);
end;

procedure TFPrincipal.erro(Sender: TObject; E: Exception);
begin
  FMostraMensagens := TFMostraMensagens.CriarSDI(application,'',true);
  FMostraMensagens.MostraErro(E.Message);
end;

// ------------------- Quando o formulario e fechado -------------------------- }
procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BaseDados.Close;
  Varia.Free;
  Config.Free;
  UnPri.free;
  Action := CaFree;
end;

// -------------------- Quando o Formulario é Iniciado ------------------------ }
procedure TFPrincipal.FormShow(Sender: TObject);
begin
 // configuracoes do usuario
 UnPri.ConfigUsu(varia.CodigoUsuario, CorFoco, CorForm, CorPainelGra, Self );
 // configura modulos
 ConfiguracaoModulos;
 AlteraNomeEmpresa;
 FPrincipal.WindowState := wsMaximized;  // coloca a janela maximizada;
 // conforme usuario, configura menu
 UnPri.EliminaItemsMenu(self, Menu);
 MAcionaGaveta.Visible := varia.UsarGaveta = 'S';
 VerificaPendenciaTEF_ECF;
 OrganizaBotoes;
 Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.hlp>janela';  // Indica o Paph e o nome do arquivo de Help
 VerificaTransacaoPendente;
 VerificaVersaoSistema(CampoPermissaoModulo);
 if VerificaFormCriado('TFInicio') then
 begin
   finicio.close;
   finicio.free;
 end;
end;

{****************** organiza os botoes do formulario ************************ }
procedure TFPrincipal.OrganizaBotoes;
begin
 UnPri.OrganizaBotoes(0, [ BMFClientes, BMFProdutos,
                           BMFConsultaPrecosProdutos, BMFNovaNotaFiscal, BMFVendaECF,
                           BMFNovaCotacao, BMFItensCaixa, BMAdministracao, Bsaida]);
end;

// -------------------- Altera o Caption da Jabela Proncipal ------------------ }
procedure TFPrincipal.AlteraNomeEmpresa;
begin
  UnPri.AlteraNomeEmpresa(self, BarraStatus, NomeModulo, TipoSistema );
end;


{******************************************************************************}
procedure TFPrincipal.TeclaPressionada(var Msg: TWMKey; var Handled: Boolean);
begin
    case Msg.CharCode  of
      123 :
       if not VerificaFormCriado('TFConsultaPrecosProdutos') then
       begin
         FConsultaPrecosProdutos := TFConsultaPrecosProdutos.criarSDI(Application,'',FPrincipal.VerificaPermisao('FConsultaPrecosProdutos'));
         if codProduto <> '' then
         begin
           FConsultaPrecosProdutos.ECodigoProduto.Text := CodProduto;
           FConsultaPrecosProdutos.AtualizaConsulta;
         end;
         FConsultaPrecosProdutos.ShowModal;
         FConsultaPrecosProdutos.free;
       end;
      122 :
        if not VerificaFormCriado('TFlocalizaServico') then
        begin
          FlocalizaServico := TFlocalizaServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaServico'));
          FlocalizaServico.ConsultaServico;
          FlocalizaServico.free;
        end;
    end;
end;

// -------------Quando é enviada a menssagem de criação de um formulario------------- //
procedure TFPrincipal.abre(var Msg: TMsg; var Handled: Boolean);
begin
  if (Msg.message = CT_CRIAFORM) or (Msg.message = CT_DESTROIFORM) then
  begin
    UnPri.ConfiguraMenus(screen.FormCount,[],[MFAbertura,MFAlterarFilialUso]);

    if (Msg.message = CT_CRIAFORM) and (config.AtualizaPermissao) then
      UnPri.CarregaNomeForms( Screen.ActiveForm.Name, Screen.ActiveForm.Hint, CampoFormModulos, Screen.ActiveForm.Tag);

    if (Msg.message = CT_CRIAFORM) then
      Screen.ActiveForm.Caption := Screen.ActiveForm.Caption + ' [ ' + varia.NomeFilial + ' ] ';
  end;

  if (Msg.message = CT_ATUALIZARECADO ) then
      if VerificaFormCriado('TFMostraRecados') then
        FMostraRecados.CarregaConsulta;

end;

// --------- Verifica moeda --------------------------------------------------- }
procedure TFPrincipal.VerificaMoeda;
begin
  if (varia.DataDaMoeda <> date) and (Config.AvisaDataAtualInvalida)  then
    aviso(CT_DataMoedaDifAtual)
  else
    if (varia.MoedasVazias <> '') and (Config.AvisaIndMoeda) then
    avisoFormato(CT_MoedasVazias, [ varia.MoedasVazias]);
end;


// -------------  Valida ou naum Botoes para ususario master ou naum ------------- }
procedure TFPrincipal.ValidaBotoesGrupos( botoes : array of TComponent);
begin
  if Varia.GrupoUsuarioMaster <> Varia.GrupoUsuario then
    AlterarEnabledDet(botoes,false);
end;

{************************  M E N U   D O   S I S T E M A  ********************* }
procedure TFPrincipal.MenuClick(Sender: TObject);
begin
if  ValidaDataFormulario(date) then
  if Sender is TComponent  then
  case ((Sender as TComponent).Tag) of
    1050 : begin
           FAlteraSenha := TFAlteraSenha.CriarSDI(Application,'',VerificaPermisao('FAlteraSenha'));
           FAlteraSenha.ShowModal;
         end;
    1100 : begin
             FAlterarFilialUso := TFAlterarFilialUso.CriarSDI(application,'', VerificaPermisao('FAlterarFilialUso'));
             FAlterarFilialUso.ShowModal;
           end;
    1200, 1210 : begin
             // ----- Formulario para alterar o usuario atual ----- //
             FAbertura := TFAbertura.Create(Application);
             FAbertura.ShowModal;
             if Varia.StatusAbertura = 'OK' then
             begin
               AlteraNomeEmpresa;
               ResetaMenu(Menu, ToolBar1);
               UnPri.EliminaItemsMenu(self, menu);
               ConfiguracaoModulos;
               UnPri.ConfigUsu(varia.CodigoUsuario, CorFoco, CorForm, CorPainelGra, Self );
               OrganizaBotoes;
             end
             else
               if  ((Sender as TComponent).Tag) = 1210 then
                 FPrincipal.close;
             end;
    1250 : begin
             FUsuarioMenu := TFUsuarioMenu.CriarSDI(application,'',VerificaPermisao('FUsuarioMenu'));
             FUsuarioMenu.AbreFormulario(5);
           end;
    1270 : begin
             FBackup := TFBackup.CriarSDI(application,'',VerificaPermisao('FBackup'));
             FBackup.ShowModal;
           end;
           // ----- Sair do Sistema ----- //
    1300 : Close;
    2450 : begin
             FCadCaixas := TFCadCaixas.CriarSDI(application, '', VerificaPermisao('FCadCaixas'));
             FCadCaixas.ShowModal;
           end;
    2475 : begin
             FCadTipoOperacao := TFCadTipoOperacao.CriarSDI(application, '', VerificaPermisao('FCadTipoOperacao'));
             FCadTipoOperacao.ShowModal;
           end;
    2500 : begin
             FEventos := TFEventos.CriarSDI(application, '', VerificaPermisao('FEventos'));
             FEventos.ShowModal;
           end;
    2550 : begin
             FUnidades := TFUnidades.CriarSDI(application, '',VerificaPermisao('FUnidades'));
             FUnidades.ShowModal;
           end;
    2650 : begin
             FCadIcmsEstado := TFCadIcmsEstado.CriarSDI(application, '',VerificaPermisao('FCadIcmsEstado'));
             FCadIcmsEstado.ShowModal;
           end;
    2600 : begin
             // ------- As profissões do Cliente ------- //
             FProfissoes := TFProfissoes.CriarSDI(application,'',VerificaPermisao('FProfissoes'));
             FProfissoes.ShowModal;
           end;
    2700 : begin
             // ------ As Situções do Cliente ------- //
             FSituacoesClientes := TFSituacoesClientes.CriarSDI(Application,'',VerificaPermisao('FSituacoesClientes'));
             FSituacoesClientes.ShowModal;
           end;
           // ------- Cadastro de Clientes ------- //
    2750 : begin
             FClientes := TFClientes.criarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FClientes'));
             FClientes.Forn.Checked := true;
           end;
  275000 : FClientes := TFClientes.criarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FClientes'));
           // ------ Cadastro de Transportadora ------- //
  275010 : begin
             FHistoricoCliente := TFHistoricoCliente.CriarSDI(application , '', VerificaPermisao('FHistoricoCliente'));
             FHistoricoCliente.ShowModal;
           end;
  275020 : begin
             UnPri.SalvaFormularioEspecial('FMovHistoricoCliente1','Cadastro de Historico de Cliente',CampoFormModulos,'MFMovHistoricoCliente1');
             FMovHistoricoCliente := TFMovHistoricoCliente.CriarSDI(application , '', VerificaPermisao('FMovHistoricoCliente1'));
             FMovHistoricoCliente.CadastraHistorico(0);
           end;
  275025 : begin
             FMovHistoricoCliente := TFMovHistoricoCliente.CriarSDI(application , '', VerificaPermisao('FMovHistoricoCliente'));
             FMovHistoricoCliente.CadastraAgenda(0);
           end;
  275030 : begin
             FConsultaHistorico := TFConsultaHistorico.CriarSDI(application , '', VerificaPermisao('FConsultaHistorico'));
             FConsultaHistorico.ShowModal;
           end;
  275040 : begin
             FConsultaAgenda := TFConsultaAgenda.CriarSDI(application , '', VerificaPermisao('FConsultaAgenda'));
             FConsultaAgenda.MostraAgendaCliente(0);
           end;
  275050 : FAniversariante := TFAniversariante.CriarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FAniversariante'));
  275060 : begin
             FEtiquetaClientes := TFEtiquetaClientes.CriarSDI(application , '', VerificaPermisao('FEtiquetaClientes'));
             FEtiquetaClientes.ShowModal;
           end;
  275070 : begin
             FControleLigacoes := TFControleLigacoes.CriarSDI(application , '', VerificaPermisao('FControleLigacoes'));
             FControleLigacoes.NovaLigacao;
           end;
  275080 : begin
             FConsultaLigacoes := TFConsultaLigacoes.CriarSDI(application , '', VerificaPermisao('FConsultaLigacoes'));
             FConsultaLigacoes.ShowModal;
           end;
  275090 : begin
             FMostraRecados := TFMostraRecados.CriarSDI(application , '',  VerificaPermisao('FMostraRecados'));
             FMostraRecados.Show;
           end;
  275100 : FListaTelefonica := TFListaTelefonica.CriarMDI(application , varia.CT_AreaX, varia.CT_AreaY, VerificaPermisao('FListaTelefonica'));
    2776 : begin
             FCadItemPedido := TFCadItemPedido.CriarSDI(application , '', VerificaPermisao('FCadItemPedido'));
             FCadItemPedido.ShowModal;
           end;

    2780 :  FNaturezas := TFNaturezas.CriarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FNaturezas'));
    2783 : begin
             FFormasPagamento := TFFormasPagamento.CriarSDI(application , '', VerificaPermisao('FFormasPagamento'));
             FFormasPagamento.ShowModal;
           end;
    2760 : begin
             FBancos := TFBancos.CriarSDI(application , '', VerificaPermisao('FBancos'));
             FBancos.ShowModal;
           end;
    5120 :  begin
             FTipoTransacaoCartao := TFTipoTransacaoCartao.CriarSDI(application , '', VerificaPermisao('FTipoTransacaoCartao'));
             FTipoTransacaoCartao.ShowModal;
           end;
    5110 : begin
             FCartao := TFCartao.CriarSDI(application , '', VerificaPermisao('FCartao'));
             FCartao.ShowModal;
           end;
    2775 : FTransportadoras := TFTransportadoras.criarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FTransportadoras'));
    2785 : Begin
             FSituacoes := TFSituacoes.criarSDI(Application,'',VerificaPermisao('FSituacoes'));
             FSituacoes.ShowModal;
           end;
    2793 : Begin
             FRegiaoVenda := TFRegiaoVenda.criarSDI(Application,'',VerificaPermisao('FRegiaoVenda'));
             FRegiaoVenda.ShowModal;
           end;
    2791 : Begin
             FMovVendedorCliente := TFMovVendedorCliente.criarSDI(Application,'',VerificaPermisao('FMovVendedorCliente'));
             FMovVendedorCliente.ShowModal;
           end;
    2792 : Begin
             FAdicionaClientesARegiao := TFAdicionaClientesARegiao.criarSDI(Application,'',VerificaPermisao('AdicionaClientesARegiao'));
             FAdicionaClientesARegiao.ShowModal;
           end;
    2794 : Begin
             FClientesTabelaPreco := TFClientesTabelaPreco.criarSDI(Application,'',VerificaPermisao('ClientesTabelaPreco'));
             FClientesTabelaPreco.ShowModal;
           end;
    2795 : FVendedores := TFVendedores.criarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FVendedores'));
    2790 : begin
             FCondicoesPagamentos := TFCondicoesPagamentos.criarSDI(Application,'',VerificaPermisao('FCondicoesPagamentos'));
             FCondicoesPagamentos.ShowModal;
           end;
    2900 : begin
             // ------ Cadastro de Paises ------ //
             FCadPaises := TFCadPaises.CriarSDI(Application,'',VerificaPermisao('FCadPaises'));
             FCadPaises.ShowModal;
           end;
    2910 : begin
             // ------ Cadastro de Estados ------ //
             FCadEstados := TFCadEstados.CriarSDI(Application,'',VerificaPermisao('FCadEstados'));
             FCadEstados.ShowModal;
           end;
    2920 : begin
             // ------ Cadastro de Cidades ------ //
             FCidades := TFCidades.CriarSDI(Application,'',VerificaPermisao('FCidades'));
             FCidades.ShowModal;
           end;

           // ----- Formulario de Empresas ----- //
    3200 : FProdutos := TFProdutos.criarMDI(Application,Varia.CT_Areax,Varia.CT_AreaY,VerificaPermisao('FProdutos'));
    3300 : begin
             FNovoProduto := TFNovoProduto.CriarSDI(application, '', VerificaPermisao('FNovoProduto'));
             FNovoProduto.InsereNovoProduto(true);
           end;
    3400 : FAdicionaProdFilial := TFAdicionaProdFilial.criarMDI(Application, Varia.CT_areaX, Varia.CT_areaY, VerificaPermisao('FAdicionaProdFilial'));
    3600 : begin
             FTabelaPreco := TFTabelaPreco.CriarSDI(application, '',VerificaPermisao('FTabelaPreco'));
             FTabelaPreco.ShowModal;
           end;
    3800 : begin
            FFormacaoPreco := TFFormacaoPreco.CriarSDI(application, '',VerificaPermisao('FFormacaoPreco'));
            FFormacaoPreco.ShowModal;
           end;
    3900 : begin
            FImprimeCodigoBarra := TFImprimeCodigoBarra.CriarSDI(application, '',VerificaPermisao('FImprimeCodigoBarra'));
            FImprimeCodigoBarra.ShowModal;
           end;
    4100 : begin
             FConsultaPrecosProdutos := TFConsultaPrecosProdutos.criarSDI(Application,'',VerificaPermisao('FConsultaPrecosProdutos'));
             FConsultaPrecosProdutos.ShowModal
           end;
    4200 : Begin
             FCotacao := TFCotacao.criarSDI(Application,'',VerificaPermisao('FCotacao'));
             FCotacao.AbreConsulta(true);
           end;
    4250 : Begin
             UnPri.SalvaFormularioEspecial('FCotacao1','Cadastro de Historico de Cliente',CampoFormModulos,'MFCotacao1');
             FCotacao := TFCotacao.criarSDI(Application,'',VerificaPermisao('FCotacao1'));
             FCotacao.AbreConsulta(false);
           end;

    4300 : begin
             FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',VerificaPermisao('FNovaCotacao'));
             FNovaCotacao.NovaCotacao;
           end;
    4500 : begin
             UnPri.SalvaFormularioEspecial('FNovaCotacao1','Cadastro de Historico de Cliente',CampoFormModulos,'MFNovaCotacao1');
             FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',VerificaPermisao('FNovaCotacao1'));
             FNovaCotacao.NovoPedido;
           end;

    4400 : begin
            FlocalizaServico := TFlocalizaServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaServico'));
            FlocalizaServico.ConsultaServico;
           end;
   10100 : begin
             // ----- abertura de caixa ----- //
             FAbreCaixa := TFAbreCaixa.CriarSDI(Application,'' , VerificaPermisao('FAbreCaixa'));
             FAbreCaixa.AbreCaixa;
           end;
   10150 : begin
             // ----- abertura de caixa ----- //
             UnPri.SalvaFormularioEspecial('FAbreCaixa1','Abertura de caixa parcial',CampoFormModulos,'MFAbreCaixa1');
             FAbreCaixa := TFAbreCaixa.CriarSDI(Application,'' , VerificaPermisao('FAbreCaixa1'));
             FAbreCaixa.AbreParcial;
            end;
   10200 : begin
             // ----- fechamento de caixa ----- //
             FFechaCaixa := TFFechaCaixa.CriarSDI(Application,'' , VerificaPermisao('FFechaCaixa'));
             FFechaCaixa.FechaCaixa;
           end;
   10250 : begin
             // ----- fechamento de caixa ----- //
             UnPri.SalvaFormularioEspecial('FFechaCaixa1','Fechamento de caixa parcial',CampoFormModulos,'MFFechaCaixa1');
             FFechaCaixa := TFFechaCaixa.CriarSDI(Application,'' , VerificaPermisao('FFechaCaixa'));
             FFechaCaixa.FechaParcial;
           end;
    10300 : begin
             FSangriaSuprimento := TFSangriaSuprimento.CriarSDI(Application,'' , VerificaPermisao('FSangriaSuprimento'));
             FSangriaSuprimento.ValidaCarregaAbertura;
           end;
    10400 : begin
             FItensCaixa := TFItensCaixa.CriarSDI(Application,'' , VerificaPermisao('FItensCaixa'));
             FItensCaixa.ValidaCarregaAbertura;
            end;
    10600 : begin
             FAlteraItemCaixa := TFAlteraItemCaixa.CriarSDI(Application,'' , VerificaPermisao('FAlteraItemCaixa'));
             FAlteraItemCaixa.EstornaCaixa;
           end;
    10700 : begin
             // ----- consulta Movimento do  caixa atual ----- //
             FMovimentoCaixa := TFMovimentoCaixa.CriarSDI(Application,'' , FPrincipal.VerificaPermisao('FMovimentoCaixa'));
             FMovimentoCaixa.MovimentoCaixa(varia.CaixaPadrao);
           end;

    10500 : begin
              UnPri.SalvaFormularioEspecial('FAcionaGaveta','Acionamento da gaveta manual',CampoFormModulos,'MAcionaGaveta');
              AcionaGaveta;
            end;
    5200 : FServicos := TFServicos.criarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FServicos'));
    5400 : begin
             FFormacaoPrecoServico := TFFormacaoPrecoServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FFormacaoPrecoServico'));
             FFormacaoPrecoServico.Showmodal;
           end;
    6100 : Begin
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));
             FNovaNotaFiscal.NovaNotaFiscal('''V'', ''P'', ''S''', true);
           end;
    6110 : Begin
             UnPri.SalvaFormularioEspecial('FNovaNotaFiscal1','Emissão de nota fiscal de transferencia',CampoFormModulos,'MFNovaNotaFiscal1');
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal1'));
             FNovaNotaFiscal.NovaNotaFiscal('''T''', false);
           end;
    6120 : Begin
             UnPri.SalvaFormularioEspecial('FNovaNotaFiscal2','Emissão de nota fiscal de remessa',CampoFormModulos,'MFNovaNotaFiscal2');
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal2'));
             FNovaNotaFiscal.NovaNotaFiscal('''R''', false);
           end;
    6130 : Begin
             UnPri.SalvaFormularioEspecial('FNovaNotaFiscal3','Emissão de nota fiscal de devolucao',CampoFormModulos,'MFNovaNotaFiscal3');
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));
             FNovaNotaFiscal.NovaNotaFiscal('''D''', false);
           end;
    6140 : Begin
             UnPri.SalvaFormularioEspecial('FNovaNotaFiscal4','Emissão de outras notas fiscais',CampoFormModulos,'MFNovaNotaFiscal4');
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal4'));
             FNovaNotaFiscal.NovaNotaFiscal('''O'',''I''', false);
           end;
    6160 : Begin
             UnPri.SalvaFormularioEspecial('FNovaNotaFiscal5','Emissão de nota fiscal de compra',CampoFormModulos,'MFNovaNotaFiscal5');
             FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal5'));
             FNovaNotaFiscal.NovaNotaFiscal('''C''', false);
           end;
    4011 : FConsultaNotasFiscais := TFConsultaNotasFiscais.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FConsultaNotasFiscais'));
    6150 : FManutencaoNotas := TFManutencaoNotas.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FManutencaoNotas'));
    4013 : FImprimeNotas := TFImprimeNotas.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FImprimeNotas'));
    4014 : FDemonstrativoFaturamento := TFDemonstrativoFaturamento.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FDemonstrativoFaturamento'));

    6200 : Begin
             FVendaECF := TFVendaECF.CriarSDI(application, '',FPrincipal.VerificaPermisao('FVendaECF'));
             FVendaECF.AbreCupom;
           end;
    6600 : Begin
             FVisualizaCupom := TFVisualizaCupom.CriarSDI(application, '',FPrincipal.VerificaPermisao('FVisualizaCupom'));
             FVisualizaCupom.CancelaUltimoCupom;
           end;
    6300 : begin
             UnPri.SalvaFormularioEspecial('FAdministraTEF','Administração do TEF',CampoFormModulos,'MAdministracao');
             SolicitacaoAdministrativaTEF;
           end;
    6400 : begin
              // ------ Redução Z ------ //
               FLeituraECF := TFLeituraECF.CriarSDI(application, '', VerificaPermisao('FLeituraECF'));
               FLeituraECF.ShowModal;
            end;
    6500 : begin
               FConsultaTEF := TFConsultaTEF.CriarSDI(application, '', VerificaPermisao('FConsultaTEF'));
               FConsultaTEF.ShowModal;
            end;
    11100 : FConsultaVendaPeriodo := TFConsultaVendaPeriodo.CriarMDI(application, Varia.CT_AreaX,Varia.CT_AreaY,FPrincipal.VerificaPermisao('FConsultaVendaPeriodo'));
    11200 : FDocumentosRecebidos := TFDocumentosRecebidos.CriarMDI(application, Varia.CT_AreaX,Varia.CT_AreaY,FPrincipal.VerificaPermisao('FDocumentosRecebidos'));

    7300 : FImprimeBoleto := TFImprimeBoleto.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeBoleto'));
    7400 : FImprimeCarne := TFImprimeCarne.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeCarne'));
    7500 : FImprimeEnvelope := TFImprimeEnvelope.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeEnvelope'));
    7510 : begin
             FMostraduplicata := TFMostraduplicata.CriarSDI(Application,'',VerificaPermisao('FMostraduplicata'));
             FMostraduplicata.ShowModal;
           end;
    7520 : begin
             FMostraCheque := TFMostraCheque.CriarSDI(Application,'',VerificaPermisao('FMostraCheque'));
             FMostraCheque.ShowModal;
           end;
    7530 : begin
             FMostraBoleto := TFMostraBoleto.CriarSDI(Application,'',VerificaPermisao('FMostraBoleto'));
             FMostraBoleto.ShowModal;
           end;
    7540 : begin
             FMostraCarne := TFMostraCarne.CriarSDI(Application,'',VerificaPermisao('FMostraCarne'));
             FMostraCarne.ShowModal;
           end;
    7550 : begin
            FMostraNotaPromissoria := TFMostraNotaPromissoria.CriarSDI(Application,'',VerificaPermisao('FMostraNotaPromissoria'));
            FMostraNotaPromissoria.ShowModal;
           end;
    7560 : begin
             FMostraRecibo := TFMostraRecibo.CriarSDI(Application,'',VerificaPermisao('FMostraRecibo'));
             FMostraRecibo.ShowModal;
           end;
    7570 : begin
           FMostraEnvelope := TFMostraEnvelope.CriarSDI(Application,'',VerificaPermisao('FMostraEnvelope'));
           FMostraEnvelope.ShowModal;
         end;
    9100 : begin
             FSobre := TFSobre.CriarSDI(application,'', VerificaPermisao('FSobre'));
             FSobre.ShowModal;
           end;
  end;
end;

procedure TFPrincipal.AcionaGaveta;
var
  ECF : TECF;
  senha : string;
begin
   // verifica aciona gaveta
  if (varia.UsarGaveta = 'S') then
   if Entrada('Senha','Digite senha de Liberação', senha, true, CorFoco.AFundoComponentes, CorForm.ACorPainel) then
     if Uppercase(senha) = Uppercase(Varia.SenhaLiberacao) then
     begin
       if ECF.AbrePorta then
        begin
          ECF := TECF.criar(nil, FPrincipal.BaseDados);
          ECF.AcionaGaveta;
          ECF.FecharPorta;
          Ecf.Free;
        end;
     end
     else
       aviso('senha invalida');
end;


procedure TFPrincipal.SolicitacaoAdministrativaTEF;
var
   UnTEF : TFuncoesTEF;
begin
  UnTEF := TFuncoesTEF.criar(self, BaseDados);
  UnTEF.AbreSolicitacaoAdministrativaTEF;
  unTEF.Free;
end;

{*********** verifica se o tef ou ecf foram fechados com problemas ********** }
procedure TFPrincipal.VerificaPendenciaTEF_ECF;
var
  UnTef : TFuncoesTEF;
  UnEcf : TECF;
  Ini : TRegIniFile;
  seqNota, SeqTef : string;
begin
  if VersaoSistema = 1 then
  begin
    Ini := TRegIniFile.Create('Software\Systec\Sistema');
    seqNota := Ini.ReadString('NOTA_ECF_TEF','ECF', '0');
    seqTef := Ini.ReadString('NOTA_ECF_TEF','TEF', '0');

    if seqNota <> '0'  then
    begin
      FVendaECF := TFVendaECF.CriarSDI(application,'',true);
      FVendaECF.showmodal;
    end
    else
      if seqtef <> '0' then
      begin
        UnTEF := TFuncoesTEF.criar(self, BaseDados);
        UnECF := TECF.criar(self, BaseDados);
        if UnTef.VerificaGerenciador then
        begin
          UnTef.AbreArquivoRespUltimo;
          if UnEcf.AbrePorta then
          begin
            UnEcf.FechaCupomSemICMS;
            UnEcf.FecharPorta;
          end;
          UnTef.CancelaECF(true);
        end
        else
          self.close;
        unTEF.Free;
      end;
    FechaTabela(aux);
  end;
end;

{******************* configura os modulos do sistema ************************* }
procedure TFPrincipal.ConfiguracaoModulos;
var
  Reg : TRegistro;
begin
  Reg := TRegistro.create;
  reg.ValidaModulo( TipoSistema, [MCadastros, Mcotacao, MProdutos, MFaturamento, MCAixa, MServico, BMFProdutos, BMFNovaCotacao, BMFNovaNotaFiscal, BMFVendaECF, BMFItenscaixa, BMFConsultaPrecosProdutos, BMFClientes] );
  VersaoSistema := reg.VersaoMaquina;
  reg.ConfiguraModulo(ct_servico, [ MServico, MServicosRel ]  );
  reg.ConfiguraModulo(CT_NOTAFISCAL,[ MFNovaNotaFiscal, BMFNovaNotaFiscal,MNotaFiscalRel, MNotaFiscalRel ] );
  reg.ConfiguraModulo(CT_ECF, [MCaixa, MVenda, MFVendaECF, BMFVEndaECF, MCupomFiscalRel  ] );
  reg.ConfiguraModulo(CT_Caixa, [ MFCadCaixas, MFAbreCaixa, MFFechaCaixa, MFAbreCaixa1, MFFechaCaixa1,
                                  MFAlteraItemCaixa, MFMovimentoCaixa, MFMovimentoCaixa, MFItensCaixa, BMFItensCaixa, MCaixaRel ] );
  reg.ConfiguraModulo( CT_ORCAMENTOVENDA, [ MCotacao, BMFNovaCotacao, MOramentosRel]);
  reg.ConfiguraModulo( CT_IMPDOCUMENTOS, [ MImpDocumentos ] );
  reg.configuraModulo( CT_CODIGOBARRA, [ MFImprimeCodigoBarra ] );
  if ( not MFNovaNotaFiscal.Visible) and ( not MFVendaECF.Visible ) then
  begin
    MFaturamento.Visible := false;
    MFaturamentoRel.Visible := false;
  end;
  reg.ConfiguraModulo(CT_SENHAGRUPO, [ MFUsuarioMenu ]  );
  reg.ConfiguraModulo(CT_TEF, [MFConsultaTEF, MAdministracao, BMAdministracao]);
  reg.ConfiguraModulo(CT_PRODUTO, [MFTransportadoras, mfsituacoes, ClienteseFornecedores1,MFVendedores, MProdutos, BMFProdutos, BMFConsultaPrecosProdutos]);
  reg.ConfiguraModulo(CT_AGENDACLIENTE,[MFHistoricoCliente, MFMovHistoricoCliente, MFMovHistoricoCliente1, MFConsultaAgenda, MFconsultaHistorico]);
  reg.ConfiguraModulo(CT_MALACLIENTE,[MFEtiquetaClientes]);
  reg.ConfiguraModulo(CT_PEDIDOVENDA,[MPedidosRel]);
  reg.Free;
end;

procedure TFPrincipal.VerificaTransacaoPendente;
var
  Sequencial, Filial : integer;
  NF : TFuncoesNotaFiscal;
  Cotacao : TFuncoesCotacao;
begin
  if VerificaTransacao(1, Sequencial, Filial) then
  begin
     NF := TFuncoesNotaFiscal.criar(self, BaseDados);
     NF.Exclui_cancelaNotaFiscalDireto(Sequencial, Filial, true);
     nf.free;
     DesmarcaTransacao(1);
  end;

 if VerificaTransacao(5, Sequencial, Filial) then
 begin
   Cotacao := TFuncoesCotacao.Cria(BaseDados);
   Cotacao.ExcluiOrcamento(Inttostr(Sequencial), Filial);
   Cotacao.free;
   DesmarcaTransacao(5);
 end;

 if VerificaTransacao(8, sequencial, filial ) then
 begin
   Cotacao := TFuncoesCotacao.Cria(BaseDados);
   Cotacao.LocalizaMovOrcamento( Aux,inttostr(Filial),inttostr(Sequencial));
   Cotacao.ReservaProdutoOrcamento(Aux);
   aux.close;
   Cotacao.free;
   DesmarcaTransacao(8);
 end;


end;


procedure TFPrincipal.Ajuda1Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER,0);
end;

procedure TFPrincipal.ndice1Click(Sender: TObject);
begin
   Application.HelpCommand(HELP_KEY,0);
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Relatorios
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************************** Gera os menus de relatorios ********************}
procedure TFPrincipal.MRelatoriosClick(Sender: TObject);
begin
if  ValidaDataFormulario(date) then
  if (sender is TMenuItem) then
    if MRelatorios.Tag <> 1 then
    begin
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cadastro\Geral',(sender as TMenuItem).MenuIndex,0,99);
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cadastro\Faturamento',(sender as TMenuItem).MenuIndex,0,99);
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cliente',(sender as TMenuItem).MenuIndex,1,99);
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'LigacaoAgenda',(sender as TMenuItem).MenuIndex,1,99);

      if ConfigModulos.Produto then
       UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Produto',(sender as TMenuItem).MenuIndex,2,99);
      if ConfigModulos.Estoque then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Estoque',(sender as TMenuItem).MenuIndex,3,99);
      if ConfigModulos.Servico then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Servico',(sender as TMenuItem).MenuIndex,4,99);
      if ConfigModulos.NotaFiscal then
      begin
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'NotaFiscal',(sender as TMenuItem).MenuIndex,5,99);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Faturamento',(sender as TMenuItem).MenuIndex,7,99);
      end;
      if ConfigModulos.ECF then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'CupomFiscal',(sender as TMenuItem).MenuIndex,6,99);
      if ConfigModulos.PedidoVenda then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Pedido',(sender as TMenuItem).MenuIndex,8,99);
      if ConfigModulos.OrcamentoVenda then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Orcamento',(sender as TMenuItem).MenuIndex,9,99);
      if ConfigModulos.Caixa then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Caixa',(sender as TMenuItem).MenuIndex,10,99);
      MRelatorios.Tag := 1;
    end;
end;

{******************* chama um relatorio **************************************}
procedure TFPrincipal.CriaRelatorio(Sender: TObject);
begin
  if VerificaPermisao((sender as TMenuItem).Name) then
  begin
    UnPri.SalvaFormularioEspecial((sender as TMenuItem).Name, DeletaChars((sender as TMenuItem).Caption,'&'),'c_mod_fat',(sender as TMenuItem).Name);
    FRelatoriosFaturamento := TFRelatoriosFaturamento.CriarSDI(application,'',true);
    FRelatoriosFaturamento.CarregaConfig((sender as TMenuItem).Hint, (sender as TMenuItem).Caption);
    FRelatoriosFaturamento.ShowModal;
  end;
end;

{******************* chama um relatorio **************************************}
procedure TFPrincipal.CriaRelatorioGeral(Sender: TObject);
begin
  if VerificaPermisao((sender as TMenuItem).Name) then
  begin
    UnPri.SalvaFormularioEspecial((sender as TMenuItem).Name, DeletaChars((sender as TMenuItem).Caption,'&'),'c_mod_fat',(sender as TMenuItem).Name);
    FRelatoriosGeral := TFRelatoriosGeral.CriarSDI(application,'',true);
    FRelatoriosGeral.CarregaConfig((sender as TMenuItem).Hint, (sender as TMenuItem).Caption);
    FRelatoriosGeral.ShowModal;
  end;
end;

end.
