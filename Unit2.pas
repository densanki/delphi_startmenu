unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Unit1,Menus;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Button7: TButton;
    ListBox2: TListBox;
    Label6: TLabel;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    Procedure Einlesen;
    Procedure Ausgeben;
    Procedure AnzeigenDATA(X:Integer);
    Procedure AnzeigenWORK(X:integer);
    Procedure AnzeigenMulti(X:integer);
    Procedure AnzeigenPP(X:integer);
    Procedure AnzeigenWeb(X:integer);
    Procedure KILL;
    Procedure EinlesenDaten;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);

    // New
    procedure ButtonSearch(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form2: TForm2;

implementation

{$R *.dfm}

Procedure Tform2.Ausgeben;
  var f : File of Programm;
      Daten : Programm;
      i:Integer;
begin
  //Einlesen von DATA Datei
  AssignFile(f,'DATA.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Daten := DATA[i];
    Write(f,Daten);
  end;
  CloseFile(f);

  //Einlesen von Work Datei
  AssignFile(f,'WORK.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Daten := WORK[i];
    Write(f,Daten);
  end;
  CloseFile(f);

  //Einlesen von MULTI Datei
  AssignFile(f,'MULTI.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Daten := MULTI[i];
    Write(f,Daten);
  end;
  CloseFile(f);

  //Einlesen von PP Datei
  AssignFile(f,'PP.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Daten := PP[i];
    Write(f,Daten);
  end;
  CloseFile(f);

  //Einlesen von WEB Datei
  AssignFile(f,'WEB.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Daten := WEB[i];
    Write(f,Daten);
  end;
  CloseFile(f);

end;


Procedure Tform2.Kill;
begin
  Listbox1.clear;
  Edit1.text := '';
  Edit2.text := '';
  Edit3.text := '';
  Edit4.text := '';
  Edit5.text := '';
end;

Procedure TForm2.EinlesenDaten;
var Auswahl:Integer;
begin

  Auswahl := Listbox1.ItemIndex;

  Case Listbox2.ItemIndex of
  0:begin
     Edit1.text := INTtoSTR(Data[Auswahl].ID);
     Edit2.text := Data[Auswahl].Name;
     Edit3.text := Data[Auswahl].Dateiname;
     Edit4.text := Data[Auswahl].Zusatz;
     Edit5.text := Data[Auswahl].Pfad;
    end;
  1:begin
     Edit1.text := INTtoSTR(WORK[Auswahl].ID);
     Edit2.text := WORK[Auswahl].Name;
     Edit3.text := WORK[Auswahl].Dateiname;
     Edit4.text := WORK[Auswahl].Zusatz;
     Edit5.text := WORK[Auswahl].Pfad;
    end;
  2:begin
     Edit1.text := INTtoSTR(MULTI[Auswahl].ID);
     Edit2.text := Multi[Auswahl].Name;
     Edit3.text := Multi[Auswahl].Dateiname;
     Edit4.text := Multi[Auswahl].Zusatz;
     Edit5.text := Multi[Auswahl].Pfad;
    end;
  3:begin
     Edit1.text := INTtoSTR(PP[Auswahl].ID);
     Edit2.text := PP[Auswahl].Name;
     Edit3.text := PP[Auswahl].Dateiname;
     Edit4.text := PP[Auswahl].Zusatz;
     Edit5.text := PP[Auswahl].Pfad;
    end;
  4:begin
     Edit1.text := INTtoSTR(WEB[Auswahl].ID);
     Edit2.text := WEB[Auswahl].Name;
     Edit3.text := WEB[Auswahl].Dateiname;
     Edit4.text := WEB[Auswahl].Zusatz;
     Edit5.text := WEB[Auswahl].Pfad;
    end;
  end;
  
end;

Procedure Tform2.AnzeigenDATA(X:Integer);
  var i:Integer;
begin
  Kill;
  For i := 0 to 500 DO
  begin
    Listbox1.Items.add(DATA[i].Name)
  end;
  Listbox1.Selected[X]:=True;
  EinlesenDaten;
end;

Procedure Tform2.AnzeigenWORK(X:integer);
  var i:Integer;
begin
  Kill;
  For i := 0 to 500 DO
  begin
    Listbox1.Items.add(WORK[i].Name);
  end;
  Listbox1.Selected[X]:=True;
  EinlesenDaten;
end;

Procedure Tform2.AnzeigenMULTI(X:integer);
  var i:Integer;
begin
  Kill;
  For i := 0 to 500 DO
  begin
    Listbox1.Items.add(MULTI[i].Name);
  end;
  Listbox1.Selected[X]:=True;
  EinlesenDaten;
end;

Procedure Tform2.AnzeigenPP(X:integer);
  var i:Integer;
begin
  Kill;
  For i := 0 to 500 DO
  begin
    Listbox1.Items.add(PP[i].Name);
  end;
  Listbox1.Selected[X]:=True;
  EinlesenDaten;
end;

Procedure Tform2.AnzeigenWeb(X:integer);
  var i:Integer;
begin
  Kill;
  For i := 0 to 500 DO
  begin
    Listbox1.Items.add(WEB[i].Name);
  end;
  Listbox1.Selected[X]:=True;
  EinlesenDaten;
end;

Procedure Tform2.Einlesen;
  var f : File of Programm;
      Daten : Programm;
      i:Integer;
begin

  //Einlesen von DATA Datei
  AssignFile(f,'DATA.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Read(f,Daten);
    DATA[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von Work Datei
  AssignFile(f,'WORK.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Read(f,Daten);
    WORK[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von MULTI Datei
  AssignFile(f,'MULTI.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Read(f,Daten);
    MULTI[i] := Daten;
  end;
  CloseFile(f);
  
  //Einlesen von PP Datei
  AssignFile(f,'PP.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Read(f,Daten);
    PP[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von WEB Datei
  AssignFile(f,'WEB.GER');
  Reset(f);
  For i := 0 to 500 DO
  begin
    Read(f,Daten);
    WEB[i] := Daten;
  end;
  CloseFile(f);

end;

procedure TForm2.Button1Click(Sender: TObject);
var NewItem:TMenuItem;
    index,i:integer;
begin

  Form1.PopupMenu1.Items.Clear;
  Form1.PopupMenu2.Items.Clear;
  Form1.PopupMenu3.Items.Clear;
  Form1.PopupMenu4.Items.Clear;
  Form1.PopupMenu5.Items.Clear;

  FOR I := 0 TO 500 DO
  begin

    IF Data[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu1);
      Form1.PopupMenu1.Items.Add(NewItem);
      NewItem.Caption := Data[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupDATA;
    end;

    IF Work[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu2);
      Form1.PopupMenu2.Items.Add(NewItem);
      NewItem.Caption := WORK[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupWORK;
    end;

    IF Multi[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu3);
      Form1.PopupMenu3.Items.Add(NewItem);
      NewItem.Caption := Multi[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupMulti;
    end;

    IF PP[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu4);
      Form1.PopupMenu4.Items.Add(NewItem);
      NewItem.Caption := PP[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupPP;
    end;

    IF Web[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu5);
      Form1.PopupMenu5.Items.Add(NewItem);
      NewItem.Caption := Web[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupWeb;
    end;
  end;


  close;
end;

procedure TForm2.Button3Click(Sender: TObject);
  var f : File of Programm;
      Daten : Programm;
      i:Integer;
begin

//  AssignFile(f,'web.ger');
//  Rewrite(f);

//  For i := 0 to 500 DO
//  begin
//    Daten.ID        := i;
//    Daten.Name      := '< leer >';
//    Daten.Dateiname := '';
//    Daten.Zusatz    := '';
//    Daten.Pfad      := '';

//    Write(f,Daten);
//  end;

//  Write(f,Daten);
//  CloseFile(f);

end;

procedure TForm2.Button2Click(Sender: TObject);
var Auswahl:Integer;
begin

  Auswahl := Listbox1.ItemIndex;

  Case Listbox2.ItemIndex of
  0: begin
       Data[Auswahl].ID := STRtoINT(Edit1.text);
       Data[Auswahl].Name := Edit2.text;
       Data[Auswahl].Dateiname := Edit3.text;
       Data[Auswahl].Zusatz := Edit4.text;
       Data[Auswahl].Pfad := Edit5.text;
       ListBox1.Items.Strings[Auswahl] := Data[Auswahl].Name;
       Ausgeben;
     end;
  1: begin
       Work[Auswahl].ID := STRtoINT(Edit1.text);
       Work[Auswahl].Name := Edit2.text;
       Work[Auswahl].Dateiname := Edit3.text;
       Work[Auswahl].Zusatz := Edit4.text;
       Work[Auswahl].Pfad := Edit5.text;
       ListBox1.Items.Strings[Auswahl] := Work[Auswahl].Name;
       Ausgeben;
     end;
  2: begin
       Multi[Auswahl].ID := STRtoINT(Edit1.text);
       Multi[Auswahl].Name := Edit2.text;
       Multi[Auswahl].Dateiname := Edit3.text;
       Multi[Auswahl].Zusatz := Edit4.text;
       Multi[Auswahl].Pfad := Edit5.text;
       ListBox1.Items.Strings[Auswahl] := Multi[Auswahl].Name;
       Ausgeben;
     end;
  3: begin
       PP[Auswahl].ID := STRtoINT(Edit1.text);
       PP[Auswahl].Name := Edit2.text;
       PP[Auswahl].Dateiname := Edit3.text;
       PP[Auswahl].Zusatz := Edit4.text;
       PP[Auswahl].Pfad := Edit5.text;
       ListBox1.Items.Strings[Auswahl] := PP[Auswahl].Name;
       Ausgeben;
     end;
  4: begin
       WEB[Auswahl].ID := STRtoINT(Edit1.text);
       WEB[Auswahl].Name := Edit2.text;
       WEB[Auswahl].Dateiname := Edit3.text;
       WEB[Auswahl].Zusatz := Edit4.text;
       WEB[Auswahl].Pfad := Edit5.text;
       ListBox1.Items.Strings[Auswahl] := Web[Auswahl].Name;
       Ausgeben;
     end;

  end;

end;

procedure TForm2.Button4Click(Sender: TObject);
var Auswahl:Integer;
begin

  Auswahl := Listbox1.ItemIndex;

  Case Listbox2.ItemIndex of
  0: begin
       Data[Auswahl].ID := STRtoINT(Edit1.text);
       Data[Auswahl].Name := '< leer >';
       Data[Auswahl].Dateiname := '';
       Data[Auswahl].Zusatz := '';
       Data[Auswahl].Pfad := '';
       Edit2.text := '';
       Edit3.text := '';
       Edit4.text := '';
       Edit5.text := '';
       Ausgeben;
       ListBox1.Items.Strings[Auswahl] := Data[Auswahl].Name;
     end;
  1: begin
       Work[Auswahl].ID := STRtoINT(Edit1.text);
       Work[Auswahl].Name := '< leer >';
       Work[Auswahl].Dateiname := '';
       Work[Auswahl].Zusatz := '';
       Work[Auswahl].Pfad := '';
       Edit2.text := '';
       Edit3.text := '';
       Edit4.text := '';
       Edit5.text := '';
       Ausgeben;
       ListBox1.Items.Strings[Auswahl] := Work[Auswahl].Name;     end;
  2: begin
       Multi[Auswahl].ID := STRtoINT(Edit1.text);
       Multi[Auswahl].Name := '< leer >';
       Multi[Auswahl].Dateiname := '';
       Multi[Auswahl].Zusatz := '';
       Multi[Auswahl].Pfad := '';
       Edit2.text := '';
       Edit3.text := '';
       Edit4.text := '';
       Edit5.text := '';
       Ausgeben;
       ListBox1.Items.Strings[Auswahl] := Multi[Auswahl].Name;
     end;
  3: begin
       PP[Auswahl].ID := STRtoINT(Edit1.text);
       PP[Auswahl].Name := '< leer >';
       PP[Auswahl].Dateiname := '';
       PP[Auswahl].Zusatz := '';
       PP[Auswahl].Pfad := '';
       Edit2.text := '';
       Edit3.text := '';
       Edit4.text := '';
       Edit5.text := '';
       Ausgeben;
       ListBox1.Items.Strings[Auswahl] := PP[Auswahl].Name;
     end;
  4: begin
       Web[Auswahl].ID := STRtoINT(Edit1.text);
       Web[Auswahl].Name := '< leer >';
       Web[Auswahl].Dateiname := '';
       Web[Auswahl].Zusatz := '';
       Web[Auswahl].Pfad := '';
       Edit2.text := '';
       Edit3.text := '';
       Edit4.text := '';
       Edit5.text := '';
       Ausgeben;
       ListBox1.Items.Strings[Auswahl] := WEB[Auswahl].Name;
     end;
  end;

end;

procedure TForm2.Button5Click(Sender: TObject);
var I:Integer;
begin

  CASE Listbox2.ItemIndex of
  -1: Showmessage('Bitte wählen sie eine Programm Ordner aus');
  0   :begin
          I := 0;
          While NOT (Listbox1.Items.Strings[I] = '< leer >') AND NOT (I = 500) DO
          begin
            INC(I);
          end;
          Listbox1.Selected[i] := True;
          AnzeigenData(I);
          Edit2.text := '';
       end;
  1   :begin
          I := 0;
          While NOT (Listbox1.Items.Strings[I] = '< leer >') AND NOT (I = 500) DO
          begin
            INC(I);
          end;
          Listbox1.Selected[i] := True;
          AnzeigenWork(I);
          Edit2.text := '';
       end;
  2   :begin
          I := 0;
          While NOT (Listbox1.Items.Strings[I] = '< leer >') AND NOT (I = 500) DO
          begin
            INC(I);
          end;
          Listbox1.Selected[i] := True;
          AnzeigenMulti(I);
          Edit2.text := '';
       end;
  3   :begin
          I := 0;
          While NOT (Listbox1.Items.Strings[I] = '< leer >') AND NOT (I = 500) DO
          begin
            INC(I);
          end;
          Listbox1.Selected[i] := True;
          AnzeigenPP(I);
          Edit2.text := '';
       end;
  4   :begin
          I := 0;
          While NOT (Listbox1.Items.Strings[I] = '< leer >') AND NOT (I = 500) DO
          begin
            INC(I);
          end;
          Listbox1.Selected[i] := True;
          AnzeigenWeb(I);
          Edit2.text := '';
       end;

  end;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin

  CASE Listbox2.ItemIndex of
  -1: Showmessage('Bitte wählen sie eine Programm Ordner aus');
  0 : begin
        AnzeigenData(Listbox1.ItemIndex);
      end;
  1 : begin
        AnzeigenWork(Listbox1.ItemIndex);
      end;
  2 : begin
        AnzeigenMulti(Listbox1.ItemIndex);
      end;
  3 : begin
        AnzeigenPP(Listbox1.ItemIndex);
      end;
  4 : begin
        AnzeigenWEB(Listbox1.ItemIndex);
      end;
  end;//End Case

end;

procedure TForm2.ButtonSearch(Sender: TObject);
var B_Answer:Boolean;
    S_Default_Path:String;
begin
  S_Default_Path := 'C:\Programme';
  if DirectoryExists(S_Default_Path) then OpenDialog1.InitialDir := S_Default_Path;
  B_Answer := OpenDialog1.Execute;
  if( B_Answer ) then
  begin
    Edit3.Text := ExtractFileName( OpenDialog1.FileName );
    Edit5.Text := ExtractFilePath( OpenDialog1.FileName );
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  EinlesenDaten;
end;

procedure TForm2.Button7Click(Sender: TObject);
var Windowhandle:  Hwnd;
begin
  Windowhandle := FindWindow('Shell_TrayWnd', '');
  If Windowhandle <> 0 Then
    ShowWindow(Windowhandle, SW_RESTORE);
  Application.Terminate;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Listbox2.ItemIndex := 0;
  Form2.AnzeigenDATA(0);
end;

procedure TForm2.ListBox2Click(Sender: TObject);
begin

  Form2.Einlesen;

  case Listbox2.ItemIndex of
  0: Form2.AnzeigenDATA(0);
  1: Form2.AnzeigenWORK(0);
  2: Form2.AnzeigenMulti(0);
  3: Form2.AnzeigenPP(0);
  4: Form2.AnzeigenWeb(0);
  end;

end;

end.
