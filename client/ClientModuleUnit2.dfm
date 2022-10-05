object ClientModule2: TClientModule2
  OldCreateOrder = False
  Height = 369
  Width = 624
  object DSRestCnn: TDSRestConnection
    Port = 8080
    LoginPrompt = False
    Left = 56
    Top = 24
    UniqueId = '{28F9CEF3-146B-47A4-AA5B-2836DB3C80CA}'
  end
  object tbPessoa: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 80
    object tbPessoaidpessoa: TLargeintField
      DisplayLabel = 'ID Pessoa'
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPessoadsdocumento: TWideStringField
      DisplayLabel = 'Documento'
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object tbPessoanmprimeiro: TWideStringField
      DisplayLabel = 'Primeiro Nome'
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object tbPessoanmsegundo: TWideStringField
      DisplayLabel = 'Segundo Nome'
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
    object tbPessoadtregistro: TDateField
      DisplayLabel = 'Dt. Registro'
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
      DisplayFormat = '##/##/####'
    end
    object tbPessoaflnatureza: TIntegerField
      DisplayLabel = 'Natureza'
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
  end
  object tbEndereco: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    IndexFieldNames = 'idpessoa;idendereco'
    MasterSource = dsPessoa
    MasterFields = 'idpessoa'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 136
    object tbEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object tbEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbEnderecodscep: TWideStringField
      DisplayLabel = 'CEP'
      DisplayWidth = 15
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 152
    Top = 24
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 280
    Top = 24
  end
  object dsPessoa: TDataSource
    DataSet = tbPessoa
    OnDataChange = dsPessoaDataChange
    Left = 152
    Top = 80
  end
  object tbEnderecoIntegracao: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    IndexFieldNames = 'idendereco'
    MasterSource = dsPessoa
    MasterFields = 'idpessoa'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 192
    object tbEnderecoIntegracaoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbEnderecoIntegracaodsuf: TWideStringField
      DisplayLabel = 'UF'
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object tbEnderecoIntegracaonmcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object tbEnderecoIntegracaonmbairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object tbEnderecoIntegracaonmlogradouro: TWideStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object tbEnderecoIntegracaodscomplemento: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object dsEnderecoIntegracao: TDataSource
    DataSet = tbEnderecoIntegracao
    Left = 152
    Top = 192
  end
  object dsEndereco: TDataSource
    DataSet = tbEndereco
    OnDataChange = dsEnderecoDataChange
    Left = 152
    Top = 136
  end
end
