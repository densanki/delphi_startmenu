object Form2: TForm2
  Left = 198
  Top = 178
  AlphaBlend = True
  AlphaBlendValue = 240
  BorderStyle = bsDialog
  Caption = 'Setup'
  ClientHeight = 393
  ClientWidth = 569
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 14
    Width = 153
    Height = 17
    AutoSize = False
    Caption = 'ID :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 352
    Top = 14
    Width = 201
    Height = 17
    AutoSize = False
    Caption = 'Programm Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 192
    Top = 62
    Width = 361
    Height = 17
    AutoSize = False
    Caption = 'Programm Datei'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 192
    Top = 110
    Width = 361
    Height = 17
    AutoSize = False
    Caption = 'Programm Zusatz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 192
    Top = 158
    Width = 361
    Height = 17
    AutoSize = False
    Caption = 'Programm Pfad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 210
    Top = 250
    Width = 211
    Height = 61
    AutoSize = False
    Caption = 'Entwickelt von Gerlando Caldara  http://Tsunanime.dyndns.rog'
    Color = clLime
    ParentColor = False
    WordWrap = True
  end
  object Button1: TButton
    Left = 400
    Top = 350
    Width = 151
    Height = 37
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 210
    Width = 71
    Height = 21
    Caption = 'Speichern'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 90
    Width = 165
    Height = 291
    Color = clGradientInactiveCaption
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    OnClick = ListBox1Click
  end
  object Button3: TButton
    Left = 370
    Top = 210
    Width = 71
    Height = 21
    Caption = 'Reset'
    TabOrder = 3
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 280
    Top = 210
    Width = 71
    Height = 21
    Caption = 'L'#246'schen'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 192
    Top = 30
    Width = 153
    Height = 21
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 352
    Top = 30
    Width = 201
    Height = 21
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 192
    Top = 78
    Width = 361
    Height = 21
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Edit4: TEdit
    Left = 192
    Top = 126
    Width = 361
    Height = 21
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Edit5: TEdit
    Left = 192
    Top = 174
    Width = 361
    Height = 21
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object Button7: TButton
    Left = 190
    Top = 350
    Width = 121
    Height = 31
    Caption = 'Beenden '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button7Click
  end
  object ListBox2: TListBox
    Left = 20
    Top = 10
    Width = 161
    Height = 71
    ItemHeight = 13
    Items.Strings = (
      'Data'
      'Work'
      'Multi'
      'PP'
      'Web')
    TabOrder = 11
    OnClick = ListBox2Click
  end
  object Button5: TButton
    Left = 455
    Top = 210
    Width = 71
    Height = 21
    Caption = 'Search'
    TabOrder = 12
    OnClick = ButtonSearch
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'Ausf'#252'hrbare Dateien|*.exe;*.bat|Anwendung|*.exe|Batch Datei|*.ba' +
      't'
    Left = 520
    Top = 235
  end
end
