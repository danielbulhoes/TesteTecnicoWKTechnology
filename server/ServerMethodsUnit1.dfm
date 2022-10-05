object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 367
  Width = 461
  object cnx: TFDConnection
    Params.Strings = (
      'Password=teste'
      'ConnectionDef=cnx')
    LoginPrompt = False
    BeforeConnect = cnxBeforeConnect
    Left = 49
    Top = 24
  end
  object tbPessoa: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'SELECT * FROM Pessoa ORDER BY nmPrimeiro')
    Left = 49
    Top = 76
    object tbPessoaidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPessoadsdocumento: TWideStringField
      FieldName = 'dsdocumento'
      Origin = 'dsdocumento'
    end
    object tbPessoanmprimeiro: TWideStringField
      FieldName = 'nmprimeiro'
      Origin = 'nmprimeiro'
      Size = 100
    end
    object tbPessoanmsegundo: TWideStringField
      FieldName = 'nmsegundo'
      Origin = 'nmsegundo'
      Size = 100
    end
    object tbPessoadtregistro: TDateField
      FieldName = 'dtregistro'
      Origin = 'dtregistro'
    end
    object tbPessoaflnatureza: TIntegerField
      FieldName = 'flnatureza'
      Origin = 'flnatureza'
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 160
    Top = 24
  end
  object tbEnderecoIntegracao: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'SELECT * FROM endereco_integracao ')
    Left = 48
    Top = 128
    object tbEnderecoIntegracaoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbEnderecoIntegracaodsuf: TWideStringField
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object tbEnderecoIntegracaonmcidade: TWideStringField
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object tbEnderecoIntegracaonmbairro: TWideStringField
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object tbEnderecoIntegracaonmlogradouro: TWideStringField
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object tbEnderecoIntegracaodscomplemento: TWideStringField
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 264
    Top = 72
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 256
    Top = 128
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'D:\Projetos\WKTechnology\Teste T'#233'cnico'
    Left = 264
    Top = 24
  end
  object tbEndereco: TFDQuery
    Connection = cnx
    SQL.Strings = (
      'SELECT * FROM endereco order by idpessoa, idendereco')
    Left = 48
    Top = 184
    object tbEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object tbEnderecodscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
end
