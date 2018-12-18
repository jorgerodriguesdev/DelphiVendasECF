unit AConsultaVendaPeriodo;

interface

uses
  Windows, Messages, SysUtils,  Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Componentes1, ExtCtrls, PainelGradiente, StdCtrls, Buttons, ComCtrls,
  Localizacao, Grids, DBGrids, Tabela, DBKeyViolation, Db, DBTables, Mask,
  DBCtrls, numericos, UnNotaFiscal;

type
  TFConsultaVendaPeriodo = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    BFechar: TBitBtn;
    Localiza: TConsultaPadrao;
    Cheques: TQuery;
    DataCheques: TDataSource;
    ChequesI_NRO_NOT: TIntegerField;
    ChequesD_DAT_PAG: TDateField;
    ChequesN_VLR_PAG: TFloatField;
    ChequesC_NOM_CLI: TStringField;
    ChequesI_SEQ_NOT: TIntegerField;
    ChequesI_COD_CLI: TIntegerField;
    ChequesD_DAT_VEN: TDateField;
    ChequesD_DAT_EMI: TDateField;
    ChequesI_COD_FRM: TIntegerField;
    PanelColor1: TPanelColor;
    Paginas: TPageControl;
    PagamentoTab: TTabSheet;
    GridIndice1: TGridIndice;
    PanelColor3: TPanelColor;
    Label18: TLabel;
    SpeedButton4: TSpeedButton;
    Label20: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    EditLocaliza4: TEditLocaliza;
    DataParcela1: TCalendario;
    dataParcela2: TCalendario;
    FormaPagto: TEditLocaliza;
    Label2: TLabel;
    MovCheques: TQuery;
    MovChequesNomeForma: TStringField;
    MovChequesI_SEQ_TER: TIntegerField;
    MovChequesI_COD_BAN: TIntegerField;
    MovChequesI_COD_FRM: TIntegerField;
    MovChequesI_FIL_APG: TIntegerField;
    MovChequesI_LAN_APG: TIntegerField;
    MovChequesI_PAR_APG: TIntegerField;
    MovChequesI_FIL_REC: TIntegerField;
    MovChequesI_LAN_REC: TIntegerField;
    MovChequesI_PAR_REC: TIntegerField;
    MovChequesC_EMI_CHE: TStringField;
    MovChequesC_NRO_CHE: TStringField;
    MovChequesD_DAT_COM: TDateField;
    MovChequesD_DAT_CAD: TDateField;
    MovChequesN_VLR_CHE: TFloatField;
    MovChequesC_CHE_DEV: TStringField;
    DataMovCheques: TDataSource;
    FormaPagamento: TQuery;
    ChequesI_LAN_REC: TIntegerField;
    ChequesN_VLR_PAR: TFloatField;
    ChequesC_NOM_FRM: TStringField;
    ChequesC_NRO_CHE: TStringField;
    ChequesD_CHE_VEN: TDateField;
    ChequesI_COD_BAN: TIntegerField;
    ChequesI_NRO_PAR: TIntegerField;
    ChequesC_NOM_BAN: TStringField;
    Soma: TQuery;
    numerico1: Tnumerico;
    Label9: TLabel;
    BBAjuda: TBitBtn;
    BCancelaVenda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure FormaPagtoRetorno(Retorno1, Retorno2: String);
    procedure dataParcela2CloseUp(Sender: TObject);
    procedure GradeExit(Sender: TObject);
    procedure MovChequesAfterInsert(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure BCancelaVendaClick(Sender: TObject);
  private
    TipoFrm : string;
    NF : TFuncoesNotaFiscal;
    procedure AbreConsulta;
    procedure AbreMovCheques(Lancamento, Parcela: Integer);
  public
    { Public declarations }
  end;

var
  FConsultaVendaPeriodo: TFConsultaVendaPeriodo;

implementation

uses APrincipal, funsql, fundata, Constantes;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConsultaVendaPeriodo.FormCreate(Sender: TObject);
begin
  Paginas.ActivePage := PagamentoTab;
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  DataParcela1.Date := PrimeiroDiaMes(date);
  DataParcela2.Date := UltimoDiaMes(date);
  BCancelaVenda.Enabled := not ConfigModulos.NotaFiscal;
  AbreConsulta;
  NF := TFuncoesNotaFiscal.Criar(self, FPrincipal.BaseDados);
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConsultaVendaPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NF.free;
  Cheques.close;
  MovCheques.close;
  FormaPagamento.close;
  soma.close;
  Action := CaFree;
end;

procedure TFConsultaVendaPeriodo.BFecharClick(Sender: TObject);
begin
  Self.close;
end;


procedure TFConsultaVendaPeriodo.AbreConsulta;
begin
  LimpaSQLTabela(Cheques);
  InseriLinhaSQL(Cheques, 0, ' select ' );
  InseriLinhaSQL(Cheques, 1, ' CP.I_LAN_REC, CP.I_SEQ_NOT, MCP.I_NRO_PAR, ' +
                             ' CP.I_COD_CLI, CP.I_NRO_NOT,  ' +
                             ' MCP.D_DAT_VEN, CP.D_DAT_EMI, ' +
                             ' MCP.N_VLR_PAR, MCP.D_DAT_PAG, ' +
                             ' MCP.N_VLR_PAG, MCP.I_COD_FRM, B.C_NOM_BAN, ' +
                             ' MCP.C_NRO_CHE, MCP.D_CHE_VEN, MCP.I_COD_BAN, ' +
                             ' C.C_NOM_CLI, F.C_NOM_FRM ' );
  InseriLinhaSQL(Cheques, 2, ' from ' +
                             ' MovContasAReceber as MCP, ' +
                             ' CadContasAReceber as CP, ' +
                             ' CadClientes as C, '+
                             ' cadformaspagamento F, ' +
                             ' cadbancos B, '  +
                             ' movforma frm ' +
                             ' where ' );
  InseriLinhaSQL(Cheques, 3, SQLTextoDataEntreAAAAMMDD('CP.D_DAT_EMI',
                             DataParcela1.Date, DataParcela2.Date, false) +
                             ' and ISNULL(MCP.C_DUP_CAN, ''N'') = ''N''' );
  if FormaPagto.Text <> '' then
    InseriLinhaSQL(Cheques, 4, ' and MCP.I_COD_FRM = ' + FormaPagto.Text )
  else
    InseriLinhaSQL(Cheques, 4, ' ');
  if EditLocaliza4.Text <> '' then
    InseriLinhaSQL(Cheques, 5, ' and CP.I_COD_CLI = ' +  EditLocaliza4.Text )
  else
    InseriLinhaSQL(Cheques, 5, ' ');
  InseriLinhaSQL(Cheques, 6, ' and CP.I_EMP_FIL = MCP.I_EMP_FIL ' +
                             ' and CP.I_LAN_REC = MCP.I_LAN_REC ' +
                             ' and CP.I_COD_CLI = C.I_COD_CLI '  +
                             ' and MCP.I_COD_FRM = F.I_COD_FRM ' +
                             ' and MCP.I_COD_BAN *= B.I_COD_BAN ' +
                             ' and MCP.I_LAN_REC = FRM.I_LAN_REC ' +
                             ' AND MCP.I_EMP_FIL = FRM.I_EMP_FIL ' );
  Cheques.open;

  soma.close;
  soma.sql.clear;
  soma.sql := Cheques.sql;
  soma.sql.Delete(1);
  soma.sql.Insert(1, ' sum(mcp.n_vlr_par) total');
  soma.open;
  numerico1.AValor := soma.FieldByName('total').AsCurrency;
end;

procedure TFConsultaVendaPeriodo.FormaPagtoRetorno(Retorno1, Retorno2: String);
begin
  AbreConsulta;
end;

procedure TFConsultaVendaPeriodo.dataParcela2CloseUp(Sender: TObject);
begin
  AbreConsulta;
end;

procedure TFConsultaVendaPeriodo.GradeExit(Sender: TObject);
begin
  if (MovCheques.State = dsEdit) then
    MovCheques.Post;
end;

procedure TFConsultaVendaPeriodo.MovChequesAfterInsert(DataSet: TDataSet);
begin
  Abort;
end;

{************************* Abre o movimento de cheques *********************** }
procedure TFConsultaVendaPeriodo.AbreMovCheques(Lancamento, Parcela: Integer);
begin
  AdicionaSQLAbreTabela(MovCheques,
    ' select * from movchequeterceiro ' +
    ' where i_lan_rec = ' + IntTostr(Lancamento) +
    ' and i_fil_rec = ' + IntTostr(Varia.CodigoEmpFil ) +
    ' and i_par_rec = ' + IntTostr(Parcela));
end;

procedure TFConsultaVendaPeriodo.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FConsultaVendaPeriodo.HelpContext);
end;

procedure TFConsultaVendaPeriodo.BCancelaVendaClick(Sender: TObject);
begin
  NF.CancelaNotaFiscal( ChequesI_SEQ_NOT.AsInteger);
  AtualizaSQLTabela(Cheques);
end;

Initialization
  RegisterClasses([TFConsultaVendaPeriodo]);
end.
