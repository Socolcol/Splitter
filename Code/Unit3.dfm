object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'ReShade control pannel'
  ClientHeight = 497
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 859
    Height = 497
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1082#1086#1085#1089#1086#1083#1100
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 851
        Height = 328
        Align = alClient
        TabOrder = 0
      end
      object Memo2: TMemo
        Left = 0
        Top = 328
        Width = 851
        Height = 141
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1096#1077#1081#1076#1077#1088#1099
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 28
      object Button2: TButton
        Left = 712
        Top = 441
        Width = 136
        Height = 25
        Caption = #1087#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = Button2Click
      end
      object CheckListBox1: TCheckListBox
        Left = 3
        Top = 3
        Width = 174
        Height = 463
        ItemHeight = 13
        TabOrder = 1
      end
      object CheckListBox2: TCheckListBox
        Left = 183
        Top = 3
        Width = 174
        Height = 463
        ItemHeight = 13
        TabOrder = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 497
    Align = alClient
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 332
      Top = 135
      Width = 182
      Height = 18
      Caption = 'ReShade '#1085#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 332
      Top = 233
      Width = 182
      Height = 33
      Caption = #1089#1082#1072#1095#1072#1090#1100' ('#1089#1082#1086#1088#1086')'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
