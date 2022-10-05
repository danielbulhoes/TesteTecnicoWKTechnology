//
// Created by the DataSnap proxy generator.
// 05/10/2022 11:10:03
//

unit ClientClassesUnit2;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FcnxBeforeConnectCommand: TDSRestCommand;
    FDataModuleCreateCommand: TDSRestCommand;
    FgetPessoasCommand: TDSRestCommand;
    FgetPessoasCommand_Cache: TDSRestCommand;
    FgetEnderecosCommand: TDSRestCommand;
    FgetEnderecosCommand_Cache: TDSRestCommand;
    FgetEnderecosIntegracaoCommand: TDSRestCommand;
    FgetEnderecosIntegracaoCommand_Cache: TDSRestCommand;
    FgetPessoasEEnderecosCommand: TDSRestCommand;
    FgetPessoasEEnderecosCommand_Cache: TDSRestCommand;
    FapplyPessoasEEnderecosCommand: TDSRestCommand;
    FapplyPessoasEEnderecosManualCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure cnxBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    function getPessoas(idpessoa: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getPessoas_Cache(idpessoa: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function getEnderecos(idpessoa: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getEnderecos_Cache(idpessoa: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function getEnderecosIntegracao(idendereco: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getEnderecosIntegracao_Cache(idendereco: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function getPessoasEEnderecos(idpessoa: string; idendereco: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function getPessoasEEnderecos_Cache(idpessoa: string; idendereco: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure applyPessoasEEnderecos(ADeltaList: TFDJSONDeltas);
    procedure applyPessoasEEnderecosManual(ADeltaList: TFDJSONDeltas);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_cnxBeforeConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_getPessoas: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_getPessoas_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_getEnderecos: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_getEnderecos_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_getEnderecosIntegracao: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idendereco'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_getEnderecosIntegracao_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'idendereco'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_getPessoasEEnderecos: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'idendereco'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_getPessoasEEnderecos_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'idpessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'idendereco'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_applyPessoasEEnderecos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TServerMethods1_applyPessoasEEnderecosManual: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

implementation

procedure TServerMethods1Client.cnxBeforeConnect(Sender: TObject);
begin
  if FcnxBeforeConnectCommand = nil then
  begin
    FcnxBeforeConnectCommand := FConnection.CreateCommand;
    FcnxBeforeConnectCommand.RequestType := 'POST';
    FcnxBeforeConnectCommand.Text := 'TServerMethods1."cnxBeforeConnect"';
    FcnxBeforeConnectCommand.Prepare(TServerMethods1_cnxBeforeConnect);
  end;
  if not Assigned(Sender) then
    FcnxBeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FcnxBeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FcnxBeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FcnxBeforeConnectCommand.Execute;
end;

procedure TServerMethods1Client.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServerMethods1."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServerMethods1_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

function TServerMethods1Client.getPessoas(idpessoa: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetPessoasCommand = nil then
  begin
    FgetPessoasCommand := FConnection.CreateCommand;
    FgetPessoasCommand.RequestType := 'GET';
    FgetPessoasCommand.Text := 'TServerMethods1.getPessoas';
    FgetPessoasCommand.Prepare(TServerMethods1_getPessoas);
  end;
  FgetPessoasCommand.Parameters[0].Value.SetWideString(idpessoa);
  FgetPessoasCommand.Execute(ARequestFilter);
  if not FgetPessoasCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetPessoasCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetPessoasCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetPessoasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getPessoas_Cache(idpessoa: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetPessoasCommand_Cache = nil then
  begin
    FgetPessoasCommand_Cache := FConnection.CreateCommand;
    FgetPessoasCommand_Cache.RequestType := 'GET';
    FgetPessoasCommand_Cache.Text := 'TServerMethods1.getPessoas';
    FgetPessoasCommand_Cache.Prepare(TServerMethods1_getPessoas_Cache);
  end;
  FgetPessoasCommand_Cache.Parameters[0].Value.SetWideString(idpessoa);
  FgetPessoasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetPessoasCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.getEnderecos(idpessoa: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetEnderecosCommand = nil then
  begin
    FgetEnderecosCommand := FConnection.CreateCommand;
    FgetEnderecosCommand.RequestType := 'GET';
    FgetEnderecosCommand.Text := 'TServerMethods1.getEnderecos';
    FgetEnderecosCommand.Prepare(TServerMethods1_getEnderecos);
  end;
  FgetEnderecosCommand.Parameters[0].Value.SetWideString(idpessoa);
  FgetEnderecosCommand.Execute(ARequestFilter);
  if not FgetEnderecosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetEnderecosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetEnderecosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetEnderecosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getEnderecos_Cache(idpessoa: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetEnderecosCommand_Cache = nil then
  begin
    FgetEnderecosCommand_Cache := FConnection.CreateCommand;
    FgetEnderecosCommand_Cache.RequestType := 'GET';
    FgetEnderecosCommand_Cache.Text := 'TServerMethods1.getEnderecos';
    FgetEnderecosCommand_Cache.Prepare(TServerMethods1_getEnderecos_Cache);
  end;
  FgetEnderecosCommand_Cache.Parameters[0].Value.SetWideString(idpessoa);
  FgetEnderecosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetEnderecosCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.getEnderecosIntegracao(idendereco: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetEnderecosIntegracaoCommand = nil then
  begin
    FgetEnderecosIntegracaoCommand := FConnection.CreateCommand;
    FgetEnderecosIntegracaoCommand.RequestType := 'GET';
    FgetEnderecosIntegracaoCommand.Text := 'TServerMethods1.getEnderecosIntegracao';
    FgetEnderecosIntegracaoCommand.Prepare(TServerMethods1_getEnderecosIntegracao);
  end;
  FgetEnderecosIntegracaoCommand.Parameters[0].Value.SetWideString(idendereco);
  FgetEnderecosIntegracaoCommand.Execute(ARequestFilter);
  if not FgetEnderecosIntegracaoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetEnderecosIntegracaoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetEnderecosIntegracaoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetEnderecosIntegracaoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getEnderecosIntegracao_Cache(idendereco: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetEnderecosIntegracaoCommand_Cache = nil then
  begin
    FgetEnderecosIntegracaoCommand_Cache := FConnection.CreateCommand;
    FgetEnderecosIntegracaoCommand_Cache.RequestType := 'GET';
    FgetEnderecosIntegracaoCommand_Cache.Text := 'TServerMethods1.getEnderecosIntegracao';
    FgetEnderecosIntegracaoCommand_Cache.Prepare(TServerMethods1_getEnderecosIntegracao_Cache);
  end;
  FgetEnderecosIntegracaoCommand_Cache.Parameters[0].Value.SetWideString(idendereco);
  FgetEnderecosIntegracaoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetEnderecosIntegracaoCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.getPessoasEEnderecos(idpessoa: string; idendereco: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FgetPessoasEEnderecosCommand = nil then
  begin
    FgetPessoasEEnderecosCommand := FConnection.CreateCommand;
    FgetPessoasEEnderecosCommand.RequestType := 'GET';
    FgetPessoasEEnderecosCommand.Text := 'TServerMethods1.getPessoasEEnderecos';
    FgetPessoasEEnderecosCommand.Prepare(TServerMethods1_getPessoasEEnderecos);
  end;
  FgetPessoasEEnderecosCommand.Parameters[0].Value.SetWideString(idpessoa);
  FgetPessoasEEnderecosCommand.Parameters[1].Value.SetWideString(idendereco);
  FgetPessoasEEnderecosCommand.Execute(ARequestFilter);
  if not FgetPessoasEEnderecosCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FgetPessoasEEnderecosCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FgetPessoasEEnderecosCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FgetPessoasEEnderecosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.getPessoasEEnderecos_Cache(idpessoa: string; idendereco: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FgetPessoasEEnderecosCommand_Cache = nil then
  begin
    FgetPessoasEEnderecosCommand_Cache := FConnection.CreateCommand;
    FgetPessoasEEnderecosCommand_Cache.RequestType := 'GET';
    FgetPessoasEEnderecosCommand_Cache.Text := 'TServerMethods1.getPessoasEEnderecos';
    FgetPessoasEEnderecosCommand_Cache.Prepare(TServerMethods1_getPessoasEEnderecos_Cache);
  end;
  FgetPessoasEEnderecosCommand_Cache.Parameters[0].Value.SetWideString(idpessoa);
  FgetPessoasEEnderecosCommand_Cache.Parameters[1].Value.SetWideString(idendereco);
  FgetPessoasEEnderecosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FgetPessoasEEnderecosCommand_Cache.Parameters[2].Value.GetString);
end;

procedure TServerMethods1Client.applyPessoasEEnderecos(ADeltaList: TFDJSONDeltas);
begin
  if FapplyPessoasEEnderecosCommand = nil then
  begin
    FapplyPessoasEEnderecosCommand := FConnection.CreateCommand;
    FapplyPessoasEEnderecosCommand.RequestType := 'POST';
    FapplyPessoasEEnderecosCommand.Text := 'TServerMethods1."applyPessoasEEnderecos"';
    FapplyPessoasEEnderecosCommand.Prepare(TServerMethods1_applyPessoasEEnderecos);
  end;
  if not Assigned(ADeltaList) then
    FapplyPessoasEEnderecosCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FapplyPessoasEEnderecosCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FapplyPessoasEEnderecosCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FapplyPessoasEEnderecosCommand.Execute;
end;

procedure TServerMethods1Client.applyPessoasEEnderecosManual(ADeltaList: TFDJSONDeltas);
begin
  if FapplyPessoasEEnderecosManualCommand = nil then
  begin
    FapplyPessoasEEnderecosManualCommand := FConnection.CreateCommand;
    FapplyPessoasEEnderecosManualCommand.RequestType := 'POST';
    FapplyPessoasEEnderecosManualCommand.Text := 'TServerMethods1."applyPessoasEEnderecosManual"';
    FapplyPessoasEEnderecosManualCommand.Prepare(TServerMethods1_applyPessoasEEnderecosManual);
  end;
  if not Assigned(ADeltaList) then
    FapplyPessoasEEnderecosManualCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FapplyPessoasEEnderecosManualCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FapplyPessoasEEnderecosManualCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FapplyPessoasEEnderecosManualCommand.Execute;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FcnxBeforeConnectCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FgetPessoasCommand.DisposeOf;
  FgetPessoasCommand_Cache.DisposeOf;
  FgetEnderecosCommand.DisposeOf;
  FgetEnderecosCommand_Cache.DisposeOf;
  FgetEnderecosIntegracaoCommand.DisposeOf;
  FgetEnderecosIntegracaoCommand_Cache.DisposeOf;
  FgetPessoasEEnderecosCommand.DisposeOf;
  FgetPessoasEEnderecosCommand_Cache.DisposeOf;
  FapplyPessoasEEnderecosCommand.DisposeOf;
  FapplyPessoasEEnderecosManualCommand.DisposeOf;
  inherited;
end;

end.

