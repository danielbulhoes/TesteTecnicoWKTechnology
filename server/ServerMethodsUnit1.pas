unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  Data.FireDACJSONReflect, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    cnx: TFDConnection;
    tbPessoa: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tbEnderecoIntegracao: TFDQuery;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    tbEndereco: TFDQuery;
    tbPessoaidpessoa: TLargeintField;
    tbPessoadsdocumento: TWideStringField;
    tbPessoanmprimeiro: TWideStringField;
    tbPessoanmsegundo: TWideStringField;
    tbPessoadtregistro: TDateField;
    tbPessoaflnatureza: TIntegerField;
    tbEnderecoIntegracaoidendereco: TLargeintField;
    tbEnderecoIntegracaodsuf: TWideStringField;
    tbEnderecoIntegracaonmcidade: TWideStringField;
    tbEnderecoIntegracaonmbairro: TWideStringField;
    tbEnderecoIntegracaonmlogradouro: TWideStringField;
    tbEnderecoIntegracaodscomplemento: TWideStringField;
    tbEnderecoidendereco: TLargeintField;
    tbEnderecoidpessoa: TLargeintField;
    tbEnderecodscep: TWideStringField;
    procedure cnxBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CarregarPessoas(const idpessoa: string = '');
    procedure CarregarEnderecos(idpessoa: string);
    procedure CarregarEnderecosIntegracao(idendereco: string);
  public
    function getPessoas(const idpessoa: string): TFDJSONDataSets;
    function getEnderecos(idpessoa: string): TFDJSONDataSets;
    function getEnderecosIntegracao(idendereco: string): TFDJSONDataSets;

    function getPessoasEEnderecos(idpessoa, idendereco: string): TFDJSONDataSets;

    procedure applyPessoasEEnderecos(const ADeltaList: TFDJSONDeltas);
    procedure applyPessoasEEnderecosManual(const ADeltaList: TFDJSONDeltas);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils, System.IOUtils;

procedure TServerMethods1.cnxBeforeConnect(Sender: TObject);
begin
{$IFDEF LINUX}
  cnx.Params.Database := TPath.GetHomePath + PathDelim +
    'employee.gdb';
{$ENDIF}
end;

procedure TServerMethods1.DataModuleCreate(Sender: TObject);
begin
   FDPhysPgDriverLink1.VendorHome := '.\';
end;

procedure TServerMethods1.CarregarPessoas(const idpessoa: string = '');
var
  S: string;
begin
   S := 'select ';
   S := S + '  * ';
   S := S + 'from ';
   S := S + '  pessoa ';
   S := S + 'where ';
   S := S + '   idpessoa is not null ';
   if not idpessoa.IsEmpty then
      S := S + '  and idpessoa = ' + idpessoa + ' ';
   S := S + 'order by nmprimeiro ';

   tbPessoa.Active := False;
   tbPessoa.SQL.Text := S;
end;

procedure TServerMethods1.CarregarEnderecos(idpessoa: string);
var
  S: string;
begin
   S := 'select ';
   S := S + '	* ';
   S := S + 'from ';
   S := S + '  endereco ';
   S := S + 'where ';
   S := S + '	idpessoa = ' + idpessoa + ' ';

   tbEndereco.Active := False;
   tbEndereco.SQL.Text := S;
end;

procedure TServerMethods1.CarregarEnderecosIntegracao(idendereco: string);
var
  S: string;
begin
   S := 'select ';
   S := S + '	* ';
   S := S + 'from ';
   S := S + '  endereco_integracao ';
   S := S + 'where ';
   S := S + '  idendereco = ' + idendereco + ' ';

   tbEnderecoIntegracao.Active := False;
   tbEnderecoIntegracao.SQL.Text := S;
end;

function TServerMethods1.getPessoas(const idpessoa: string): TFDJSONDataSets;
begin
  CarregarPessoas(idpessoa);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, tbPessoa);
end;

function TServerMethods1.getEnderecos(idpessoa: string): TFDJSONDataSets;
begin
  CarregarEnderecos(idpessoa);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, tbEndereco);
end;

function TServerMethods1.getEnderecosIntegracao(idendereco: string): TFDJSONDataSets;
begin
  CarregarEnderecosIntegracao(idendereco);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, tbEnderecoIntegracao);
end;

function TServerMethods1.getPessoasEEnderecos(idpessoa, idendereco: string): TFDJSONDataSets;
begin
  CarregarPessoas(idpessoa);
  CarregarEnderecos(idpessoa);
  CarregarEnderecosIntegracao(idendereco);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, tbPessoa);
  TFDJSONDataSetsWriter.ListAdd(Result, tbEnderecoIntegracao);
  TFDJSONDataSetsWriter.ListAdd(Result, tbEndereco);
end;

procedure TServerMethods1.applyPessoasEEnderecos(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

  cnx.StartTransaction;
  try
    LApply.ApplyUpdates(0, tbPessoa.Command);
    if LApply.Errors.Count = 0 then
    begin
      LApply.ApplyUpdates(1, tbEnderecoIntegracao.Command);
      if LApply.Errors.Count = 0 then
         LApply.ApplyUpdates(2, tbEndereco.Command)
      else
         if LApply.Errors.Count > 0 then
            raise Exception.Create(LApply.Errors.Strings.Text);
    end
    else
      Exception.Create(LApply.Errors.Strings.Text);
    cnx.Commit;
  except
    on E: Exception do
    begin
      cnx.Rollback;
      raise Exception.Create('Erro encontrado: ' + E.Message);
    end;
  end;
end;

procedure TServerMethods1.applyPessoasEEnderecosManual(const ADeltaList: TFDJSONDeltas);
var
  S: string;
  tabPessoa, tabEnderecoIntegracao, tabEndereco: TFDMemTable;
  LApply: IFDJSONDeltasApplyUpdates;
begin
   LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);

   tabPessoa := LApply.Values[0];
   tabPessoa.FilterChanges := [rtModified, rtInserted, rtDeleted];
   tabPessoa.First;

   tabEnderecoIntegracao := LApply.Values[1];
   tabEnderecoIntegracao.FilterChanges := [rtModified, rtInserted, rtDeleted];
   tabEnderecoIntegracao.First;

   tabEndereco := LApply.Values[2];
   tabEndereco.FilterChanges := [rtModified, rtInserted, rtDeleted];
   tabEndereco.First;

   cnx.StartTransaction;
   try
      while not tabPessoa.Eof do
      begin
         if tabPessoa.UpdateStatus = usModified then
            begin
               S := '';
               S := S + 'update pessoa set ';
               S := S + '  nmprimeiro = ' + QuotedStr(tabpessoa.FieldByname('nmprimeiro').AsString) + ', ';
               S := S + '  nmsegundo = ' + QuotedStr(tabpessoa.FieldByName('nmsegundo').AsString) + ', ';
               S := S + '  flnatureza = ' + IntTOStr(Tabpessoa.FieldbyName('flnatureza').AsInteger) + ', ';
               S := S + '  dsdocumento = ' + QuotedStr(tabpessoa.FieldByName('dsdocumento').AsString) + ' ';
               S := S + 'where ';
               S := S + '  idpessoa = ' + IntToStr(tabPessoa.FieldbyName('idpessoa').ASInteger) + ' ';
            end
         else
            if tabPessoa.UpdateStatus = usInserted then
               begin
                  S := '';
                  S := S + 'insert into pessoa ';
                  S := S + '( ';
                  S := S + '  idpessoa, ';
                  S := S + '  nmprimeiro, ';
                  S := S + '  nmsegundo, ';
                  S := S + '  flnatureza, ';
                  S := S + '  dsdocumento, ';
                  S := S + ') ';
                  S := S + 'values ';
                  S := S + '( ';
                  S := S + IntToStr(tabPessoa.FieldByName('idpessoa').AsInteger) + ', ';
                  S := S + QuotedStr(tabPessoa.FieldbyName('nmprimeiro').AsString) + ', ';
                  S := S + QuotedStr(tabPessoa.FieldbyName('nmsegundo').AsString) + ', ';
                  S := S + IntTOStr(tabPessoa.FieldbyName('flnatueza').AsInteger) + ', ';
                  S := S + QuotedStr(tabPessoa.FieldbyName('dsdocumento').AsString) + ' ';
                  S := S + ') ';
               end
            else
               if tabPessoa.UpdateStatus = usDeleted then
                  S := 'delete pessoa where idpessoa = ' + IntToStr(tabPessoa.FieldByName('idpessoa').AsInteger) + ' ';

         cnx.ExecSQL(S);
         tabPessoa.Next;
      end;

      while not tabEnderecoIntegracao.Eof do
      begin
         if tabEnderecoIntegracao.UpdateStatus = usModified then
            begin
               S := '';
               S := S + 'update endereco_integracao set ';
               S := S + '  dsuf = ' + QuotedStr(tabEnderecoIntegracao.FieldByname('dsuf').AsString) + ', ';
               S := S + '  nmcidade = ' + QuotedStr(tabEnderecoIntegracao.FieldByName('nmcidade').AsString) + ', ';
               S := S + '  nmbairro = ' + QuotedStr(tabEnderecoIntegracao.FieldbyName('nmbairro').AsString) + ', ';
               S := S + '  nmlogradouro = ' + QuotedStr(tabEnderecoIntegracao.FieldByName('nmlogradouro').AsString) + ', ';
               S := S + '  dscomplemento = ' + QuotedStr(tabEnderecoIntegracao.FieldByName('dscomplemento').AsString) + ' ';
               S := S + 'where ';
               S := S + '  idendereco = ' + IntToStr(tabEnderecoIntegracao.FieldbyName('idendereco').ASInteger) + ' ';
            end
         else
            if tabEnderecoIntegracao.UpdateStatus = usInserted then
               begin
                  S := '';
                  S := S + 'insert into endereco_integracao ';
                  S := S + '( ';
                  S := S + '  idendereco, ';
                  S := S + '  dsuf, ';
                  S := S + '  nmcidade, ';
                  S := S + '  nmbairro, ';
                  S := S + '  nmlogradouro, ';
                  S := S + '  dscomplemento ';
                  S := S + ') ';
                  S := S + 'values ';
                  S := S + '( ';
                  S := S + IntToStr(tabEnderecoIntegracao.FieldByName('idendereco').AsInteger) + ', ';
                  S := S + QuotedStr(tabEnderecoIntegracao.FieldbyName('dsuf').AsString) + ', ';
                  S := S + QuotedStr(tabEnderecoIntegracao.FieldbyName('nmcidade').AsString) + ', ';
                  S := S + QuotedStr(tabEnderecoIntegracao.FieldbyName('nmbairro').AsString) + ', ';
                  S := S + QuotedStr(tabEnderecoIntegracao.FieldbyName('nmlogradouro').AsString) + ', ';
                  S := S + QuotedStr(tabEnderecoIntegracao.FieldbyName('dscomplemento').AsString) + ' ';
                  S := S + ') ';
               end
            else
               if tabEnderecoIntegracao.UpdateStatus = usDeleted then
                  S := 'delete endereco_ingegracao where idendereco = ' + IntToStr(tabEnderecoIntegracao.FieldByName('idendereco').AsInteger) + ' ';

         cnx.ExecSQL(S);
         tabEnderecoIntegracao.Next;
      end;

      while not tabEndereco.Eof do
      begin
         if tabEndereco.UpdateStatus = usModified then
            begin
               S := '';
               S := S + 'update endereco set ';
               S := S + '  dscep = ' + QuotedStr(tabEndereco.FieldByname('dscep').AsString) + ' ';
               S := S + 'where ';
               S := S + '  idendereco = ' + IntToStr(tabEndereco.FieldbyName('idendereco').ASInteger) + ' ';
               S := S + '  and idpessoa = ' + IntToStr(tabEndereco.FieldbyName('idpessoa').ASInteger) + ' ';
            end
         else
            if tabEndereco.UpdateStatus = usInserted then
               begin
                  S := '';
                  S := S + 'insert into endereco ';
                  S := S + '( ';
                  S := S + '  idendereco, ';
                  S := S + '  idpessoa, ';
                  S := S + '  dscep ';
                  S := S + ') ';
                  S := S + 'values ';
                  S := S + '( ';
                  S := S + IntToStr(tabEndereco.FieldByName('idendereco').AsInteger) + ', ';
                  S := S + IntToStr(tabEndereco.FieldByName('idpessoa').AsInteger) + ', ';
                  S := S + QuotedStr(tabEndereco.FieldbyName('dscep').AsString) + ' ';
                  S := S + ') ';
               end
            else
               if tabEndereco.UpdateStatus = usDeleted then
               begin
                  S := 'delete ';
                  S := S + '  endereco ';
                  S := S + 'where ';
                  S := S + '  idpessoa = ' + IntToStr(tabEndereco.FieldByName('idpessoa').AsInteger) + ' ';
                  S := S + '  and idendereco = ' + IntToStr(tabEndereco.FieldByName('idendereco').AsInteger) + ' ';
               end;

         cnx.ExecSQL(S);
         tabEndereco.Next;
      end;

      cnx.Commit;
      except on E: Exception do
         begin
            cnx.Rollback;
            raise Exception.Create('Erro encontrado: ' + E.Message);
         end;
      end;
end;

end.
