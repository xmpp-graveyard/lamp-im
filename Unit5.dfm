object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'XML consol'
  ClientHeight = 352
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 262
    Width = 422
    Height = 90
    Align = alBottom
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    ExplicitTop = 261
    object sLabel1: TsLabel
      Left = 17
      Top = 9
      Width = 23
      Height = 13
      Caption = 'XML:'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2171169
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object Label1: TLabel
      Left = 49
      Top = 65
      Width = 211
      Height = 13
      Caption = #1040#1074#1090#1086'-'#1086#1095#1080#1089#1090#1082#1072' '#1087#1086#1089#1083#1077':                      '#1079#1085#1072#1082#1086#1074'.'
    end
    object sSpeedButton1: TsSpeedButton
      Left = 259
      Top = 62
      Width = 75
      Height = 22
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sButton1: TsButton
      Left = 340
      Top = 4
      Width = 75
      Height = 79
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
    object Memo1: TMemo
      Left = 46
      Top = 6
      Width = 288
      Height = 53
      TabOrder = 1
    end
    object SpinEdit1: TSpinEdit
      Left = 160
      Top = 62
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 5000
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 422
    Height = 262
    Align = alClient
    Caption = 'XML consol'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    ExplicitHeight = 272
    object sRichEdit1: TsRichEdit
      Left = 2
      Top = 15
      Width = 418
      Height = 245
      Align = alClient
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnChange = sRichEdit1Change
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      ExplicitHeight = 255
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 184
    Top = 56
  end
end
