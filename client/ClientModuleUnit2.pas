unit ClientModuleUnit2;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit2, Datasnap.DSClientRest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  FireDAC.Stan.StorageJSON;

type
  TClientModule2 = class(TDataModule)
    DSRestCnn: TDSRestConnection;
    tbPessoa: TFDMemTable;
    tbEndereco: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    dsPessoa: TDataSource;
    tbPessoaidpessoa: TLargeintField;
    tbPessoadsdocumento: TWideStringField;
    tbPessoanmprimeiro: TWideStringField;
    tbPessoanmsegundo: TWideStringField;
    tbPessoadtregistro: TDateField;
    tbPessoaflnatureza: TIntegerField;
    tbEnderecoidendereco: TLargeintField;
    tbEnderecoidpessoa: TLargeintField;
    tbEnderecodscep: TWideStringField;
    tbEnderecoIntegracao: TFDMemTable;
    tbEnderecoIntegracaoidendereco: TLargeintField;
    tbEnderecoIntegracaodsuf: TWideStringField;
    tbEnderecoIntegracaonmcidade: TWideStringField;
    tbEnderecoIntegracaonmbairro: TWideStringField;
    tbEnderecoIntegracaonmlogradouro: TWideStringField;
    tbEnderecoIntegracaodscomplemento: TWideStringField;
    dsEnderecoIntegracao: TDataSource;
    dsEndereco: TDataSource;
    procedure dsEnderecoDataChange(Sender: TObject; Field: TField);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    function GetServerMethods1Client: TServerMethods1Client;
    { Private declarations }
  public
    procedure CarregarPessoas(const idpessoa: string);
    procedure CarregarEnderecos(idpessoa: String);
    procedure CarregarEnderecosIntegracao(idendereco: String);

    procedure CarregarPessoasEEnderecos(idpessoa, idendereco: String);
    procedure GravarPessoasEEnderecos;
    procedure GravarPessoasEEnderecosManual;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;
  end;

var
  ClientModule2: TClientModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses Data.FireDACJSONReflect;

constructor TClientModule2.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule2.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

procedure TClientModule2.dsEnderecoDataChange(Sender: TObject; Field: TField);
begin
   if tbEndereco.RecordCount > 0 then
      CarregarEnderecosIntegracao(tbEndereco.FieldByName('idendereco').AsString);
end;

procedure TClientModule2.dsPessoaDataChange(Sender: TObject; Field: TField);
begin
   CarregarEnderecos(IntTOStr(tbPessoaidpessoa.AsInteger));
end;

function TClientModule2.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client := TServerMethods1Client.Create(DSRestCnn,
      FInstanceOwner);
  Result := FServerMethods1Client;
end;

procedure TClientModule2.CarregarEnderecosIntegracao(idendereco: String);
var
  LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.getEnderecosIntegracao(idendereco);

  tbEnderecoIntegracao.Close;
  tbEnderecoIntegracao.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  tbEnderecoIntegracao.Open;
end;

procedure TClientModule2.CarregarPessoas(const idpessoa: string);
var
  LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.getPessoas(idpessoa);

  tbPessoa.Close;
  tbPessoa.AppendData(TFDJSONDataSetsReader.GetListValue (LDataSetList, 0));
  tbPessoa.Open;
end;

procedure TClientModule2.CarregarEnderecos(idpessoa: String);
var
  LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.getEnderecos(idpessoa);

  tbEndereco.Close;
  tbEndereco.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  tbEndereco.Open;
end;

procedure TClientModule2.CarregarPessoasEEnderecos(idpessoa, idendereco: String);
var
  LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.getPessoasEEnderecos(idpessoa, idendereco);

  tbPessoa.Close;
  tbPessoa.AppendData(TFDJSONDataSetsReader.GetListValue
    (LDataSetList, 0));
  tbPessoa.Open;

  tbEnderecoIntegracao.Close;
  tbEnderecoIntegracao.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 1));
  tbEnderecoIntegracao.Open;


  tbEndereco.Close;
  tbEndereco.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 2));
  tbEndereco.Open;
end;

procedure TClientModule2.GravarPessoasEEnderecos;
var
  Delta: TFDJSONDeltas;
begin
  if tbPessoa.State in dsEditModes then
    tbPessoa.Post;

  if tbEndereco.State in dsEditModes then
    tbEndereco.Post;

  Delta := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Delta, tbPessoa);
  TFDJSONDeltasWriter.ListAdd(Delta, tbEndereco);

  ServerMethods1Client.applyPessoasEEnderecos(Delta);
end;

procedure TClientModule2.GravarPessoasEEnderecosManual;
var
  Delta: TFDJSONDeltas;
begin
  if tbPessoa.State in dsEditModes then
    tbPessoa.Post;

  if tbEnderecoIntegracao.State in dsEditModes then
    tbEnderecoIntegracao.Post;

  if tbEndereco.State in dsEditModes then
    tbEndereco.Post;

  Delta := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Delta, tbPessoa);
  TFDJSONDeltasWriter.ListAdd(Delta, tbEnderecoIntegracao);
  TFDJSONDeltasWriter.ListAdd(Delta, tbEndereco);

  ServerMethods1Client.applyPessoasEEnderecosManual(Delta);
end;

end.
