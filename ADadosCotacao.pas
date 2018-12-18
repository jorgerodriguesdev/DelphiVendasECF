unit ADadosCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Localizacao, Buttons, StdCtrls, Componentes1, ExtCtrls, PainelGradiente,
  Db, DBTables;

type
  TFDadosOrcamento = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    Localiza: TConsultaPadrao;
    Label3: TLabel;
    EPlano: TEditColor;
    BPlano: TSpeedButton;
    LPlano: TLabel;
    Label20: TLabel;
    EdcFormaPgto: TEditLocaliza;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    BtCancela: TBitBtn;
    BOk: TBitBtn;
    Aux: TQuery;
    Tempo: TPainelTempo;
    Label14: TLabel;
    EOpEstoque: TEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    CadVendedor: TQuery;
    Aux2: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EPlanoExit(Sender: TObject);
    procedure EPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdcFormaPgtoRetorno(Retorno1, Retorno2: String);
    procedure EPlanoChange(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
  private
    TipoFormaPgto : string;
    Lancamento : integer;
    acao : Boolean;
    function BaixaPed_Orc( LanOrcamento : Integer ) : Boolean;
    procedure ListaDeValorPercProduto( Valor, Percentual : TStringList; SeqOrc_ped : Integer );
  public
    function EfetuaBaixa( LanOrcamento : Integer ) : Boolean;
  end;

var
  FDadosOrcamento: TFDadosOrcamento;

implementation

uses APrincipal, APlanoConta, UnCotacao, constmsg, constantes,funsql,
     Uncontasareceber, unProdutos, UnNotaFiscal;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFDadosOrcamento.FormCreate(Sender: TObject);
begin
  {  abre tabelas }
  { chamar a rotina de atualização de menus }
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFDadosOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 { fecha tabelas }
 { chamar a rotina de atualização de menus }
 Action := CaFree;
end;


{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFDadosOrcamento.EPlanoExit(Sender: TObject);
var
  VpfCodigo : string;
begin
  FPlanoConta := TFPlanoConta.criarSDI(Self, '', True);
  VpfCodigo := EPlano.Text;
  if not FPlanoConta.verificaCodigo(VpfCodigo, 'C', LPlano, False, (Sender is TSpeedButton)) then
    EPlano.SetFocus;
  EPlano.text := VpfCodigo;
end;

procedure TFDadosOrcamento.EPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift : TShiftState);
begin
  if Key = 114 then
    BPlano.Click;
end;

procedure TFDadosOrcamento.EdcFormaPgtoRetorno(Retorno1, Retorno2: String);
begin
  if Retorno1 <> '' then
    TipoFormaPgto  := Retorno1;
end;

function TFDadosOrcamento.EfetuaBaixa( LanOrcamento : Integer ) : Boolean;
begin
  result := true;
  self.Lancamento := LanOrcamento;
  self.ShowModal;
  result := acao;
end;

{gera string list dos valores e percentuais dos produtos, caso comissao por produtos }
procedure TFDadosOrcamento.ListaDeValorPercProduto( Valor, Percentual : TStringList; SeqOrc_ped : Integer );
begin
  AdicionaSQLAbreTabela(Aux2, ' select MovOrc.n_vlr_tot, mov.n_per_com from ' +
                              ' MovOrcamentos as MovOrc, MovQdadeProduto mov ' +
                              ' where MovOrc.i_lan_orc = ' + IntToStr(SeqOrc_ped) +
                              ' and MovPrc.i_emp_fil =  ' + intToStr(varia.codigoEmpFil) +
                              ' and MovOrc.i_seq_pro = mov.i_seq_pro ' +
                              ' and Mov.i_emp_fil =  ' + intToStr(varia.codigoEmpFil) );
  Aux2.First;
  valor.Clear;
  Percentual.Clear;
  while not Aux2.Eof do
  begin
    valor.Add(FloatToStr(Aux2.FieldByName('n_vlr_tot').AsFloat));
    Percentual.add(FloatToStr(Aux2.FieldByName('n_per_com').AsFloat));
    Aux2.Next;
  end;
  Aux2.close;

  if ConfigModulos.Servico then
  begin
    AdicionaSQLAbreTabela(Aux2, ' select MovSer.n_vlr_tot, cad.n_per_com from ' +
                                ' MovServicoNota as MovSer, cadServico cad ' +
                                ' where MovSer.i_seq_not = ' + IntToStr(SeqOrc_ped) +
                                ' and MovSer.i_emp_fil =  ' + intToStr(varia.codigoEmpFil) +
                                ' and MovSer.i_cod_ser  = cad.i_cod_ser ' +
                                ' and Cad.I_Cod_emp = ' + IntToStr(varia.CodigoEmpresa) );
    Aux2.First;
    while not Aux2.Eof do
    begin
      valor.Add(FloatToStr(Aux2.FieldByName('n_vlr_tot').AsFloat));
      Percentual.add(FloatToStr(Aux2.FieldByName('n_per_com').AsFloat));
      Aux2.Next;
    end;
    Aux2.close;
  end;
end;

function  TFDadosOrcamento.BaixaPed_Orc( LanOrcamento : Integer ) : Boolean;
var
  Cotacao : TFuncoesCotacao;
  NF : TFuncoesNotaFiscal;
  UnCR : TFuncoesContasAReceber;
  Dado : TDadosNovaContaCR;
  UnProdutos : TFuncoesProduto;
  VpfValorNota, troco, valorTotal : double;
  ValorPro, PercPro : TstringList;
  LancamentoCR, FormaPgto : integer;
  Unidade : string;
  DataOrc : tdatetime;
begin

  result := true;
  Cotacao := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
  NF := TFuncoesNotaFiscal.criar(self, Fprincipal.BaseDados );
  UnCR := TFuncoesContasAReceber.criar(self, Fprincipal.BaseDados );
  UnProdutos := TFuncoesProduto.criar(self, Fprincipal.BaseDados );

  try
    // localiza o cadOrcamento/pedido
    cotacao.LocalizaCadOrcamento(Aux, IntToStr(LanOrcamento));
    DataOrc := Aux.FieldByName('D_DAT_ORC').AsDateTime;

    if (ConfigModulos.ContasAReceber) or (ConfigModulos.Comissao) or (ConfigModulos.caixa) then
    begin
      Tempo.execute('Criando parcelas do contas a receber ... ');

      // verifica se o desconto esta na condicao de pagto, par naum duplicar os desc ou acre
      // se  EDescAcr.Enabled = true descontlo na nota false na condicao
{      if EDescAcr.Enabled then
        VpfValorNota := aux.fieldbyName('N_TOT_NOT').AsCurrency
      else
        VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency - EDescAcr.Field.AsCurrency;}

        Dado := TDadosNovaContaCR.Create;
        Dado.CodEmpFil := Varia.CodigoEmpFil;
        Dado.NroNota := 0;
        Dado.SeqNota := 0;
        Dado.CodCondicaoPgto := Aux.FieldByName('I_COD_PAG').AsInteger;
        Dado.CodCliente := Aux.FieldByName('I_COD_CLI').AsInteger;
        Dado.CodFrmPagto := strtoint(EdcFormaPgto.text);
        Dado.CodMoeda :=  varia.MoedaBase;
        Dado.CodUsuario := varia.CodigoUsuario;
        Dado.DataMov := date;
        Dado.DataEmissao := date;
        Dado.PlanoConta := EPlano.Text;
        Dado.ValorTotal := aux.fieldbyName('N_VlR_TOT').AsCurrency; //VpfValorNota;
        Dado.PercentualDescAcr := 0;
        Dado.VerificarCaixa := false;
        Dado.BaixarConta := true;
        dado.DataBaixa := date;
        Dado.MostrarParcelas := true;
        Dado.MostrarTelaCaixa := false;
        Dado.TipoFrmPAgto := TipoFormaPgto;
        Dado.GerarComissao := true;

        // comissao
        AdicionaSQLAbreTabela(CadVendedor, ' Select * from cadVendedores where i_cod_ven = ' +
                                            Aux.FieldByName('I_COD_VEN').AsString );

        Dado.CodVendedor := Aux.FieldByName('I_COD_VEN').AsInteger;
//        Dado.TipoComissao := CadVendedor.fieldByName('i_tip_com').asinteger;
//        Dado.PercComissaoPro := CadVendedor.fieldByName('n_per_com').AsCurrency;
//        if Dado.TipoComissao = 0 then // direta
//        begin
           Dado.ValorPro :=  nil;
           Dado.PercPro :=  nil;
//           Dado.ValorComPro := Aux.FieldByName('N_VLR_TOT').AsCurrency;
//           Dado.PercComissaoServ := CadVendedor.fieldByName('n_per_ser').AsCurrency;
//           Dado.ValorComServ := 0;
//        end
//        else
//        begin  // caso produtos
//           ValorPro := TstringList.create;
//           PercPro := TstringList.create;
//           NF.ListaDeValorPercProduto( ValorPro, PercPro, 0 );
//           Dado.ValorPro := ValorPro;
//           Dado.PercPro := PercPro;
//        end;

//          LancamentoCR := UnCR.CriaContaReceber( dado, ValorTotal,  Troco, FormaPgto, false );
//          Dado.free;

//          if LancamentoCR = 0 then
            result := false;
       end;

     // baixa em estoque
      if ConfigModulos.Estoque then
      begin
        Tempo.execute('Atualizando Estoque Produto...');
         // localiza o cadOrcamento/pedido
        cotacao.LocalizaMovOrcamento(Aux, IntToStr(varia.CodigoEmpFil), IntToStr(LanOrcamento));

        Aux.First;
        while not Aux.Eof do
        begin
          Unidade := UnProdutos.UnidadePadrao(Aux.fieldByname('I_SEQ_PRO').AsInteger);
          UnProdutos.BaixaProdutoEstoque( Aux.fieldByname('I_SEQ_PRO').AsInteger,
                                          strtoInt(EOpEstoque.Text),
                                          0, 0, varia.MoedaBase,0, DataOrc,
                                          Aux.fieldByname('N_QTD_PRO').AsFloat,
                                          Aux.fieldByname('N_VLR_TOT').AsFloat,
                                          Aux.fieldByname('C_COD_UNI').AsString,
                                          unidade);
           Aux.Next;
        end;
      end;
      Tempo.fecha;

    except
      on E : Exception do
      begin
        if FPrincipal.BaseDados.InTransaction then
          FPrincipal.BaseDados.Rollback;
        erro('A Baixa não foi gerada.'+ ' '+E.Message);
      end;
    end;
  cotacao.free;
  nf.free;
  UnProdutos.free;
  UnCR.free;
end;

procedure TFDadosOrcamento.EPlanoChange(Sender: TObject);
begin
  if (EPlano.Text = '') or (EdcFormaPgto.Text = '') then
    BOk.Enabled := false
  else
    BOk.Enabled := true;
end;

procedure TFDadosOrcamento.BOkClick(Sender: TObject);
begin
  acao := true;
  BaixaPed_Orc(Lancamento);
  self.close;
end;

procedure TFDadosOrcamento.BtCancelaClick(Sender: TObject);
begin
  acao := false;
  self.close;
end;

Initialization
 RegisterClasses([TFDadosOrcamento]);
end.
