object Form18: TForm18
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 300
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 309
    Height = 259
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 299
    ExplicitHeight = 249
    object TabSheet1: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object TabSheet2: TTabSheet
      Caption = #1062#1074#1077#1090
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 309
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 40
    ExplicitTop = 224
    ExplicitWidth = 185
    object sButton1: TsButton
      Left = 128
      Top = 6
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object sButton2: TsButton
      Left = 218
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = sButton2Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
