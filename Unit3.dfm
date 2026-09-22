object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1059#1095#1077#1090#1085#1072#1103' '#1079#1072#1087#1080#1089#1100
  ClientHeight = 249
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 280
    Height = 249
    Align = alClient
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1091#1095#1077#1090#1085#1086#1081' '#1079#1072#1087#1080#1089#1080' '
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 22
      Top = 51
      Width = 34
      Height = 13
      Caption = #1051#1086#1075#1080#1085':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 22
      Top = 102
      Width = 41
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100':'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 23
      Height = 13
      Caption = #1053#1080#1082':'
    end
    object sLabel2: TsLabel
      Left = 20
      Top = 75
      Width = 41
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088':'
    end
    object sEdit1: TsEdit
      Left = 69
      Top = 48
      Width = 190
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'lamp-IM'
      TextHint = #1055#1088#1080#1084#1077#1088': user'
      OnChange = sEdit1Change
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit2: TsEdit
      Left = 69
      Top = 99
      Width = 190
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      Text = 'cegthvty'
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
      OnChange = sEdit2Change
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sButton1: TsButton
      Left = 103
      Top = 214
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 5
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 184
      Top = 214
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 6
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
    object Edit1: TEdit
      Left = 69
      Top = 21
      Width = 190
      Height = 21
      TabOrder = 0
      Text = 'Lamp IM'
      TextHint = #1055#1088#1080#1084#1077#1088': Lamp-IM'
      OnChange = Edit1Change
    end
    object sButton3: TsButton
      Left = 22
      Top = 214
      Width = 75
      Height = 25
      Caption = #1053#1086#1074#1072#1103
      TabOrder = 7
      OnClick = sButton3Click
      SkinData.SkinSection = 'BUTTON'
    end
    object sEdit3: TsEdit
      Left = 69
      Top = 72
      Width = 190
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'jabber.ru'
      TextHint = #1055#1088#1080#1084#1077#1088': jabber.ru'
      OnChange = sEdit3Change
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sGroupBox2: TsGroupBox
      Left = 20
      Top = 125
      Width = 239
      Height = 84
      Caption = '      '#1059#1082#1072#1079#1072#1090#1100' '#1076#1088#1091#1075#1086#1081' '#1089#1077#1088#1074#1077#1088'/'#1087#1086#1088#1090':'
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      object sLabel4: TsLabel
        Left = 15
        Top = 27
        Width = 41
        Height = 13
        Caption = #1057#1077#1088#1074#1077#1088':'
      end
      object sLabel5: TsLabel
        Left = 15
        Top = 54
        Width = 29
        Height = 13
        Caption = #1055#1086#1088#1090':'
      end
      object sEdit4: TsEdit
        Left = 72
        Top = 24
        Width = 153
        Height = 21
        TabOrder = 1
        TextHint = #1055#1088#1080#1084#1077#1088': webim.qip.ru'
        OnChange = sEdit4Change
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sEdit5: TsEdit
        Left = 72
        Top = 51
        Width = 153
        Height = 21
        TabOrder = 2
        Text = '5222'
        TextHint = #1055#1088#1080#1084#1077#1088': 5222'
        OnChange = sEdit5Change
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sCheckBox1: TsCheckBox
        Left = 7
        Top = -2
        Width = 20
        Height = 20
        TabOrder = 0
        OnClick = sCheckBox1Click
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 248
    Top = 16
  end
end
