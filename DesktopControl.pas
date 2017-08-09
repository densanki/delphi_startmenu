////////////////////////////////////////////////////////////////////////////////
// Jazarsoft DesktopControl Component                                         //
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// VERSION      : 1.2                                                         //
// AUTHOR       : James Azarja                                                //
// CREATED      : 05 August 2000                                              //
// MODIFIED     : 23 December 2000                                            //
// WEBSITE      : http://www.jazarsoft.com/                                   //
// SUPPORT      : support@jazarsoft.com                                       //
// BUG-REPORT   : bugreport@jazarsoft.com                                     //
// COMMENT      : comment@jazarsoft.com                                       //
// LEGAL        : Copyright (C) 2000 Jazarsoft.                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// NOTE                                                                       //
//                                                                            //
// This code may be used and modified by anyone so long as  this header and   //
// copyright  information remains intact.                                     //
//                                                                            //
// The code is provided "as-is" and without warranty of any kind,             //
// expressed, implied or otherwise, including and without limitation, any     //
// warranty of merchantability or fitness for a  particular purpose.          //
//                                                                            //
// In no event shall the author be liable for any special, incidental,        //
// indirect or consequential damages whatsoever (including, without           //
// limitation, damages for loss of profits, business interruption, loss       //
// of information, or any other loss), whether or not advised of the          //
// possibility of damage, and on any theory of liability, arising out of      //
// or in connection with the use or inability to use this software.           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// HISTORY                                                                    //
//                                                                            //
// 1.0 - Initial Development                                                  //
// 1.1 - Fixed "stored value" bug.                                            //
// 1.2 - Added Taskbar's AutoHide & AlwaysOnTop Detection                     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
unit DesktopControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CommCtrl, ShellApi;

{$WARNINGS OFF}
{$HINTS OFF}

type
  TArrangeIconStyle = (aisLeft,aisTop,aisRight,aisBottom,aisDefault,aisSnapToGrid);

  TQuickLaunch = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;
  end;
  
  TTrayClock = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
   Function  GetText:String;
   Procedure SetText(Value:String);
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;
   property Text    : String  Read GetText  Write SetText stored false;
  end;
                  
  TAppSwitchBar = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;
  end;

  TTrayNotify = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   FTrayClock : tTrayClock;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled;
   property Visible : Boolean Read GetVisible Write SetVisible;
   property TrayClock   : TTrayClock   Read FTrayClock   Write FTrayClock;
  end;

  TStartButton = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
   Procedure OpenStartMenu;
   Procedure CloseStartMenu;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;
  end;

  TTaskBar = Class(TPersistent)
  private
   FEnabled     : Boolean;
   FVisible     : Boolean;
   FHandle      : Hwnd;
   FTrayNotify  : tTrayNotify;
   FQuickLaunch : tQuickLaunch;
   FAppSwitchBar: tAppSwitchBar;
   FStartButton : tStartButton;

   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetAutoHide:Boolean;
   Function  GetAlwaysOnTop:Boolean;
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
  protected
  public
   constructor Create;
   destructor Destroy;override;
   property Hwnd    : Hwnd    Read FHandle;
  published
   property TrayNotify  : TTrayNotify  Read FTrayNotify  Write FTrayNotify stored false;
   property QuickLaunch : TQuickLaunch Read FQuickLaunch Write FQuickLaunch stored false;
   property AppSwitchBar: TAppSwitchBar Read FAppSwitchBar Write FAppSwitchBar stored false;
   property StartButton : TStartButton Read FStartButton Write FStartButton stored false;
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;

   property AutoHide    : Boolean Read GetAutoHide stored false;
   property AlwaysOnTop : Boolean Read GetAlwaysOnTop Stored False;
  end;

  TDesktop = Class(TPersistent)
  private
   FEnabled   : Boolean;
   FVisible   : Boolean;
   FHandle    : Hwnd;
   FLVHandle  : Hwnd;
   FArrangeIcon : TArrangeIconStyle;
   FIconTextBG: tColor;
   FIconText  : tColor;
   FIconVisible: Boolean;
   FDC        : Hdc;
   FCanvas    : TCanvas;
   Procedure SetEnabled(Value:Boolean);
   Procedure SetVisible(Value:Boolean);
   Function  GetEnabled:Boolean;
   Function  GetVisible:Boolean;
//   Procedure SetArrangeIcon(Value:TArrangeIconStyle);
   procedure SetIconTextBG(Value:tColor);
   Procedure SetIconText(Value:tColor);
   Procedure SetIconVisible(Value:Boolean);
  protected
  public
   constructor Create;
   destructor Destroy;override;
   Procedure Refresh;
   property Hwnd    : Hwnd    Read FHandle;
   { Lock & Unlock before / after use }
   property  Canvas  : tCanvas Read FCanvas  Write FCanvas stored false;
   Procedure LockCanvas;
   Procedure UnLockCanvas;

   Procedure TransparentIconBG;
  published
   property Enabled : Boolean Read GetEnabled Write SetEnabled stored false;
   property Visible : Boolean Read GetVisible Write SetVisible stored false;
// property ArrangeIcon :  TArrangeIconStyle Read FArrangeIcon Write SetArrangeIcon;
   property IconTextBG : tColor Read FIconTextBG Write SetIconTextBG stored false;
   property IconText   : tColor Read FIconText   Write SetIconText stored false;
   property IconVisible: Boolean Read FIconVisible Write SetIconVisible stored false;
  end;

  TDesktopControl = class(TComponent)
  private
   FTaskBar     : tTaskBar;
   FDesktop     : tDesktop;
  protected
    { Protected declarations }
  public
   constructor create(AOwner:TComponent);override;
   destructor  destroy;override;
   procedure   Loaded;override;
  published
    property Taskbar     : TTaskbar     Read FTaskbar     Write FTaskBar stored false;
    property Desktop     : TDesktop     Read FDesktop     Write FDesktop stored false;
  end;

procedure Register;

implementation


constructor TQuickLaunch.Create;
Begin
  inherited Create;
  FHandle:=FindWindowEx(
            FindWindowEx( FindWindow('Shell_TrayWnd', nil), 0, 'ReBarWindow32', nil),
            0, 'ToolbarWindow32', nil);
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
End;

destructor TQuickLaunch.Destroy;
Begin
  inherited Destroy;
End;

Procedure TQuickLaunch.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TQuickLaunch.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TQuickLaunch.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TQuickLaunch.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

constructor TTrayClock.Create;
Begin
  inherited Create;
  FHandle:=FindWindowEx(
            FindWindowEx( FindWindow('Shell_TrayWnd', nil), 0, 'TrayNotifyWnd', nil),
            0, 'TrayClockWClass', nil);
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
End;

destructor TTrayClock.Destroy;
Begin
  inherited Destroy;
End;

Procedure TTrayClock.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TTrayClock.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TTrayClock.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TTrayClock.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

Function TTrayClock.GetText:String;
var Buffer : Array [0..255] of char;
Begin
 SendMessage(FHandle, WM_GETTEXT, SizeOf(Buffer), LongInt(@Buffer));
 Result:=Buffer;
End;

Procedure TTrayClock.SetText(Value:String);
Begin
 SendMessage(FHandle, WM_SETTEXT,0, LongInt(Pchar(Value)));
End;

constructor TAppSwitchBar.Create;
Begin
  inherited Create;
  FHandle:=FindWindowEx(
            FindWindowEx(
             FindWindowEx( FindWindow('Shell_TrayWnd', nil), 0, 'ReBarWindow32', nil),
             0, 'MSTaskSwWClass', nil),
             0, 'SysTabControl32', nil);
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
End;

destructor TAppSwitchBar.Destroy;
Begin
  inherited Destroy;
End;

Procedure TAppSwitchBar.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TAppSwitchBar.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TAppSwitchBar.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TAppSwitchBar.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

constructor TTrayNotify.Create;
Begin
  inherited Create;
  FHandle:=FindWindowEx( FindWindow('Shell_TrayWnd', nil), 0, 'TrayNotifyWnd', nil);
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
  FTrayClock:=tTrayClock.Create;
End;

destructor TTrayNotify.Destroy;
Begin
  FTrayClock.Free;
  inherited Destroy;
End;

Procedure TTrayNotify.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TTrayNotify.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TTrayNotify.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TTrayNotify.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

constructor TStartButton.Create;
Begin
  inherited Create;
  FHandle:=FindWindowEx( FindWindow('Shell_TrayWnd', nil), 0, 'Button', nil);
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
End;

destructor TStartButton.Destroy;
Begin
  inherited Destroy;
End;

Procedure TStartButton.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TStartButton.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TStartButton.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TStartButton.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

Procedure TStartButton.OpenStartMenu;
Begin
 If not IsWindowVisible(Findwindow('BaseBar','')) then
 SendMessage(GetDesktopWindow,WM_SYSCOMMAND,SC_TASKLIST,0);
End;

Procedure TStartButton.CloseStartMenu;
Begin
 If IsWindowVisible(Findwindow('BaseBar','')) then
 SendMessage(GetDesktopWindow,WM_SYSCOMMAND,SC_TASKLIST,0);
End;

constructor TTaskBar.Create;
Begin
  inherited Create;
  FHandle:=FindWindow('Shell_TrayWnd', '');
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);
  FTrayNotify:=tTrayNotify.Create;
  FQuickLaunch:=tQuickLaunch.Create;
  FAppSwitchBar:=tAppSwitchBar.Create;
  FStartButton:=TStartButton.Create;
End;

destructor TTaskBar.Destroy;
Begin
  FTrayNotify.Free;
  FQuickLaunch.Free;
  FAppSwitchBar.Free;
  FStartButton.Free;
  inherited Destroy;
End;

Procedure TTaskBar.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TTaskBar.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Function  TTaskBar.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TTaskBar.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

Function TTaskBar.GetAutoHide:Boolean;
var
  ABData: TAppBarData;
begin
  ABData.cbSize := SizeOf(ABData);
  ABData.hWnd :=FHandle;
  Result := ((SHAppBarMessage(ABM_GETSTATE, ABData) and ABS_AUTOHIDE) = ABS_AUTOHIDE);
end;

Function TTaskBar.GetAlwaysOnTop:Boolean;
var
  ABData: TAppBarData;
begin
  ABData.cbSize := SizeOf(ABData);
  ABData.hWnd :=FHandle;
  Result := ((SHAppBarMessage(ABM_GETSTATE, ABData) and ABS_ALWAYSONTOP) =  ABS_ALWAYSONTOP);
end;

constructor TDesktop.Create;
Begin
  inherited Create;
  FIconVisible:=True;
  FHandle:=FindWindow('Progman','Program Manager');
  FEnabled:=IsWindowEnabled(FHandle);
  FVisible:=IsWindowVisible(FHandle);

  FCanvas:=tCanvas.Create;
  FLVHandle :=(FindWindowEx( FindWindowEx(FHandle,0,'SHELLDLL_DefView',''),0 ,'SysListView32',''));
  FArrangeIcon := aisLeft;

  FIconTextBG:=ListView_GetTextBkColor(FLVHandle); 
  FIconText:=ListView_GetTextColor(FLVHandle); 
  FIconVisible:=iswindowVisible(FLVHandle);
End;

destructor TDesktop.Destroy;
Begin
  FCanvas.Free;
  inherited Destroy;
End;

Procedure TDesktop.SetEnabled(Value:Boolean);
Begin
 If Value<>FEnabled then
 Begin
  FEnabled:=Value;
  EnableWindow(FHandle,Value);
 End;
End;

Procedure TDesktop.SetVisible(Value:Boolean);
Begin
 If Value<>FVisible then
 Begin
  FVisible := Value;
  If Not Value then
   ShowWindow(Fhandle,SW_HIDE) else
   ShowWindow(Fhandle,SW_RESTORE);
 End;
End;

Procedure TDesktop.SetIconVisible(Value:Boolean);
Begin
 If Value<>FIconVisible then
 Begin
  FIconVisible := Value;
  If Not Value then
   ShowWindow(FLVhandle,SW_HIDE) else
   ShowWindow(FLVhandle,SW_RESTORE);
 End;
End;

Procedure TDesktop.TransparentIconBG;
Begin
 SetIconTextBG($FFFFFFFF);
End;

Function  TDesktop.GetEnabled:Boolean;
Begin
 Result:=IsWindowEnabled(FHandle);FEnabled:=Result;
End;

Function  TDesktop.GetVisible:Boolean;
Begin
 Result:=IsWindowVisible(FHandle);FVisible:=Result;
End;

{
Procedure TDesktop.SetArrangeIcon(Value:TArrangeIconStyle);
Begin
 If FArrangeIcon<>Value then
 begin
  FArrangeIcon:=Value;
  If Value=aisLeft then
   ListView_Arrange(FLVHandle,LVA_ALIGNRIGHT) else
  If Value=aisRight then
   ListView_Arrange(FLVHandle,LVA_ALIGNRIGHT) else
  If Value=aisTop then
   ListView_Arrange(FLVHandle,LVA_ALIGNTOP) else
  If Value=aisBottom then
   ListView_Arrange(FLVHandle,LVA_ALIGNBOTTOM) else
  If Value=aisDefault then
   ListView_Arrange(FLVHandle,LVA_DEFAULT) else
  If Value=aisSnapToGrid then
   ListView_Arrange(FLVHandle,LVA_SNAPTOGRID);
 end;
 Refresh;
End;
 }
Procedure TDesktop.Refresh;
Begin
 SendMessage(FHandle,WM_COMMAND,$A065,0);
End;

procedure TDesktop.SetIconTextBG(Value:tColor);
Begin
 If Value<>FIconTextBG then
 begin
  FIconTextBG:=Value;
  ListView_SetTextBkColor(FLVHandle, Value);
  SendMessage(FLVHandle,WM_PAINT,0,0);
 End;
End;


procedure TDesktop.SetIconText(Value:tColor);
Begin
 If Value<>FIconText then
 begin
  FIconText:=Value;
  ListView_SetTextColor(FLVHandle, Value);
  ListView_RedrawItems(FLVHandle,0,ListView_GetItemCount(FLVHandle));
 End;
End;

Procedure TDesktop.LockCanvas;
Begin
 FDC:=GetDC(0);
 FCanvas.Handle:=FDC;
End;

Procedure TDesktop.UnLockCanvas;
Begin
 FCanvas.Handle:=0;
 ReleaseDC(0,FDC);
End;

Constructor TDesktopControl.create(AOwner:TComponent);
Begin
 inherited Create(AOwner);
 FTaskBar:=tTaskBar.Create;
 FDesktop:=tDesktop.Create;
End;


procedure TDesktopControl.Loaded;
begin
 inherited Loaded;
 if not (csDesigning in ComponentState) then
 Begin
 End;
end;

Destructor TDesktopControl.destroy;
Begin
 FTaskBar.Free;
 FDesktop.Free;
 inherited destroy;
End;


procedure Register;
begin
  RegisterComponents('Jazarsoft', [TDesktopControl]);
end;

end.
 