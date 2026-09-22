unit Popup;

interface

uses
SysUtils, Classes, Windows, Forms, Controls, StdCtrls, Graphics;

type
  PopupThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure ShowMovingWindow;
  end;

implementation

uses unit6;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure PopupThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ PopupThread }


//Функция отображения всплывающих окон
procedure PopupThread.ShowMovingWindow;
var
 aText:String;
 font_color:TColor;
 wnd_color:TColor;
 ShellHandle:THandle;
  Rect:TRect;
  NeedTop:Integer;
  HintForm:TForm;
  HintLabel:TLabel;
  I: TForm;
{$ifdef intwndproc}
  ActiveWnd:THandle;
{$endif}
 a : integer;
begin

aText:=form6.popup_text;
font_color:=form6.popup_font_color;
wnd_color:=form6.popup_wnd_color;

  //Ищем "окошко с часиками"
  ShellHandle := FindWindow('Shell_TrayWnd', nil);
  if ShellHandle = 0 then
    exit;
  GetWindowRect(ShellHandle, Rect);
  //Создаем форму
  HintForm:=TForm.Create(nil);
  with HintForm do
  begin
    Width:=245;
    Height:=100;
    Color:=wnd_color;
    BorderStyle:=bsToolWindow;
    //Создаём текст
    HintLabel:=TLabel.Create(nil);
    with HintLabel do
    begin
        Parent:=HintForm;
        WordWrap:=true;
        Caption:=' '+Trim(aText)+' ';
        Align:=alClient;
        Layout:=tlCenter;
        Alignment:=taCenter;
        font.Color :=font_color;
    end;

    AlphaBlend:=true;
    AlphaBlendValue:=220;
{$ifdef intwndproc}
    ActiveWnd:=GetActiveWindow;
{$endif}
    ShowWindow(Handle,SW_SHOWNOACTIVATE);
{$ifdef intwndproc}
    SetActiveWindow(ActiveWnd);
{$endif}
    Left:=Screen.Width-Width-5;
    Top:=Screen.Height-30;
    //Выезжаем вверх
    NeedTop:=Rect.Top-Height;
    while Top>NeedTop do
    begin
      Top:=Top-2;
      Repaint;
    end;

    //Выезжаем вниз
//    NeedTop:=Screen.Width-20;
  //  while Top<NeedTop do
    //begin
      //Top:=Top+2;
     // Repaint;

  //  end;
//    HintLabel.Free;
  //  Free;
  end;

end;

procedure PopupThread.Execute;
begin
  { Place thread code here }
Synchronize(ShowMovingWindow);
end;

end.
