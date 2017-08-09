object Form1: TForm1
  Left = 215
  Top = 113
  AlphaBlend = True
  AlphaBlendValue = 150
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 60
  ClientWidth = 485
  Color = clWhite
  TransparentColorValue = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 220
    Top = 0
    Width = 171
    Height = 25
    AutoSize = False
    Caption = 'Label1'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = Label1Click
  end
  object Button1: TButton
    Left = 10
    Top = 0
    Width = 41
    Height = 25
    Caption = 'Setup'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 60
    Top = 0
    Width = 31
    Height = 25
    Caption = 'Data'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 90
    Top = 0
    Width = 31
    Height = 25
    Caption = 'Work'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 120
    Top = 0
    Width = 31
    Height = 25
    Caption = 'Multi'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 150
    Top = 0
    Width = 31
    Height = 25
    Caption = 'PP'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 180
    Top = 0
    Width = 31
    Height = 25
    Caption = 'Web'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 370
    Top = 30
  end
  object PopupMenu1: TPopupMenu
    Left = 60
    Top = 30
  end
  object PopupMenu2: TPopupMenu
    Left = 90
    Top = 30
  end
  object PopupMenu3: TPopupMenu
    Left = 120
    Top = 30
  end
  object PopupMenu4: TPopupMenu
    Left = 150
    Top = 30
  end
  object PopupMenu5: TPopupMenu
    Left = 180
    Top = 30
  end
end
