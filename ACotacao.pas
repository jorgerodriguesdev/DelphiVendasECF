unit ACotacao;
{          Autor: Sergio
    Data Criação: 05/05/1999;
          Função: Consultar Orçamentos

Motivo alteração:
a tela adadosCotacao efetua baixas }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, Localizacao, Buttons, StdCtrls, Componentes1,
  ComCtrls, Grids, DBGrids, Tabela, Db, DBTables, DBKeyViolation, DBCtrls,
  Graficos, QRExport, Mask, numericos, Parcela, UCrpe32;

type
  TFCotacao = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    ECliente: TEditLocaliza;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Localiza: TConsultaPadrao;
    Label3: TLabel;
    Label4: TLabel;
    DataInicial: TCalendario;
    DataFinal: TCalendario;
    GridMov: TDBGridColor;
    CadOrcamento: TQuery;
    DataCadOrcamentos: TDataSource;
    BFechar: TBitBtn;
    ESituacao: TEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    MovOrcamentos: TQuery;
    DataMovOrcamentos: TDataSource;
    MovOrcamentosI_EMP_FIL: TIntegerField;
    MovOrcamentosI_LAN_ORC: TIntegerField;
    MovOrcamentosC_COD_PRO: TStringField;
    MovOrcamentosN_VLR_PRO: TFloatField;
    MovOrcamentosN_QTD_PRO: TFloatField;
    MovOrcamentosN_VLR_TOT: TFloatField;
    MovOrcamentosC_COD_UNI: TStringField;
    MovOrcamentosC_IMP_FOT: TStringField;
    CadOrcamentoI_Lan_Orc: TIntegerField;
    CadOrcamentoD_Dat_Orc: TDateField;
    CadOrcamentoC_Nom_Cli: TStringField;
    CadOrcamentoC_Nom_Pag: TStringField;
    CadOrcamentoC_Nom_Sit: TStringField;
    BtCancela: TBitBtn;
    BtExcluir: TBitBtn;
    BtAlterar: TBitBtn;
    Aux: TQuery;
    DBMemoColor1: TDBMemoColor;
    Label7: TLabel;
    CadOrcamentoT_Hor_Orc: TTimeField;
    CadOrcamentoD_Dat_Ent: TDateField;
    CadOrcamentoC_Fla_Sit: TStringField;
    CadOrcamentoD_Dat_Pre: TDateField;
    BtbImprimir: TBitBtn;
    GOrcamento: TGridIndice;
    CadOrcamentoL_Obs_Orc: TMemoField;
    Label8: TLabel;
    SpeedButton3: TSpeedButton;
    LProduto: TLabel;
    EProduto: TEditColor;
    MovOrcamentosC_Fla_Res: TStringField;
    MovOrcamentosC_Nom_Pro: TStringField;
    MovOrcamentosI_Seq_Pro: TIntegerField;
    BCadastrar: TBitBtn;
    Splitter1: TSplitter;
    Label9: TLabel;
    Label10: TLabel;
    EQtdTotal: TEditColor;
    EValorTotal: TEditColor;
    CTotal: TCheckBox;
    Bevel1: TBevel;
    BGraficos: TBitBtn;
    EVendedor: TEditLocaliza;
    Label11: TLabel;
    SpeedButton4: TSpeedButton;
    Label12: TLabel;
    BMais: TSpeedButton;
    BConsulta: TBitBtn;
    G: TStringField;
    CadOrcamentoN_Vlr_Tot: TFloatField;
    PGraficos: TCorPainelGra;
    BitBtn4: TBitBtn;
    PanelColor5: TPanelColor;
    Label17: TLabel;
    Label18: TLabel;
    BClientes: TBitBtn;
    BSituacao: TBitBtn;
    BData: TBitBtn;
    BFechaGrafico: TBitBtn;
    GraficosTrio: TGraficosTrio;
    CTipoGrafico: TRadioGroup;
    BVendedor: TBitBtn;
    BFlag: TBitBtn;
    BProduto: TBitBtn;
    BCondicao: TBitBtn;
    BGeraNota: TBitBtn;
    BVerNota: TBitBtn;
    MovOrcamentosN_Qtd_Bai: TFloatField;
    ProdutosNota: TQuery;
    PainelTempo1: TPainelTempo;
    CadOrcamentoC_Nro_Not: TStringField;
    BBAjuda: TBitBtn;
    CadOrcamentoi_nro_orc: TIntegerField;
    BitBtn1: TBitBtn;
    CadOrcamentoi_nro_ped: TIntegerField;
    Flag: TComboBoxColor;
    Label13: TLabel;
    CodOr_Ped: Tnumerico;
    Label14: TLabel;
    BImpCupom: TBitBtn;
    CadOrcamentoi_qtd_imp: TIntegerField;
    BitBtn2: TBitBtn;
    CriaParcelas: TCriaParcelasReceber;
    TipoData: TComboBoxColor;
    CadOrcamentoi_Cod_cli: TIntegerField;
    Rel: TCrpe;
    CadOrcamentoi_emp_fil: TIntegerField;
    CadOrcamentoT_Hor_Ent: TTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlagClick(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure GOrcamentoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GOrcamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadOrcamentoAfterScroll(DataSet: TDataSet);
    procedure BtCancelaClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtbImprimirClick(Sender: TObject);
    procedure EProdutoExit(Sender: TObject);
    procedure EClienteRetorno(Retorno1, Retorno2: String);
    procedure BCadastrarClick(Sender: TObject);
    procedure BMaisClick(Sender: TObject);
    procedure BConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BGraficosClick(Sender: TObject);
    procedure BFechaGraficoClick(Sender: TObject);
    procedure BClientesClick(Sender: TObject);
    procedure BSituacaoClick(Sender: TObject);
    procedure BVendedorClick(Sender: TObject);
    procedure BDataClick(Sender: TObject);
    procedure BFlagClick(Sender: TObject);
    procedure BCondicaoClick(Sender: TObject);
    procedure BProdutoClick(Sender: TObject);
    procedure CTotalClick(Sender: TObject);
    procedure EProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BGeraNotaClick(Sender: TObject);
    procedure BVerNotaClick(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GOrcamentoEnter(Sender: TObject);
    procedure GOrcamentoCellClick(Column: TColumn);
    procedure BImpCupomClick(Sender: TObject);
    procedure BitBtn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    TeclaPressionada : boolean;
    VprCodProduto,
    VprNomProduto : String;
    VprSeqProduto : Integer;
    TipoOrcamento : Boolean;
    TextoPedOrcamento : string;
    PermiteAlterar : Boolean;
    procedure AtualizaConsulta;
    procedure AdicionaFiltros(VpaSelect : TStrings);
    procedure AtualizaTotal;
    procedure PosMovOrcamento(VpaOrcamento : String);
    procedure ConsisteProduto;
    procedure LocalizaProduto;
    procedure LimpaFiltros;
    procedure GraficoCliente;
    procedure GraficoVendedores;
    procedure GraficoSituacao;
    procedure GraficoData;
    procedure GraficoFlag;
    procedure GraficoCondicaoPagamento;
    procedure GraficoProduto;
    procedure AtualizaTabelaMarcaPosicao;
  public
    procedure AbreConsulta( orcamento : boolean);
  end;

var
  FCotacao: TFCotacao;

implementation

uses APrincipal,Fundata,Constantes, constMsg, UnProdutos, ALocalizaProdutos,
     FunSql, ANovaCotacao, UnCotacao, FunObjeto, AImpCotacao,
  ANovaNotaFiscal, ADadosCotacao, AImpCotacao2,AImpPedido;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFCotacao.FormCreate(Sender: TObject);
begin
//   MudaMacaraDisplay([MovOrcamentosN_QTD_PRO],varia.mascaraQTD);
//   MudaMacaraDisplay([MovOrcamentosN_VLR_PRO],varia.cifraomoeda + varia.mascaraValorUnitario);

   rel.ReportName := varia.PathRel + 'Diverso\OrcamentoVenda.rpt';
//   DataInicial.Date := PrimeiroDiaMes(Date);
   DataFinal.Date := UltimoDiaMes(Date);
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   TeclaPressionada := False;
//   BitBtn1.Visible := ConfigModulos.PedidoVenda;
   Flag.ItemIndex := 0;
   BImpCupom.Visible := Varia.CupomVinculado_Ped_Orc = 'S';
   TipoData.ItemIndex := 0;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CadOrcamento.close;
   MovOrcamentos.close;
   Aux.close;
   ProdutosNota.close;
   Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                           eventos dos filtros superiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************** cosiste se o produto digitado existe ************************}
procedure TFCotacao.ConsisteProduto;
var
  Produtos : TFuncoesProduto;
begin
  if EProduto.text <> '' then
  begin
    VprCodProduto := EProduto.text;
    Produtos := TFuncoesProduto.criar(Application,FPrincipal.BaseDados);
    if not Produtos.ExisteCodigoProduto(VprSeqProduto,VprCodProduto,VprNomProduto) then
    begin
      LocalizaProduto
    end;
  end
  else
    LProduto.Caption := '';
end;

{************************** localiza o produto ********************************}
procedure TFCotacao.LocalizaProduto;
var
  VpfCadastrouProduto : Boolean;
begin
  VpfCadastrouProduto := false;
  FlocalizaProduto := TFlocalizaProduto.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaProduto'));
  if FlocalizaProduto.LocalizaProduto(VpfCadastrouProduto,VprSeqProduto,VprCodProduto,vprNomProduto, cadOrcamentoi_cod_cli.asinteger) then
  begin
    LProduto.caption := VprNomProduto;
    EProduto.text := VprCodProduto;
  end
  else
    EProduto.SetFocus;
  FlocalizaProduto.free;
end;

{*************** chama a procedure para consistir o produto *******************}
procedure TFCotacao.EProdutoExit(Sender: TObject);
begin
  ConsisteProduto;
  AtualizaConsulta;
end;

{**************** quando é pressionado alguma tecla ***************************}
procedure TFCotacao.EProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f3 : LocalizaProduto;
  end;
end;

{*********************** Localiza o produto ***********************************}
procedure TFCotacao.SpeedButton3Click(Sender: TObject);
begin
  LocalizaProduto;
  AtualizaConsulta;
end;

{***************** chama a rotina para atualizar a consulta *******************}
procedure TFCotacao.EClienteRetorno(Retorno1, Retorno2: String);
begin
  AtualizaConsulta;
end;

{**************************Atualiza a Tabela Cad*******************************}
procedure TFCotacao.FlagClick(Sender: TObject);
begin
  AtualizaConsulta;
end;

{******************* limpa os filtros da consulta *****************************}
procedure TFCotacao.LimpaFiltros;
begin
  LimpaEdits(PanelColor1);
  AtualizaLocalizas([Ecliente,EVendedor,ESituacao]);
  Flag.ItemIndex := 0;
//  DataInicial.Date := PrimeiroDiaMes(Date);
  DataFinal.Date := UltimoDiaMes(Date);
  TipoData.ItemIndex := 0;
  LProduto.caption := '';
  AtualizaConsulta;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos dos graficos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}
procedure TFCotacao.GraficoCliente;
var
  VpfTitulo : String;
  VpfComandoSql : TStringList;
begin
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, Orc.I_Cod_Cli ||''-'' ||Cli.C_Nom_Cli Cliente '+
                                   ' from dba.CadOrcamentos Orc, CadClientes Cli ') ;
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor, Orc.I_Cod_Cli ||''-'' ||Cli.C_Nom_Cli Cliente '+
                           ' from CadOrcamentos Orc, '+
                           ' CadClientes Cli ');
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;
  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' and Orc.I_cod_Cli = Cli.I_Cod_Cli '+
                    ' GROUP BY Cliente');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'Cliente';
  graficostrio.info.TituloGrafico := 'Gráficos por Clientes - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Cliente';
  graficostrio.execute;
end;

{*********************** grafico por vendedores *******************************}
procedure TFCotacao.GraficoVendedores;
var
  VpfTitulo : String;
  VpfComandoSql : TStringList;
begin
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, Orc.I_Cod_Ven ||''-'' ||Ven.C_Nom_Ven Vendedor '+
                                   ' from dba.CadOrcamentos Orc, CadVendedores Ven ') ;
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor, Orc.I_Cod_Ven ||''-'' ||Ven.C_Nom_Ven Vendedor '+
                           ' from CadOrcamentos Orc, CadVendedores Ven ');
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;
  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' and Orc.I_cod_Ven = Ven.I_Cod_Ven '+
                     ' GROUP BY Vendedor');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'Vendedor';
  graficostrio.info.TituloGrafico := 'Gráficos por Atendentes - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Atendentes';
  graficostrio.execute;
end;

{****************** grafico por situacao do orcamento *************************}
procedure TFCotacao.GraficoSituacao;
var
  VpfTitulo : String;
  VpfComandoSql : TStringList;
begin
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, Orc.I_Cod_Sit ||''-'' ||Sit.C_Nom_Sit Situacao '+
                                   ' from dba.CadOrcamentos Orc, CadSituacoes Sit ') ;
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor,  Orc.I_Cod_Sit ||''-'' ||Sit.C_Nom_Sit Situacao '+
                           ' from CadOrcamentos Orc, CadSituacoes Sit ') ;
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;
  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' and Orc.I_cod_Sit = Sit.I_Cod_Sit '+
                    ' GROUP BY Situacao');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'Situacao';
  graficostrio.info.TituloGrafico := 'Gráficos por Situações - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Situação';
  graficostrio.execute;
end;

{*********************** grafico pela data ************************************}
procedure TFCotacao.GraficoData;
var
  VpfTitulo, vpfCampo : String;
  VpfComandoSql : TStringList;
begin
  case TipoData.ItemIndex of
    0 : VpfCampo := 'D_Dat_Orc';
    1 : VpfCampo := 'D_Dat_Ent';
    2 : VpfCampo := 'Orc.D_DAt_Pre ';
  end;

  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, '+ VpfCampo+ ' from dba.CadOrcamentos Orc ');
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor,'+ VpfCampo+ ' from dba.CadOrcamentos Orc ');
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;

  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' GROUP BY '+ VpfCAmpo+
                    ' order by '+VpfCAmpo);

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := VpfCampo;
  graficostrio.info.TituloGrafico := 'Gráficos por Periodo - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Data';
  graficostrio.execute;
end;

{************************ grafico pelo flag ***********************************}
procedure TFCotacao.GraficoFlag;
var
  VpfTitulo : String;
  VpfComandoSql : TStringList;
begin
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, C_Fla_Sit from dba.CadOrcamentos Orc ');
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor, C_Fla_Sit from dba.CadOrcamentos Orc ');
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;

  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' GROUP BY C_Fla_Sit');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'C_Fla_Sit';
  graficostrio.info.TituloGrafico := 'Gráficos por Flag - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Flag';
  graficostrio.execute;
end;

{****************** grafico pela condicao de pagamento ************************}
procedure TFCotacao.GraficoCondicaoPagamento;
var
  VpfTitulo : String;
  VpfComandoSql : TStringList;
begin
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd, Orc.I_Cod_Pag ||''-'' ||Pag.C_Nom_Pag PAgamento '+
                                   ' from dba.CadOrcamentos Orc, CadCondicoesPagto Pag ') ;
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Orc.N_Vlr_Tot) Valor,  Orc.I_Cod_Pag ||''-'' ||Pag.C_Nom_Pag PAgamento '+
                                   ' from dba.CadOrcamentos Orc, CadCondicoesPagto Pag ') ;
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;
  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' and Orc.I_cod_Pag = PAg.I_Cod_Pag '+
                    ' GROUP BY Pagamento');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'Pagamento';
  graficostrio.info.TituloGrafico := 'Gráficos por Condições de Pagamento - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Condição de Pagamento';
  graficostrio.execute;
end;

{************************ grafico por produto *********************************}
procedure TFCotacao.GraficoProduto;
var
  VpfTitulo,VpfCampo : String;
  VpfComandoSql : TStringList;
begin
  if UpperCase(varia.CodigoProduto) = 'C_COD_PRO' Then
    VpfCampo := 'PRO.C_COD_PRO'
  else
    VpfCampo := 'QTD.C_COD_BAR';
  VpfComandoSql := TStringList.Create;
  VpfTitulo := 'Gráfico de Cotações ';
  case CTipoGrafico.ItemIndex of
    0 : begin
          VpfComandoSql.add('Select Count(*) Qtd,'+ VpfCampo+' ||''-'' ||Pro.C_Nom_Pro Produto '+
                                   ' from dba.CadOrcamentos Orc, MovOrcamentos Mov, '+
                                   ' CadProdutos Pro, MovQdadeProduto Qtd ') ;
          graficostrio.info.CampoValor := 'Qtd';
          graficostrio.info.TituloY := 'Quantidade';
        end;
    1 : begin
          VpfComandoSql.add('Select Sum(Mov.N_Vlr_Tot) Valor,  '+ VpfCampo+' ||''-'' ||Pro.C_Nom_Pro Produto '+
                                   ' from dba.CadOrcamentos Orc, MovOrcamentos Mov, '+
                                   ' CadProdutos Pro, MovQdadeProduto Qtd ') ;
          graficostrio.info.CampoValor := 'Valor';
          graficostrio.info.TituloY := 'Valor';
        end;
  end;
  AdicionaFiltros(VpfComandosql);
  VpfComandosql.add(' and Orc.I_Emp_Fil = Mov.I_Emp_Fil '+
                    ' and Orc.I_Lan_Orc = Mov.I_Lan_Orc '+
                    ' and Qtd.I_Emp_Fil = Mov.I_Emp_Fil '+
                    ' and Qtd.I_Seq_Pro = Mov.I_Seq_Pro '+
                    ' and Pro.I_SEq_Pro = Mov.I_Seq_Pro ' +
                    ' GROUP BY Produto');

  graficostrio.info.ComandoSQL :=  VpfComandoSql.text;
  graficostrio.info.CampoRotulo := 'Produto';
  graficostrio.info.TituloGrafico := 'Gráficos por Condições de Pagamento - ' + Varia.NomeFilial;
  graficostrio.info.RodapeGrafico := VpfTitulo;
  graficostrio.info.TituloFormulario := 'Gráfico de Cotações';
  graficostrio.info.TituloX := 'Produtos';
  graficostrio.execute;
end;

{************************* esconde os graficos ********************************}
procedure TFCotacao.BFechaGraficoClick(Sender: TObject);
begin
  PanelColor1.Enabled := true;
  PanelColor2.Enabled := true;
  GOrcamento.Enabled := true;
  GridMov.Enabled := true;
  PGraficos.Visible := false;
end;

{******************** chama a rotina de graficos por vendedores ***************}
procedure TFCotacao.BSituacaoClick(Sender: TObject);
begin
  GraficoSituacao;
end;

{********************** chama o grafico por data ******************************}
procedure TFCotacao.BDataClick(Sender: TObject);
begin
  GraficoData;
end;

{******************** chama os graficos por flag ******************************}
procedure TFCotacao.BFlagClick(Sender: TObject);
begin
  GraficoFlag;
end;

{***********************  condicao de pagamento *******************************}
procedure TFCotacao.BCondicaoClick(Sender: TObject);
begin
  GraficoCondicaoPagamento;
end;

{***************** chama a rotina de graficos por produto *********************}
procedure TFCotacao.BProdutoClick(Sender: TObject);
begin
  graficoProduto;
end;

{**************** chama a rotina dos graficos por Vendedores ******************}
procedure TFCotacao.BVendedorClick(Sender: TObject);
begin
  GraficoVendedores;
end;

{****************** chama a rotina dos graficos por clientes ******************}
procedure TFCotacao.BClientesClick(Sender: TObject);
begin
  GraficoCliente;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações da Consulta
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{********************Atualiza a tabela de cadOrcamento*************************}
procedure TFCotacao.AtualizaConsulta;
begin
   CadOrcamento.close;
   CadOrcamento.sql.clear;
   CadOrcamento.SQl.add(' Select orc.i_Cod_cli,Orc.I_Lan_Orc, Orc.D_Dat_Orc, Cli.C_Nom_Cli,'+
                        ' Pag.C_Nom_Pag, Sit.C_Nom_Sit,Orc.T_Hor_Ent,Orc.T_Hor_Orc, Orc.D_Dat_Ent, ' +
                        ' Orc.C_Fla_Sit, Orc.D_Dat_Pre, Orc.L_Obs_Orc,Orc.N_Vlr_Tot,'+
                        ' Orc.C_Nro_Not, Ven.C_Nom_Ven, Orc.i_nro_orc, Orc.i_nro_ped, Orc.I_QTD_IMP, Orc.i_emp_fil '+
                        ' from dba.CadOrcamentos as Orc, dba.CadClientes Cli, '+
                        ' dba.CadCondicoesPagto as Pag, dba.CadSituacoes as Sit, '+
                        ' CadVendedores Ven');
   AdicionaFiltros(CadOrcamento.Sql);
   CadOrcamento.Sql.Add(' and Cli.I_Cod_Cli = Orc.I_Cod_Cli ' +
                        ' and Pag.I_Cod_Pag = Orc.i_Cod_Pag ' +
                        ' and Sit.I_cod_Sit =* Orc.I_Cod_Sit '+
                        ' and Ven.I_Cod_Ven = Orc.I_Cod_Ven');
   CadOrcamento.sql.add(' order by Orc.I_Lan_Orc');
   CadOrcamento.open;
   GOrcamento.ALinhaSQLOrderBy := CadOrcamento.SQL.Count - 1;
   if CTotal.Checked then
     AtualizaTotal
   else
   begin
     EValorTotal.text := '0';
     EQtdTotal.text := '0';
   end;
end;

{****************** adiciona os filtros da cotacao ****************************}
procedure TFCotacao.AdicionaFiltros(VpaSelect : TStrings);
var
  Orc : string;
begin
  if TipoOrcamento then
    orc := ' and Orc.C_Tip_Cad = ''O'' '
  else
   orc := ' and Orc.C_Tip_Cad = ''P'' ';

  VpaSelect.add(' Where Orc.I_Emp_Fil = ' + IntToStr(Varia.CodigoEmpFil) + orc );

  case TipoData.ItemIndex of
    0 :  VpaSelect.add(' and  orc.D_DAT_Orc between ''' + DataToStrFormato(AAAAMMDD,DataInicial.Date,'/') + '''' +
                       ' and ''' + DataToStrFormato(AAAAMMDD,DataFinal.Date,'/') + ''''  );
    1 :  VpaSelect.add(' and  d_dat_ent between ''' + DataToStrFormato(AAAAMMDD,DataInicial.Date,'/') + '''' +
                       ' and ''' + DataToStrFormato(AAAAMMDD,DataFinal.Date,'/') + ''''  );
    2 : VpaSelect.add( ' and orc.D_DAT_Pre between ''' + DataToStrFormato(AAAAMMDD,DataInicial.Date,'/') + '''' +
                       ' and ''' + DataToStrFormato(AAAAMMDD,DataFinal.Date,'/') + ''''  );
  end;

   if ECliente.Text <> '' Then
     VpaSelect.Add(' and Orc.I_Cod_Cli = '+ ECliente.text);

   if ESituacao.Text <> '' Then
     VpaSelect.Add(' and Orc.I_Cod_sit = '+ ESituacao.Text);

   if EVendedor.text <> '' then
     VpaSelect.add(' and Orc.I_Cod_Ven = ' + EVendedor.Text);

   if Flag.ItemIndex = 0 then
      VpaSelect.add(' and orc.C_Fla_Sit = ''A''')
   else
      if flag.ItemIndex = 1 Then
        VpaSelect.add(' and orc.C_Fla_Sit = ''C''')
      else
        if flag.ItemIndex = 2 Then
           VpaSelect.add(' and orc.C_Fla_Sit = ''E''');

  if CodOr_Ped.AValor <> 0 then
  begin
    if TipoOrcamento then
      VpaSelect.add('and i_nro_orc = ' + intToStr(trunc(CodOr_Ped.AValor)))
    else
      VpaSelect.add('and i_nro_ped = ' + intToStr(trunc(CodOr_Ped.AValor)));
  end;

  if EProduto.text <> '' then
    VpaSelect.add(' and Orc.I_Lan_Orc in ( Select I_Lan_Orc from MovOrcamentos mov '+
                  ' Where Mov.I_Seq_Pro = ' + IntToStr(VprSeqProduto) +
                  ' and Mov.I_Emp_Fil = ' + IntToStr(Varia.CodigoEmpfil)+ ')');
end;

{************************* atualiza os totais *********************************}
procedure TFCotacao.AtualizaTotal;
begin
  AdicionaSQLAbreTabela(Aux,' Select Sum(N_Vlr_Tot) Valor, Count(I_Lan_Orc) Qtd '+
                            ' from CadOrcamentos Orc ');
  AdicionaFiltros(Aux.Sql);
  Aux.open;
  EValorTotal.Text := FormatFloat(varia.MascaraMoeda,Aux.FieldByName('Valor').AsFloat);
  EQtdTotal.Text := Aux.FieldByName('Qtd').Asstring;
end;

{*****************Posiciona o MovOrcamento de acordo com o Cad*****************}
procedure TFCotacao.PosMovOrcamento(VpaOrcamento : String);
begin
   MovOrcamentos.close;
   if ((Vpaorcamento <> '') and not(TeclaPressionada)) then
   begin
     MovOrcamentos.sql.clear;
     MovOrcamentos.sql.add(' Select Mov.I_Emp_Fil, Mov.I_Lan_Orc, Mov.N_Qtd_Pro, Mov.N_Vlr_Pro, Mov.N_Vlr_Tot, Mov.C_Cod_Uni, '+
                           ' C_Imp_Fot, C_Fla_Res,Mov.N_Qtd_Bai, Pro.C_Nom_Pro, Pro.I_Seq_Pro,  ');
     if UpperCase(Varia.CodigoProduto) = 'C_COD_PRO' Then
       MovOrcamentos.Sql.add('Pro.'+Varia.CodigoProduto + ' C_Cod_Pro')
     else
       MovOrcamentos.Sql.add('QTD.'+Varia.CodigoProduto + ' C_Cod_Pro');

     MovOrcamentos.sql.add(' from dba.MovOrcamentos Mov, CadProdutos Pro, MovQdadeProduto QTD' +
                           ' Where mov.I_Emp_Fil = ' + IntToStr(varia.CodigoEmpFil) +
                           ' and Mov.I_Lan_Orc = ' + VpaOrcamento +
                           ' and Mov.I_Seq_Pro = Pro.I_Seq_Pro '+
                           ' and Mov.I_Seq_Pro = Qtd.I_Seq_Pro '+
                           ' and Mov.I_Emp_Fil = QTd.I_Emp_Fil '+
                           ' union ' +
                           ' Select Orc.I_Emp_Fil, Orc.I_Lan_Orc,Orc.N_Qtd_Ser, '+
                           ' Orc.N_Vlr_Ser,Orc.N_Vlr_Tot, ''SE''  Unis,  ''-'' Foto, '+
                           ' ''-'' Res, N_QTD_BAI, Ser.C_Nom_Ser, Ser.I_Cod_ser, Cast(Ser.I_Cod_Ser as Char) C_Cod_Pro '+
                           ' from movservicoorcamento orc, cadservico ser ' +
                           ' Where orc.I_Emp_Fil = ' + IntToStr(varia.CodigoEmpFil) +
                           ' and Orc.I_Lan_Orc = ' + VpaOrcamento +
                           ' and Orc.I_Cod_Ser = Ser.I_Cod_Ser ');
     MovOrcamentos.open;
   end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{*************************Atualiza o MovOrcamento******************************}
procedure TFCotacao.CadOrcamentoAfterScroll(DataSet: TDataSet);
begin
  if PermiteAlterar then
  begin
    PosMovOrcamento(CadOrcamentoI_Lan_Orc.AsString);
    BtAlterar.Enabled := CadOrcamentoC_Fla_Sit.AsString = 'A';
    BtExcluir.Enabled := (CadOrcamentoC_Fla_Sit.AsString = 'A') or (CadOrcamentoC_Fla_Sit.AsString = 'E');
    BGeraNota.Enabled := CadOrcamentoC_Fla_Sit.AsString = 'A';
    BtCancela.Enabled := CadOrcamentoC_Fla_Sit.AsString = 'A';
    BtbImprimir.Enabled := CadOrcamentoC_Fla_Sit.AsString <> 'C';
    if not TipoOrcamento then
      BitBtn1.Enabled := CadOrcamentoC_Fla_Sit.AsString = 'C';
  end
  else
  begin
    BtAlterar.Enabled := PermiteAlterar;
    BtExcluir.Enabled := PermiteAlterar;
    BtCancela.Enabled := PermiteAlterar;
    BGeraNota.Enabled := PermiteAlterar;
    BitBtn1.Enabled := PermiteAlterar;
    BitBtn2.Enabled := PermiteAlterar;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Ações do Grid CadOrçamento e seus Filtros
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************Quando soltado a tecla posicona o movorcamento****************}
procedure TFCotacao.GOrcamentoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   TeclaPressionada := False;
   if key in[37..40]  then
      PosMovOrcamento(CadOrcamentoI_Lan_Orc.AsString);
end;

{*******************Não deixa fazer mais os filtros****************************}
procedure TFCotacao.GOrcamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 46 then
    BtExcluirClick(BtExcluir);
  TeclaPressionada := true;
end;

{******************* no enter do grid *************************************** }
procedure TFCotacao.GOrcamentoEnter(Sender: TObject);
begin
  TeclaPressionada := false;
end;

{*************** quando um click no grid ************************************ }
procedure TFCotacao.GOrcamentoCellClick(Column: TColumn);
begin
  TeclaPressionada := false;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações dos Botões Inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*************** marca a posicao e atualiza a tabela de consulta ************* }
procedure TFCotacao.AtualizaTabelaMarcaPosicao;
var
  VpfPosicao : TBookmark;
begin
  VpfPosicao := CadOrcamento.GetBookmark;
  AtualizaConsulta;
  try
    if not CadOrcamento.eof then
      CadOrcamento.GotoBookmark(VpfPosicao);
  except
    CadOrcamento.First;
  end;
  Cadorcamento.FreeBookmark(VpfPosicao);
end;

{************************ cadastra um novo orcamento **************************}
procedure TFCotacao.BCadastrarClick(Sender: TObject);
begin
  if TipoOrcamento then
  begin
    FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaCotacao'));
    FNovaCotacao.NovaCotacao
  end
  else
  begin
    FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaCotacao1'));
    FNovaCotacao.NovoPedido;
  end;
  FNovaCotacao.free;
  AtualizaConsulta;
end;

{************************** consulta o orcamento ******************************}
procedure TFCotacao.BConsultaClick(Sender: TObject);
begin
  if CadOrcamentoI_Lan_Orc.AsInteger <> 0 then
  begin
    FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',true);
    FNovaCotacao.ConsultaCotacao(CadOrcamentoI_Lan_Orc.Asstring, TipoOrcamento);
    FNovaCotacao.free;
  end;
end;

{*****************Chama a rotina para alterar o MovOrçamento*******************}
procedure TFCotacao.BtAlterarClick(Sender: TObject);
begin
   if SenhaFaturamento then
   if not CadOrcamentoI_Lan_Orc.IsNull then
   begin
      FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaCotacao'));
      FNovaCotacao.AlteraCotacao(CadOrcamentoI_Lan_Orc.AsString, TipoOrcamento);
      FNovaCotacao.free;
      AtualizaTabelaMarcaPosicao;
   end;
end;

{******************Chama a rotina para Excluir o Orçamento*********************}
procedure TFCotacao.BtExcluirClick(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
begin
  if SenhaFaturamento then
    if not CadOrcamento.IsEmpty then
      if (Confirmacao(CT_DeletaRegistro)) and not(CadOrcamentoI_Lan_Orc.IsNull) then
      begin
        Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
        if Cotacao.ExcluiVerificaOrcamento(CadOrcamentoI_Lan_Orc.AsString, MovOrcamentos) then
          AtualizaTabelaMarcaPosicao;
        Cotacao.free;
      end;
end;

{************************* gera a nota fiscal *********************************}
procedure TFCotacao.BGeraNotaClick(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
  NotaOk : Boolean;
begin
  if Varia.NaturezaNota <> ''
   then
  begin
    IF CadOrcamentoC_Fla_Sit.Asstring = 'A' Then
    begin
      FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));
      PainelTempo1.execute('Gerando Nota Fiscal...');
      if TipoOrcamento then
        NotaOk := FNovaNotaFiscal.GeraNotaOrcamento(CadOrcamentoI_Lan_Orc.Asstring, CadOrcamentoi_nro_orc.AsString, false)
      else
        NotaOk := FNovaNotaFiscal.GeraNotaOrcamento(CadOrcamentoI_Lan_Orc.Asstring, CadOrcamentoi_nro_ped.AsString, true);
      FNovaNotaFiscal.free;
      if NotaOk then
      begin
        Cotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDAdos);
        Cotacao.BaixaOrcamento(CadOrcamentoI_Lan_Orc.Asstring);
        Cotacao.NotasDoOrcamento(CadOrcamentoI_Lan_Orc.Asstring);
        Cotacao.free;
      end;
      PainelTempo1.fecha;
      AtualizaTabelaMarcaPosicao;
    end
    else
      AvisoFormato(CT_ORCAMENTOESGOTADO, [TextoPedOrcamento,TextoPedOrcamento]);
  end
  else
    aviso('Não foi definido nenhuma natureza padrão na configuração de sistema.');
end;

{******************** visualiza nota fiscal ***********************************}
procedure TFCotacao.BVerNotaClick(Sender: TObject);
begin
  AdicionaSQLAbreTabela(Aux,' Select I_Seq_Not from CadNotaFiscais '+
                            ' Where I_Emp_Fil = '+ InttoStr(Varia.CodigoEmpFil) +
                            ' and I_Lan_Orc = '+ CadOrcamentoI_Lan_Orc.AsString);
  if Aux.eof then
    aviso(CT_NAOEXISTENOTA);

  While not Aux.Eof do
  begin
    FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(Application,'',true);
    FNovaNotaFiscal.ConsultaNotafiscal(Aux.FieldByName('I_Seq_Not').AsInteger);
    FNovaNotaFiscal.free;
    Aux.Next;
  end;
end;

{*******************Chama a rotina para cancelar o orcamento*******************}
procedure TFCotacao.BtCancelaClick(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
begin
  if SenhaFaturamento then
  begin
    if CadOrcamentoI_Lan_Orc.AsInteger <> 0 then
      if ConfirmacaoFormato(CT_CANCELAR, [TextoPedOrcamento]) then
      begin
        Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
        if cotacao.CancelaOrcamento(CadOrcamentoI_Lan_Orc.AsInteger) then
          AtualizaTabelaMarcaPosicao;
        Cotacao.free;
      end;
   end;
end;

{***************************Imprime o orcamento********************************}
procedure TFCotacao.BtbImprimirClick(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
  VpfOrcamento, VpfNroOrcamento : String;
begin
  Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
  if TipoOrcamento then
  begin
    case varia.TipoRelatorioOrcamento of
      0 : Cotacao.ImprimePedidoMatricial_1(CadOrcamentoI_LAN_ORC.AsInteger, CadOrcamentoI_NRO_ORC.AsInteger,true, CriaParcelas) ;
      1 : begin
            VpfOrcamento := CadOrcamentoI_LAN_ORC.AsString;
            VpfNroOrcamento := CadOrcamentoI_NRO_ORC.AsString;
            FImpOrcamento := TFImpOrcamento.criarSDI(Application,'',FPrincipal.VerificaPermisao('FImpOrcamento'));
            FImpOrcamento.VisualizaImpressao(VpfOrcamento,VpfNroOrcamento);
            FImpOrcamento.free;
          end;
      2 : Begin
            rel.Connect.Retrieve;
            rel.Connect.DatabaseName := varia.AliasBAseDados;
            rel.Connect.ServerName := varia.AliasRelatorio;
            rel.WindowState := wsMaximized;
            rel.ParamFields.Retrieve;
            rel.ParamFields[0].Value := CadOrcamentoI_NRO_ORC.AsString;
            rel.ParamFields[1].Value := CadOrcamentoI_EMP_FIL.AsString;
            rel.execute;
         end;
    end;
  end
  else
  begin
    case varia.TipoRelatorioPedido of
      0 : Cotacao.ImprimePedidoMatricial_1(CadOrcamentoI_LAN_ORC.AsInteger, CadOrcamentoI_NRO_PED.AsInteger, false, CriaParcelas) ;
      1 : begin
            VpfOrcamento := CadOrcamentoI_LAN_ORC.AsString;
            VpfNroOrcamento := CadOrcamentoI_NRO_PED.AsString;
            FImpPedido.VisualizaImpressao(VpfOrcamento,VpfNroOrcamento);
          end;
      2 : Begin
            if rel <> nil then
              rel.free;
              rel := TCrpe.Create(self);
              rel.ReportName := varia.PathRel + 'Diverso\PedidoVenda.rpt';
              rel.Connect.Retrieve;
              rel.Connect.DatabaseName := varia.AliasBAseDados;
              rel.Connect.ServerName := varia.AliasRelatorio;
              rel.WindowState := wsMaximized;
              rel.ParamFields.Retrieve;
              rel.ParamFields[0].Value := CadOrcamentoI_NRO_PED.AsString;
              rel.ParamFields[1].Value := CadOrcamentoI_EMP_FIL.AsString;
              rel.execute;
          end;
    end;
  end;
  cotacao.IncrementaImpressao(CadOrcamentoI_LAN_ORC.AsInteger);
  Cotacao.free;
  AtualizaTabelaMarcaPosicao;
end;

{******************* Mostra os graficos ***************************************}
procedure TFCotacao.BGraficosClick(Sender: TObject);
begin
  PanelColor1.Enabled := false;
  PanelColor2.Enabled := false;
  GOrcamento.Enabled := false;
  GridMov.Enabled := false;
  PGraficos.Top := 16;
  PGraficos.Visible := true;
end;

{**************** transforma um orcamento em pedido ************************* }
procedure TFCotacao.BitBtn1Click(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
begin
  if TipoOrcamento then
  begin
    if Confirmacao('Deseja relmentes transformar o orçamento ' + CadOrcamentoi_nro_orc.AsString +
                   'em pedido ?') then
    begin
      Cotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDAdos);
      Cotacao.TransformaOrcamentoEmPedido(CadOrcamentoI_Lan_Orc.AsString);
      Cotacao.free;
      AtualizaConsulta;
    end;  
  end
  else
    if SenhaFaturamento then
    begin
      Cotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDAdos);
      Cotacao.EstornaCancelaOrcamento(CadOrcamentoI_Lan_Orc.AsInteger);
      Cotacao.free;
      AtualizaConsulta;
  end;
end;

{****************************Fecha o Formulario corrente***********************}
procedure TFCotacao.BFecharClick(Sender: TObject);
begin
  Close;
end;

{*********************** help ************************************************ }
procedure TFCotacao.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FCotacao.HelpContext);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{********************** mostra ou nao os filtros ******************************}
procedure TFCotacao.BMaisClick(Sender: TObject);
begin
  PanelColor1.Visible := not BMais.Down;
end;

{****************** chama a rotina para limpar os filtros *********************}
procedure TFCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key  of
    Vk_f5 : LimpaFiltros;
    vk_Up :
      if PossuiFoco(PanelColor1) Then
      begin
        GOrcamento.setfocus;
        Atualizaconsulta;
        IF not MovOrcamentos.bof then
          MovOrcamentos.prior;
      end;
    vk_Down :
      if PossuiFoco(PanelColor1) Then
      begin
        GOrcamento.setfocus;
        Atualizaconsulta;
        if not MovOrcamentos.Eof then
          MovOrcamentos.next;
      end;
  end;
end;

{**************** atualiza a consulta com os totais ***************************}
procedure TFCotacao.CTotalClick(Sender: TObject);
begin
  AtualizaTabelaMarcaPosicao;
end;

{**************** abre a consulta pedido ou orcamento *********************** }
procedure TFCotacao.AbreConsulta( orcamento : boolean);
begin
   TipoOrcamento := orcamento;
   if TipoOrcamento then
     PermiteAlterar := FPrincipal.unpri.VerificaPermissaoFilial('FNovaCotacao', false)
   else
     PermiteAlterar := FPrincipal.unpri.VerificaPermissaoFilial('FNovaCotacao1', false);

   AtualizaConsulta;
   if not TipoOrcamento then
   begin
     TextoPedOrcamento := 'pedido';
     self.Caption := 'Consulta Pedido';
     PainelGradiente1.Caption := 'Consulta Pedido';
     BitBtn1.Caption := 'Estor. Cancel.';
     BFlag.Caption := '&Estado do Pedido';
     GOrcamento.Columns[0].FieldName := 'i_nro_ped';
     GOrcamento.AListaCAmpos.Delete(0);
     GOrcamento.AListaCAmpos.Insert(0,'i_nro_ped');
     GOrcamento.Columns[2].Title.Caption := 'Dt Ped. [+]';
     GOrcamento.Columns[3].Title.Caption := 'Hr Ped. [+]';
   end
   else
   begin
     TextoPedOrcamento := 'Orçamento';
     BitBtn1.Caption := 'Gera Pedido';
   end;
   self.ShowModal;
end;

procedure TFCotacao.BImpCupomClick(Sender: TObject);
var
  Cotacao : TFuncoesCotacao;
begin
  Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
  if TipoOrcamento then
    cotacao.ImprimeCupomNaoVinculado(CadOrcamentoI_Lan_Orc.AsInteger, CadOrcamentoi_nro_orc.AsInteger, false)
  else
    cotacao.ImprimeCupomNaoVinculado(CadOrcamentoI_Lan_Orc.AsInteger, CadOrcamentoi_nro_ped.AsInteger, true);
  Cotacao.free;
end;

{******************* muda a situacao **************************************** }
procedure TFCotacao.BitBtn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (shift = [ssAlt, ssCtrl, ssShift]) and (key = 66)  then
  begin
    FDadosOrcamento := TFDadosOrcamento.CriarSDI(application, '', true);
    if FDadosOrcamento.EfetuaBaixa(CadOrcamentoI_Lan_Orc.AsInteger) then
    begin
      BitBtn2Click(nil);
      AtualizaTabelaMarcaPosicao;
    end;
   end;
end;

{**************** muda situacao do pedido ou orcamento ********************* }
procedure TFCotacao.BitBtn2Click(Sender: TObject);
var
  Nome : string;
  Cotacao : TFuncoesCotacao;
  Baixar : boolean;
begin
 if SenhaFaturamento then
 begin

    if TipoOrcamento then
      nome := 'Orçamento'
    else
      nome := 'Pedido';

    baixar := true;
    if Sender <> nil then
      Baixar := Confirmacao('Deseja realmente mudar a situação deste ' + Nome + '?');

    if Baixar then
    begin
       Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
       if CadOrcamentoC_Fla_Sit.AsString = 'A'then  // esta aberto agora fecha
       begin
         cotacao.BaixaReservaProdutoOrcamentoTotal(CadOrcamentoI_Lan_Orc.AsInteger);
         Cotacao.MudaSituacao(CadOrcamentoI_Lan_Orc.AsString, true, true);
       end
       else  // esta fecahdo agora abre
       begin
         cotacao.ReservaProdutoOrcamentoTotal(CadOrcamentoI_Lan_Orc.AsInteger);
         Cotacao.MudaSituacao(CadOrcamentoI_Lan_Orc.AsString, false, true);
       end;

       Cotacao.free;
       AtualizaTabelaMarcaPosicao;
    end;
  end;  
end;


Initialization
{ *************** Registra a classe paraprocedure  evitar duplicidade ****************** }
 RegisterClasses([TFCotacao]);
end.
