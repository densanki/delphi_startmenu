unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus,ShellApi;

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
    Procedure POPUPREAD();
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
    ID:Integer;
    Name : string[20];
    Dateiname : String[255];
    Zusatz:STring[255];
    Pfad:String[255];
end;

var
  Form1: TForm1;
  Blink:Boolean;
  Data:  Array[0..500] of Programm;
  Work:  Array[0..500] of Programm;
  Multi: Array[0..500] of Programm;
  PP:    Array[0..500] of Programm;
  WEB:   Array[0..500] of Programm;
  Alarm : Integer;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

Procedure TForm1.POPUPREAD();
  var Datei : File of Programm;
      Daten : Programm;
      NewItem: TMenuItem;
      index: Integer;
begin

AssignFile(Datei,'daten.ger');
Reset(Datei);
read(Datei,Daten);

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
var Dateiname:String;
    Zusatz:String;
    Pfad:String;
begin

  with Sender as TMenuItem do
  begin
    Dateiname := Data[Tag].Dateiname;
    Zusatz :=    Data[Tag].Zusatz;
    Pfad :=      Data[Tag].Pfad;

    ShellExecute(Application.Handle, 'open' ,PChar(Dateiname),PChar(Zusatz) , PChar(Pfad), sw_ShowNormal);
  end;
end;

procedure TForm1.PopupWork(Sender: TObject);
var Dateiname:String;
    Zusatz:String;
    Pfad:String;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := Work[Tag].Dateiname;
    Zusatz :=    Work[Tag].Zusatz;
    Pfad :=      Work[Tag].Pfad;

    ShellExecute(Application.Handle, 'open' ,PChar(Dateiname),PChar(Zusatz) , PChar(Pfad), sw_ShowNormal);
  end;
end;

procedure TForm1.PopupMulti(Sender: TObject);
var Dateiname:String;
    Zusatz:String;
    Pfad:String;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := Multi[Tag].Dateiname;
    Zusatz :=    Multi[Tag].Zusatz;
    Pfad :=      Multi[Tag].Pfad;

    ShellExecute(Application.Handle, 'open' ,PChar(Dateiname),PChar(Zusatz) , PChar(Pfad), sw_ShowNormal);
  end;
end;

procedure TForm1.PopupPP(Sender: TObject);
var Dateiname:String;
    Zusatz:String;
    Pfad:String;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := PP[Tag].Dateiname;
    Zusatz :=    PP[Tag].Zusatz;
    Pfad :=      PP[Tag].Pfad;

    ShellExecute(Application.Handle, 'open' ,PChar(Dateiname),PChar(Zusatz) , PChar(Pfad), sw_ShowNormal);
  end;
end;

procedure TForm1.PopupWEB(Sender: TObject);
var Dateiname:String;
    Zusatz:String;
    Pfad:String;
begin

  with Sender as TMenuItem do
  begin

    Dateiname := WEB[Tag].Dateiname;
    Zusatz :=    WEB[Tag].Zusatz;
    Pfad :=      WEB[Tag].Pfad;

    ShellExecute(Application.Handle, 'open' ,PChar(Dateiname),PChar(Zusatz) , PChar(Pfad), sw_ShowNormal);
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var NewItem:TMenuItem;
    index,i:integer;
    Windowhandle:  Hwnd;
begin

  {
  //Ausblendung der Windows Task Leiste
  Windowhandle := FindWindow('Shell_TrayWnd', '');
  If Windowhandle <> 0 Then
    ShowWindow(Windowhandle, SW_HIDE);
  }

  Form1.Left   := 200;
  Form1.Top    := 0;
  Form1.Height := 25;
  Form1.Width := 400;

  Label1.caption := TIMEtoSTR(Now)+ ' ' + DATEtoSTR(now);

  Form2.einlesen;

  FOR I := 0 TO 500 DO
  begin

    IF Data[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu1);
      PopupMenu1.Items.Add(NewItem);
      NewItem.Caption := Data[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupDATA;
    end;

    IF Work[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu2);
      PopupMenu2.Items.Add(NewItem);
      NewItem.Caption := WORK[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupWORK;
    end;

    IF Multi[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu3);
      PopupMenu3.Items.Add(NewItem);
      NewItem.Caption := Multi[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupMulti;
    end;

    IF PP[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(PopupMenu4);
      PopupMenu4.Items.Add(NewItem);
      NewItem.Caption := PP[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := PopupPP;
    end;

    IF Web[i].Name <> '< leer >' then
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
var Zeit:String;
    ZeitH:String;
    ZeitA:Integer;
begin
   Zeit := TIMEtoSTR(NOW);
   Label1.caption := Zeit + ' ' + DATEtoSTR(now);

   ZeitH := Zeit[1]+Zeit[2]+Zeit[4]+Zeit[5]+Zeit[7]+Zeit[8];
   ZeitA := STRtoINT(ZeitH);
   IF ZEITA > Alarm then
   begin
     IF Blink=TRUE THEN
     begin
       Form1.color := clwhite;
       Label1.color := clwhite;
       Blink:=FALSE;
     end
     ELSE
     Begin
       form1.color := clgreen;
       Label1.color := clgreen;
       Blink:=TRUE;
     end;

   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  popupmenu1.Popup(Form1.Left+Button2.Left,Button2.width);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  popupmenu2.Popup(Form1.Left+Button3.Left,Button3.width);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  popupmenu3.Popup(Form1.Left+Button4.Left,Button4.width);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  popupmenu4.Popup(Form1.Left+Button5.Left,Button5.width);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
//close;
  popupmenu5.Popup(Form1.Left+Button6.Left,Button6.width);
end;

procedure TForm1.Label1Click(Sender: TObject);
var sicher:String;
begin
  try
    Sicher := InputBox('Alarm Box', 'Alarm eingeben', 'HHMMSS');
    IF SICHER='HHMMSS' THEN EXIT;
    IF SICHER<>'' THEN Alarm := STRtoINT(Sicher);
    Form1.color := clwhite;
    Label1.color := clwhite;
    Blink:=FALSE;
  except
    Alarm := 0;
  end;
end;

end.
