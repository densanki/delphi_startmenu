unit Unit2;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Unit1, Menus;

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
    procedure Einlesen;
    procedure Ausgeben;
    procedure AnzeigenDATA(X: integer);
    procedure AnzeigenWORK(X: integer);
    procedure AnzeigenMulti(X: integer);
    procedure AnzeigenPP(X: integer);
    procedure AnzeigenWeb(X: integer);
    procedure KILL;
    procedure EinlesenDaten;
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

{$R *.lfm}

procedure Tform2.Ausgeben;
var
  f: file of Programm;
  Daten: Programm;
  i: integer;
begin
  //Einlesen von DATA Datei
  AssignFile(f, 'DATA.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Daten := Data[i];
    Write(f, Daten);
  end;
  CloseFile(f);

  //Einlesen von Work Datei
  AssignFile(f, 'WORK.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Daten := WORK[i];
    Write(f, Daten);
  end;
  CloseFile(f);

  //Einlesen von MULTI Datei
  AssignFile(f, 'MULTI.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Daten := MULTI[i];
    Write(f, Daten);
  end;
  CloseFile(f);

  //Einlesen von PP Datei
  AssignFile(f, 'PP.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Daten := PP[i];
    Write(f, Daten);
  end;
  CloseFile(f);

  //Einlesen von WEB Datei
  AssignFile(f, 'WEB.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Daten := WEB[i];
    Write(f, Daten);
  end;
  CloseFile(f);

end;


procedure Tform2.Kill;
begin
  Listbox1.Clear;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
end;

procedure TForm2.EinlesenDaten;
var
  Auswahl: integer;
begin

  Auswahl := Listbox1.ItemIndex;

  case Listbox2.ItemIndex of
    0:
    begin
      Edit1.Text := IntToStr(Data[Auswahl].ID);
      Edit2.Text := Data[Auswahl].Name;
      Edit3.Text := Data[Auswahl].Dateiname;
      Edit4.Text := Data[Auswahl].Zusatz;
      Edit5.Text := Data[Auswahl].Pfad;
    end;
    1:
    begin
      Edit1.Text := IntToStr(WORK[Auswahl].ID);
      Edit2.Text := WORK[Auswahl].Name;
      Edit3.Text := WORK[Auswahl].Dateiname;
      Edit4.Text := WORK[Auswahl].Zusatz;
      Edit5.Text := WORK[Auswahl].Pfad;
    end;
    2:
    begin
      Edit1.Text := IntToStr(MULTI[Auswahl].ID);
      Edit2.Text := Multi[Auswahl].Name;
      Edit3.Text := Multi[Auswahl].Dateiname;
      Edit4.Text := Multi[Auswahl].Zusatz;
      Edit5.Text := Multi[Auswahl].Pfad;
    end;
    3:
    begin
      Edit1.Text := IntToStr(PP[Auswahl].ID);
      Edit2.Text := PP[Auswahl].Name;
      Edit3.Text := PP[Auswahl].Dateiname;
      Edit4.Text := PP[Auswahl].Zusatz;
      Edit5.Text := PP[Auswahl].Pfad;
    end;
    4:
    begin
      Edit1.Text := IntToStr(WEB[Auswahl].ID);
      Edit2.Text := WEB[Auswahl].Name;
      Edit3.Text := WEB[Auswahl].Dateiname;
      Edit4.Text := WEB[Auswahl].Zusatz;
      Edit5.Text := WEB[Auswahl].Pfad;
    end;
  end;

end;

procedure Tform2.AnzeigenDATA(X: integer);
var
  i: integer;
begin
  Kill;
  for i := 0 to 500 do
  begin
    Listbox1.Items.add(Data[i].Name);
  end;
  Listbox1.Selected[X] := True;
  EinlesenDaten;
end;

procedure Tform2.AnzeigenWORK(X: integer);
var
  i: integer;
begin
  Kill;
  for i := 0 to 500 do
  begin
    Listbox1.Items.add(WORK[i].Name);
  end;
  Listbox1.Selected[X] := True;
  EinlesenDaten;
end;

procedure Tform2.AnzeigenMULTI(X: integer);
var
  i: integer;
begin
  Kill;
  for i := 0 to 500 do
  begin
    Listbox1.Items.add(MULTI[i].Name);
  end;
  Listbox1.Selected[X] := True;
  EinlesenDaten;
end;

procedure Tform2.AnzeigenPP(X: integer);
var
  i: integer;
begin
  Kill;
  for i := 0 to 500 do
  begin
    Listbox1.Items.add(PP[i].Name);
  end;
  Listbox1.Selected[X] := True;
  EinlesenDaten;
end;

procedure Tform2.AnzeigenWeb(X: integer);
var
  i: integer;
begin
  Kill;
  for i := 0 to 500 do
  begin
    Listbox1.Items.add(WEB[i].Name);
  end;
  Listbox1.Selected[X] := True;
  EinlesenDaten;
end;

procedure Tform2.Einlesen;
var
  f: file of Programm;
  Daten: Programm;
  i: integer;
begin

  //Einlesen von DATA Datei
  AssignFile(f, 'DATA.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Read(f, Daten);
    Data[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von Work Datei
  AssignFile(f, 'WORK.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Read(f, Daten);
    WORK[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von MULTI Datei
  AssignFile(f, 'MULTI.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Read(f, Daten);
    MULTI[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von PP Datei
  AssignFile(f, 'PP.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Read(f, Daten);
    PP[i] := Daten;
  end;
  CloseFile(f);

  //Einlesen von WEB Datei
  AssignFile(f, 'WEB.GER');
  Reset(f);
  for i := 0 to 500 do
  begin
    Read(f, Daten);
    WEB[i] := Daten;
  end;
  CloseFile(f);

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  NewItem: TMenuItem;
  index, i: integer;
begin

  Form1.PopupMenu1.Items.Clear;
  Form1.PopupMenu2.Items.Clear;
  Form1.PopupMenu3.Items.Clear;
  Form1.PopupMenu4.Items.Clear;
  Form1.PopupMenu5.Items.Clear;

  for I := 0 to 500 do
  begin

    if Data[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu1);
      Form1.PopupMenu1.Items.Add(NewItem);
      NewItem.Caption := Data[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupDATA;
    end;

    if Work[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu2);
      Form1.PopupMenu2.Items.Add(NewItem);
      NewItem.Caption := WORK[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupWORK;
    end;

    if Multi[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu3);
      Form1.PopupMenu3.Items.Add(NewItem);
      NewItem.Caption := Multi[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupMulti;
    end;

    if PP[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu4);
      Form1.PopupMenu4.Items.Add(NewItem);
      NewItem.Caption := PP[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupPP;
    end;

    if Web[i].Name <> '< leer >' then
    begin
      NewItem := TMenuItem.Create(Form1.PopupMenu5);
      Form1.PopupMenu5.Items.Add(NewItem);
      NewItem.Caption := Web[i].Name;
      NewItem.Tag := I;
      NewItem.OnClick := Form1.PopupWeb;
    end;
  end;


  Close;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  f: file of Programm;
  Daten: Programm;
  i: integer;
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
var
  Auswahl: integer;
begin

  Auswahl := Listbox1.ItemIndex;

  case Listbox2.ItemIndex of
    0:
    begin
      Data[Auswahl].ID := StrToInt(Edit1.Text);
      Data[Auswahl].Name := Edit2.Text;
      Data[Auswahl].Dateiname := Edit3.Text;
      Data[Auswahl].Zusatz := Edit4.Text;
      Data[Auswahl].Pfad := Edit5.Text;
      ListBox1.Items.Strings[Auswahl] := Data[Auswahl].Name;
      Ausgeben;
    end;
    1:
    begin
      Work[Auswahl].ID := StrToInt(Edit1.Text);
      Work[Auswahl].Name := Edit2.Text;
      Work[Auswahl].Dateiname := Edit3.Text;
      Work[Auswahl].Zusatz := Edit4.Text;
      Work[Auswahl].Pfad := Edit5.Text;
      ListBox1.Items.Strings[Auswahl] := Work[Auswahl].Name;
      Ausgeben;
    end;
    2:
    begin
      Multi[Auswahl].ID := StrToInt(Edit1.Text);
      Multi[Auswahl].Name := Edit2.Text;
      Multi[Auswahl].Dateiname := Edit3.Text;
      Multi[Auswahl].Zusatz := Edit4.Text;
      Multi[Auswahl].Pfad := Edit5.Text;
      ListBox1.Items.Strings[Auswahl] := Multi[Auswahl].Name;
      Ausgeben;
    end;
    3:
    begin
      PP[Auswahl].ID := StrToInt(Edit1.Text);
      PP[Auswahl].Name := Edit2.Text;
      PP[Auswahl].Dateiname := Edit3.Text;
      PP[Auswahl].Zusatz := Edit4.Text;
      PP[Auswahl].Pfad := Edit5.Text;
      ListBox1.Items.Strings[Auswahl] := PP[Auswahl].Name;
      Ausgeben;
    end;
    4:
    begin
      WEB[Auswahl].ID := StrToInt(Edit1.Text);
      WEB[Auswahl].Name := Edit2.Text;
      WEB[Auswahl].Dateiname := Edit3.Text;
      WEB[Auswahl].Zusatz := Edit4.Text;
      WEB[Auswahl].Pfad := Edit5.Text;
      ListBox1.Items.Strings[Auswahl] := Web[Auswahl].Name;
      Ausgeben;
    end;

  end;

end;

procedure TForm2.Button4Click(Sender: TObject);
var
  Auswahl: integer;
begin

  Auswahl := Listbox1.ItemIndex;

  case Listbox2.ItemIndex of
    0:
    begin
      Data[Auswahl].ID := StrToInt(Edit1.Text);
      Data[Auswahl].Name := '< leer >';
      Data[Auswahl].Dateiname := '';
      Data[Auswahl].Zusatz := '';
      Data[Auswahl].Pfad := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Ausgeben;
      ListBox1.Items.Strings[Auswahl] := Data[Auswahl].Name;
    end;
    1:
    begin
      Work[Auswahl].ID := StrToInt(Edit1.Text);
      Work[Auswahl].Name := '< leer >';
      Work[Auswahl].Dateiname := '';
      Work[Auswahl].Zusatz := '';
      Work[Auswahl].Pfad := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Ausgeben;
      ListBox1.Items.Strings[Auswahl] := Work[Auswahl].Name;
    end;
    2:
    begin
      Multi[Auswahl].ID := StrToInt(Edit1.Text);
      Multi[Auswahl].Name := '< leer >';
      Multi[Auswahl].Dateiname := '';
      Multi[Auswahl].Zusatz := '';
      Multi[Auswahl].Pfad := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Ausgeben;
      ListBox1.Items.Strings[Auswahl] := Multi[Auswahl].Name;
    end;
    3:
    begin
      PP[Auswahl].ID := StrToInt(Edit1.Text);
      PP[Auswahl].Name := '< leer >';
      PP[Auswahl].Dateiname := '';
      PP[Auswahl].Zusatz := '';
      PP[Auswahl].Pfad := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Ausgeben;
      ListBox1.Items.Strings[Auswahl] := PP[Auswahl].Name;
    end;
    4:
    begin
      Web[Auswahl].ID := StrToInt(Edit1.Text);
      Web[Auswahl].Name := '< leer >';
      Web[Auswahl].Dateiname := '';
      Web[Auswahl].Zusatz := '';
      Web[Auswahl].Pfad := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';
      Edit5.Text := '';
      Ausgeben;
      ListBox1.Items.Strings[Auswahl] := WEB[Auswahl].Name;
    end;
  end;

end;

procedure TForm2.Button5Click(Sender: TObject);
var
  I: integer;
begin

  case Listbox2.ItemIndex of
    -1: ShowMessage('Bitte wählen sie eine Programm Ordner aus');
    0:
    begin
      I := 0;
      while not (Listbox1.Items.Strings[I] = '< leer >') and not (I = 500) do
      begin
        Inc(I);
      end;
      Listbox1.Selected[i] := True;
      AnzeigenData(I);
      Edit2.Text := '';
    end;
    1:
    begin
      I := 0;
      while not (Listbox1.Items.Strings[I] = '< leer >') and not (I = 500) do
      begin
        Inc(I);
      end;
      Listbox1.Selected[i] := True;
      AnzeigenWork(I);
      Edit2.Text := '';
    end;
    2:
    begin
      I := 0;
      while not (Listbox1.Items.Strings[I] = '< leer >') and not (I = 500) do
      begin
        Inc(I);
      end;
      Listbox1.Selected[i] := True;
      AnzeigenMulti(I);
      Edit2.Text := '';
    end;
    3:
    begin
      I := 0;
      while not (Listbox1.Items.Strings[I] = '< leer >') and not (I = 500) do
      begin
        Inc(I);
      end;
      Listbox1.Selected[i] := True;
      AnzeigenPP(I);
      Edit2.Text := '';
    end;
    4:
    begin
      I := 0;
      while not (Listbox1.Items.Strings[I] = '< leer >') and not (I = 500) do
      begin
        Inc(I);
      end;
      Listbox1.Selected[i] := True;
      AnzeigenWeb(I);
      Edit2.Text := '';
    end;

  end;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin

  case Listbox2.ItemIndex of
    -1: ShowMessage('Bitte wählen sie eine Programm Ordner aus');
    0:
    begin
      AnzeigenData(Listbox1.ItemIndex);
    end;
    1:
    begin
      AnzeigenWork(Listbox1.ItemIndex);
    end;
    2:
    begin
      AnzeigenMulti(Listbox1.ItemIndex);
    end;
    3:
    begin
      AnzeigenPP(Listbox1.ItemIndex);
    end;
    4:
    begin
      AnzeigenWEB(Listbox1.ItemIndex);
    end;
  end;//End Case

end;

procedure TForm2.ButtonSearch(Sender: TObject);
var
  B_Answer: boolean;
  S_Default_Path: string;
begin
  S_Default_Path := 'C:\Programme';
  if DirectoryExists(S_Default_Path) then
    OpenDialog1.InitialDir := S_Default_Path;
  B_Answer := OpenDialog1.Execute;
  if (B_Answer) then
  begin
    Edit3.Text := ExtractFileName(OpenDialog1.FileName);
    Edit5.Text := ExtractFilePath(OpenDialog1.FileName);
  end;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
  EinlesenDaten;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
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
