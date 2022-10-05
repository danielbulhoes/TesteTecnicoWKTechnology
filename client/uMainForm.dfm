object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DataSnap FireDAC'
  ClientHeight = 634
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 986
    Height = 40
    DataSource = ClientModule2.dsPessoa
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 744
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 986
    Height = 180
    Align = alClient
    DataSource = ClientModule2.dsPessoa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idpessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsdocumento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmprimeiro'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmsegundo'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtregistro'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flnatureza'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 594
    Width = 986
    Height = 40
    Align = alBottom
    TabOrder = 2
    ExplicitLeft = -24
    ExplicitTop = 612
    ExplicitWidth = 937
    object Button1: TButton
      AlignWithMargins = True
      Left = 216
      Top = 6
      Width = 121
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Abrir conex'#227'o'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 505
      Top = 6
      Width = 85
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button3Click
      ExplicitLeft = 659
      ExplicitTop = 8
    end
    object edtHostName: TEdit
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 200
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = '127.0.0.1'
      TextHint = 'Hostname or IP Address'
      ExplicitHeight = 21
    end
    object Button4: TButton
      AlignWithMargins = True
      Left = 347
      Top = 6
      Width = 148
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Gravar no Servidor'
      TabOrder = 3
      OnClick = Button4Click
      ExplicitLeft = 501
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 220
    Width = 986
    Height = 196
    Align = alBottom
    DataSource = ClientModule2.dsEnderecoIntegracao
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idendereco'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dsuf'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmcidade'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmbairro'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmlogradouro'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dscomplemento'
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 416
    Width = 986
    Height = 178
    Align = alBottom
    DataSource = ClientModule2.dsEndereco
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idendereco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idpessoa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dscep'
        Width = 112
        Visible = True
      end>
  end
end
