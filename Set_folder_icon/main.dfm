object MainForm: TMainForm
  Left = 267
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1080#1082#1086#1085#1082#1080' '#1085#1072' '#1087#1072#1087#1082#1091
  ClientHeight = 185
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object lbl_file: TLabel
    Left = 8
    Top = 16
    Width = 181
    Height = 17
    Caption = #1060#1072#1081#1083', '#1080#1089#1090#1086#1095#1085#1080#1082' '#1080#1082#1086#1085#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lbl_folder: TLabel
    Left = 8
    Top = 72
    Width = 359
    Height = 17
    Caption = #1050#1072#1090#1072#1083#1086#1075', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1090#1089#1103' '#1080#1082#1086#1085#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object bt_open_file: TSpeedButton
    Left = 440
    Top = 40
    Width = 25
    Height = 25
    Caption = '...'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = bt_open_fileClick
  end
  object bt_open_folder: TSpeedButton
    Left = 440
    Top = 96
    Width = 25
    Height = 26
    Caption = '...'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = bt_open_folderClick
  end
  object bt_close: TSpeedButton
    Left = 366
    Top = 151
    Width = 98
    Height = 26
    Caption = #1042#1099#1093#1086#1076
    Flat = True
    OnClick = bt_closeClick
  end
  object bt_set_icon: TSpeedButton
    Left = 257
    Top = 151
    Width = 99
    Height = 26
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    Flat = True
    OnClick = bt_set_iconClick
  end
  object Bevel1: TBevel
    Left = 8
    Top = 136
    Width = 457
    Height = 9
    Shape = bsTopLine
  end
  object ed_file: TEdit
    Left = 8
    Top = 39
    Width = 425
    Height = 26
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object ed_folder: TEdit
    Left = 8
    Top = 96
    Width = 425
    Height = 25
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object XPManifest: TXPManifest
    Left = 224
    Top = 16
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'EXE '#1092#1072#1081#1083#1099' (*.exe)|*.exe|'#1060#1072#1081#1083#1099' '#1080#1082#1086#1085#1086#1082' (*.ico)|*.ico'
    Left = 256
    Top = 24
  end
end
