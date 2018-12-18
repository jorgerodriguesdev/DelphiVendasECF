unit ACadItemPedido;
{          Autor: Jorge Eduardo Rodigues
    Data Criação: 13/09/2001;
          Função: Cadastrar Itens dos Pedidos 
  Data Alteração: 13/09/2001;
    Alterado por:
Motivo alteração:
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Mask, DBCtrls, Tabela, Db, DBTables, Grids, DBGrids,
  BotaoCadastro, Buttons, Componentes1, ExtCtrls, PainelGradiente,
  DBKeyViolation, Localizacao;

type
  TFCadItemPedido = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoAlterar1: TBotaoAlterar;
    BotaoExcluir1: TBotaoExcluir;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    MoveBasico1: TMoveBasico;
    PanelColor1: TPanelColor;
    DBGridColor1: TGridIndice;
    DataItemPedido: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    BFechar: TBitBtn;
    Bevel1: TBevel;
    Label3: TLabel;
    Consulta: TLocalizaEdit;
    CadItensPedidos: TSQL;
    ValidaGravacao1: TValidaGravacao;
    BBAjuda: TBitBtn;
    DBFilialColor1: TDBFilialColor;
    CadItensPedidosI_COD_ITE: TIntegerField;
    CadItensPedidosD_ULT_ALT: TDateField;
    CadItensPedidosL_DES_ITE: TMemoField;
    DBMemoColor1: TDBMemoColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadItensPedidosAfterInsert(DataSet: TDataSet);
    procedure CadItensPedidosBeforePost(DataSet: TDataSet);
    procedure BFecharClick(Sender: TObject);
    procedure CadItensPedidosAfterPost(DataSet: TDataSet);
    procedure CadItensPedidosAfterEdit(DataSet: TDataSet);
    procedure CadItensPedidosAfterCancel(DataSet: TDataSet);
    procedure DBGridColor1Ordem(Ordem: String);
    procedure DBKeyViolation1Change(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
  private
    procedure ConfiguraConsulta( acao : Boolean);
  public
    { Public declarations }
  end;

var
  FCadItemPedido: TFCadItemPedido;

implementation

uses APrincipal,constantes;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }

procedure TFCadItemPedido.FormCreate(Sender: TObject);
begin
  CadItensPedidos.open;
  Self.HelpFile := Varia.PathHelp + 'Mageral.hlp>janela';  // Indica o Paph e o nome do arquivo de Help
  DBFilialColor1.ACodFilial := Varia.CodigoFilCadastro;
end;

{ ******************* Quando o formulario e fechado ************************** }

procedure TFCadItemPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CadItensPedidos.close;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações da Tabela
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{*********************Gera o próximo código livre******************************}

procedure TFCadItemPedido.CadItensPedidosAfterInsert(DataSet: TDataSet);
begin
  DBFilialColor1.ProximoCodigo;
  DBFilialColor1.ReadOnly := false;
  ConfiguraConsulta(false);
end;

{**********Verifica se o codigo já foi utilizado por outro usuario na rede*****}

procedure TFCadItemPedido.CadItensPedidosBeforePost(DataSet: TDataSet);
begin
  CadItensPedidosD_ULT_ALT.AsDateTime := Date;
    if CadItensPedidos.State = dsinsert then
      DBFilialColor1.VerificaCodigoRede;
end;

{***************************Atualiza a tabela**********************************}

procedure TFCadItemPedido.CadItensPedidosAfterPost(DataSet: TDataSet);
begin
  Consulta.AtualizaTabela;
  ConfiguraConsulta(true);
end;

{*********************Coloca o campo chave em read-only************************}
procedure TFCadItemPedido.CadItensPedidosAfterEdit(DataSet: TDataSet);
begin
  DBFilialColor1.ReadOnly := true;
  ConfiguraConsulta(false);
end;

{ ********************* quando cancela a operacao *************************** }
procedure TFCadItemPedido.CadItensPedidosAfterCancel(DataSet: TDataSet);
begin
  ConfiguraConsulta(true);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****** configura a consulta, caso edit ou insert enabled = false *********** }
procedure TFCadItemPedido.ConfiguraConsulta( acao : Boolean);
begin
  Consulta.Enabled := acao;
  DBGridColor1.Enabled := acao;
  Label3.Enabled := acao;
end;

{**************************Fecha o formulario corrente*************************}
procedure TFCadItemPedido.BFecharClick(Sender: TObject);
begin
  close;
end;

{********** adiciona order by na tabela ************************************ }
procedure TFCadItemPedido.DBGridColor1Ordem(Ordem: String);
begin
  Consulta.AOrdem := Ordem;
end;

{******************** VALIDA GRAVAÇÃO **************************************}
procedure TFCadItemPedido.DBKeyViolation1Change(Sender: TObject);
begin
  if CadItensPedidos.State in [ dsEdit, dsInsert ] then
    ValidaGravacao1.execute;
end;

{*********************** PATCH DO ARQUIVO DE HELP ***************************}
procedure TFCadItemPedido.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FCadItemPedido.HelpContext);
end;

Initialization
  RegisterClasses([TFCadItemPedido]);
end.
