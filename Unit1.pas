unit Unit1;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    PopupMenu5: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PopupData(Sender: TObject);
    procedure PopupWork(Sender: TObject);
    procedure PopupMulti(Sender: TObject);
    procedure PopupPP(Sender: TObject);
    procedure PopupWeb(Sender: TObject);
    procedure POPUPREAD();
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Programm = record
    ID: integer;
    Name: string[20];
    Dateiname: string[255];
    Zusatz: string[255];
    Pfad: string[255];
  end;

var
  Form1: TForm1;
  Blink: boolean;
  Data: array[0..500] of Programm;
  Work: array[0..500] of Programm;
  Multi: array[0..500] of Programm;
  PP: array[0..500] of Programm;
  WEB: array[0..500] of Programm;
  Alarm: integer;

implementation

uses Unit2;

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.POPUPREAD();
var
  Datei: file of Programm;
  Daten: Programm;
  NewItem: TMenuItem;
  index: integer;
begin

  AssignFile(Datei, 'daten.ger');
  Reset(Datei);
  Read(Datei, Daten);

  //While not Daten = EOF DO
  begin

    for index := 0 to 3 do
    begin
      NewItem := TMenuItem.Create(PopupMenu1); // create the new item
      PopupMenu1.Items.Add(NewItem);// add it to the Popupmenu
      NewItem.Caption := 'Menu Item ' + IntToStr(index);
      NewItem.Tag := index;
      NewItem.OnClick := PopupDATA;// assign it an event handler
    end;

  end;
  CloseFile(Datei);

end;

//#########################################################
//################ Fertige Proceduren #####################
//#########################################################

procedure TForm1.PopupDATA(Sender: TObject);
var
  Dateiname: string;
  Zusatz: string;
  Pfad: string;
begin

  with Sender as TMenuItem do
  begin
    Dateiname := Data[Tag].Dateiname;
    Zusatz := Data[Tag].Zusatz;
    Pfad := Data[Tag].Pfad;

    OpenDocument(PChar(Dateiname)); { *Konvertiert von ShellExecute* }
  end;
end;

procedure TForm1.PopupWork(Sender: TObject);
var
  Dateiname: string;
  Zusatz: string;
  Pfad: string;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := Work[Tag].Dateiname;
    Zusatz := Work[Tag].Zusatz;
    Pfad := Work[Tag].Pfad;

    OpenDocument(PChar(Dateiname)); { *Konvertiert von ShellExecute* }
  end;
end;

procedure TForm1.PopupMulti(Sender: TObject);
var
  Dateiname: string;
  Zusatz: string;
  Pfad: string;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := Multi[Tag].Dateiname;
    Zusatz := Multi[Tag].Zusatz;
    Pfad := Multi[Tag].Pfad;

    OpenDocument(PChar(Dateiname)); { *Konvertiert von ShellExecute* }
  end;
end;

procedure TForm1.PopupPP(Sender: TObject);
var
  Dateiname: string;
  Zusatz: string;
  Pfad: string;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := PP[Tag].Dateiname;
    Zusatz := PP[Tag].Zusatz;
    Pfad := PP[Tag].Pfad;

    OpenDocument(PChar(Dateiname)); { *Konvertiert von ShellExecute* }
  end;
end;

procedure TForm1.PopupWEB(Sender: TObject);
var
  Dateiname: string;
  Zusatz: string;
  Pfad: string;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := WEB[Tag].Dateiname;
    Zusatz := WEB[Tag].Zusatz;
    Pfad := WEB[Tag].Pfad;

    OpenDocument(PChar(Dateiname)); { *Konvertiert von ShellExecute* }
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  NewItem: TMenuItem;
  index, i: integer;
  Windowhandle: Hwnd;
begin

  {
  //Ausblendung der Windows Task Leiste
  Windowhandle := FindWindow('Shell_TrayWnd', '');
  If Windowhandle <> 0 Then
    ShowWindow(Windowhandle, SW_HIDE);
  }

  Form1.Left := 200;
  Form1.Top := 0;
  Form1.Height := 25;
  Form1.Width := 400;

  Label1.Caption := TIMEtoSTR(Now) + ' ' + DATEtoSTR(now);

  Form2.einlesen;

  for I := 0 to 500 do
  begin

    if Data[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu1);
      PopupMenu1.Items.Add(NewItem);
      NewItem.Caption := Data[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupDATA;
    end;

    if Work[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu2);
      PopupMenu2.Items.Add(NewItem);
      NewItem.Caption := WORK[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupWORK;
    end;

    if Multi[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu3);
      PopupMenu3.Items.Add(NewItem);
      NewItem.Caption := Multi[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupMulti;
    end;

    if PP[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu4);
      PopupMenu4.Items.Add(NewItem);
      NewItem.Caption := PP[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupPP;
    end;

    if Web[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu5);
      PopupMenu5.Items.Add(NewItem);
      NewItem.Caption := Web[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupWeb;
    end;
  end;

  Alarm := 235959;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Zeit: string;
  ZeitH: string;
  ZeitA: integer;
begin
  Zeit := TIMEtoSTR(NOW);
  Label1.Caption := Zeit + ' ' + DATEtoSTR(now);

  ZeitH := Zeit[1] + Zeit[2] + Zeit[4] + Zeit[5] + Zeit[7] + Zeit[8];
  ZeitA := StrToInt(ZeitH);
  if ZEITA > Alarm then
  begin
    if Blink = True then
    begin
      Form1.color := clwhite;
      Label1.color := clwhite;
      Blink := False;
    end
    else
    begin
      form1.color := clgreen;
      Label1.color := clgreen;
      Blink := True;
    end;

  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  popupmenu1.Popup(Form1.Left + Button2.Left, Button2.Width);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  popupmenu2.Popup(Form1.Left + Button3.Left, Button3.Width);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  popupmenu3.Popup(Form1.Left + Button4.Left, Button4.Width);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  popupmenu4.Popup(Form1.Left + Button5.Left, Button5.Width);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  //close;
  popupmenu5.Popup(Form1.Left + Button6.Left, Button6.Width);
end;

procedure TForm1.Label1Click(Sender: TObject);
var
  sicher: string;
begin
  try
    Sicher := InputBox('Alarm Box', 'Alarm eingeben', 'HHMMSS');
    if SICHER = 'HHMMSS' then
      EXIT;
    if SICHER <> '' then
      Alarm := StrToInt(Sicher);
    Form1.color := clwhite;
    Label1.color := clwhite;
    Blink := False;
  except
    Alarm := 0;
  end;
end;

end.
