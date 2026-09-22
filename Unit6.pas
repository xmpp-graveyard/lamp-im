unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ExtCtrls, sBevel, ComCtrls, sPageControl, sMemo,
  sPanel, Menus, OleCtrls, SHDocVw, ActnList, ImgList, Buttons, acPNG,
  sSpeedButton, MMsystem, IdTCPConnection, IdTCPClient, IdMultipartFormData,
  ExtDlgs, IdBaseComponent, IdComponent, IdHTTP, IniFiles;

type
  TForm6 = class(TForm)
    sPanel1: TsPanel;
    sMemo1: TsMemo;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    Memo1: TMemo;
    sPanel2: TsPanel;
    sButton1: TsButton;
    WebBrowser1: TWebBrowser;
    WebBrowser2: TWebBrowser;
    ActionList1: TActionList;
    smiles: TAction;
    ImageList1: TImageList;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    tray_flash: TAction;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    sSpeedButton8: TsSpeedButton;
    sSpeedButton9: TsSpeedButton;
    IdHTTP1: TIdHTTP;
    OpenPictureDialog1: TOpenPictureDialog;
    BalloonHint1: TBalloonHint;
    Memo2: TMemo;
    procedure sButton1Click(Sender: TObject);
    procedure sMemo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure smilesExecute(Sender: TObject);
    procedure WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure tray_flashExecute(Sender: TObject);
    procedure sMemo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure WebBrowser1Visible(ASender: TObject; Visible: WordBool);
    procedure sPageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sSpeedButton8Click(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);

  private
    { Private declarations }
     procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    enter_send : bool;

    //Popup wnd
    popup_text:String;
    popup_font_color:TColor;
    popup_wnd_color:TColor;
    Procedure SwowPopupWnd (text:string);
  end;

var
  Form6: TForm6;
  h1:cardinal;
  body_text : string;

implementation

uses MSHTML, ActiveX, ComObj, Unit1, Unit9, WbPopup, Unit3;

{$R *.dfm}

procedure TForm6.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with params do
    ExStyle := ExStyle or WS_EX_APPWINDOW;
end;

function ReadIni(file_name, ASection, AString : String) : String;
var
sIniFile: TIniFile;
sPath : String[60];
begin
sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\'+file_name+'.ini');
Result := sIniFile.ReadString(ASection, AString, '');
sIniFile.Free;
end;


//Функция загрузки HTML кода в TWebBrowser
procedure WB_LoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
   Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

//Звук сообщения
procedure MsgSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\msg.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

function compile_body (body_text:string):string;
var homedir, header , footer: string;
begin
  homedir := ExtractFilePath(ParamStr(0));
  header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+
  '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">'+
  '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />'+
  '<title>Lamp IM | Чат</title>'+
  '<link rel="stylesheet" href="'+homedir+'skins/chat/style.css" type="text/css" />'+
  '</head><body onload="javascript:window.scrollTo(0,100000);">';
  footer := '</body></html>';
  result := header+body_text+footer;
end;

//Функция отображения всплывающих окон
procedure TForm6.SwowPopupWnd (text:string);
var
  ShellHandle:THandle;
  Rect:TRect;
  ActiveWnd:THandle;
begin
  form9.Label1.Caption := text;
  ActiveWnd:=GetActiveWindow;
  //Ищем "окошко с часиками"
  ShellHandle := FindWindow('Shell_TrayWnd', nil);
  if ShellHandle = 0 then
    exit;
    GetWindowRect(ShellHandle, Rect);
    form9.Left:=Screen.Width-form9.Width-1;
    form9.Top:=Screen.Height-form9.Height-31;
//    ShowWindow(form9.Handle,SW_SHOWNOACTIVATE);
    form9.Show;
    SetActiveWindow(ActiveWnd);

    form6.timer1.Enabled := true;
end;

//Скрыть всплывающее окно
procedure HidePopupWnd;
begin
form9.Hide;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
HidePopupWnd;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin

end;

//функция доступа к дочерным формам
function GetFormByName(Owner : TComponent; AName : string) : TForm;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is TForm) then Exit(Owner.Components[i] as TForm);
  end;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.FormClick(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  enter_send := true;
  ActionList1.Actions[0].Execute;
end;

procedure TForm6.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.FormResize(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
sMemo1.Focused;
ActionList1.Actions[1].Execute;
end;

//Функция парсинга смайлов
//flag_type - true = замена текстовых смайлов на ссылки
//flag_type - false = создание сылок на смайлы
function smile_ (text : string; flag_type : bool) : string;
var
  f: TextFile; // файл
  buf: string; // буфер для чтения из файла

  f2: TextFile; // файл
  buf2, homedir: string; // буфер для чтения из файла

  smiles : tListBox;
  smiles_files : tListBox;

  i : integer;
  tmpstr : string;
begin
homedir := ExtractFilePath(ParamStr(0));
smiles := tListBox.Create(form6);
smiles.Name := 'allsmiles';
smiles.Parent := form6;
smiles.Visible := false;

smiles_files := tListBox.Create(form6);
smiles_files.Name := 'smilesfiles';
smiles_files.Parent := form6;
smiles_files.Visible := false;

AssignFile(f, ExtractFilePath(ParamStr(0))+'smiles\standart\smiles.dat');
AssignFile(f2, ExtractFilePath(ParamStr(0))+'smiles\standart\files.dat');
Reset(f); // открыть для чтения
Reset(f2); // открыть для чтения

// чтение из файла
while not EOF(f) do
  begin
    readln(f, buf); // прочитать строку из файла
    smiles.items.Add(buf); // добавить строку
  end;

// чтение из файла
while not EOF(f2) do
  begin
    readln(f2, buf2); // прочитать строку из файла
    smiles_files.items.Add(buf2);
  end;

CloseFile(f);
CloseFile(f2);

if flag_type then
begin
  if smiles_files.items.Count = smiles.items.Count then
  begin
      for i := 0 to smiles.items.Count - 1 do
      begin
          text := StringReplace(text, smiles.items.Strings[i], '<img align="middle" src="'+homedir+'smiles\standart\'+smiles_files.items.Strings[i]+'" alt="" border="0">', [rfReplaceAll, rfIgnoreCase]);
      end;

  end
  else showmessage ('Неверная конртрольная сума smiles/standart/smiles.dat <> smiles/standart/files.dat');

  result := text;

end
else
  begin
    if smiles_files.items.Count = smiles.items.Count then
    begin
        for i := 0 to smiles.items.Count - 1 do
        begin
            if tmpstr <> smiles_files.items.Strings[i] then
            text := text + '<a onclick="smile('''+smiles.items.Strings[i]+''')" href="#"><img src="'+homedir+'smiles/standart/'+smiles_files.items.Strings[i]+'" alt="" border="0"></a>';
            tmpstr := smiles_files.items.Strings[i];
        end;
    end
    else showmessage ('Неверная конртрольная сума smiles/standart/smiles.dat <> smiles/standart/files.dat');

    result := text;

  end;

smiles.Destroy;
smiles_files.Destroy;
end;

procedure TForm6.Memo1Change(Sender: TObject);
var i : integer;
Range: IHTMLTxtRange;
header, footer, homedir : string;
document: IHTMLDocument2;
begin
//Берем сообщение
body_text := Memo1.text;

//правим некоторые смайлы
body_text := stringreplace (body_text, '&amp;', '&', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&gt;', '>', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&copy;', '©', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&trade;', '™', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&bdquo;', '"', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&ldquo;', '"', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '&apos;', '''', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, ':'')', ':\'')', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, ':''(', ':\''(', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, ':-\', ':-\\', [rfReplaceAll, rfIgnoreCase]);
body_text := stringreplace (body_text, '\m/', '\\m/', [rfReplaceAll, rfIgnoreCase]);



//Заменяем текстовые смайлы на путь
body_text := smile_ (body_text, true);

if memo1.Tag = 0 then
begin

//Загружаем тело страницы в Веббраузер
WB_LoadHTML(WebBrowser1,compile_body(body_text));

memo1.Tag := 1;
end;

//Загружаем построчно в браузер
Range := ((WebBrowser1.Document as IHTMLDocument2).body as
IHTMLBodyElement).createTextRange;
Range.collapse(False);
Range.pasteHTML(body_text);
Memo1.Clear;

//прокручиваем в низ
document := webBrowser1.Document as IHTMLDocument2;
if Assigned(document) then
document.parentWindow.scrollBy(0,+1000000);

if not Active then
begin
form1.TrayIcon1.Animate := true;
flashwindow (self.Handle, true);
//звук сообщения в новом процессе
if form1.N8.Checked then createthread(nil,128,@MsgSnd,self,0,h1);
end;
end;

procedure TForm6.sButton1Click(Sender: TObject);
var JID, me, msg : string;
begin
//Отправка сообщения
if (sMemo1.Text <> '') and (sMemo1.Text <> ' ') then
begin
me := 'Я';
if form3.Edit1.Text <> '' then me := form3.Edit1.Text;
JID := GetFormByName (owner, GetNamePath).Hint;
form1.JabberClient1.SendMessage(JID, 'chat', sMemo1.Text);

//екранируем некоторые символы
msg := sMemo1.Text;
msg := stringreplace (msg, '>', '&gt;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '<', '&lt;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '"', '&quot;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '"', '&quot;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '©', '&copy;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '™', '&trade;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '&', '&amp;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '"', '&bdquo;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '"', '&ldquo;', [rfReplaceAll, rfIgnoreCase]);
msg := stringreplace (msg, '''', '&apos;', [rfReplaceAll, rfIgnoreCase]);

Memo1.Lines.Add('<div class="mymsg">['+FormatDateTime('h:m',now)+']<b> '+me +
': </b>'+msg+'</div>');
Memo2.Lines.Add('<div class="mymsg">['+FormatDateTime('h:m',now)+']<b> '+me +
': </b>'+msg+'</div>');
sMemo1.Clear;
end;
end;

procedure TForm6.sMemo1Click(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.sMemo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//Отправка сообщения по нажатию ENTER
if (key = VK_RETURN) then
begin
  if enter_send then sButton1.Click;
end;


if (key = VK_F3) then
begin
key := 0;
sSpeedButton5.Click;
end;

if (key = VK_F4) then
begin
key := 0;
sSpeedButton6.Click;
end;

if (key = VK_F5) then
begin
key := 0;
sSpeedButton9.Click;
end;

if (key = VK_F6) then
begin
key := 0;
sSpeedButton8.Click;
end;

if (key = VK_F7) then
begin
key := 0;
sSpeedButton7.Click;
end;

if (key = VK_F8) then
begin
key := 0;
sSpeedButton4.Click;
end;




end;

procedure TForm6.smilesExecute(Sender: TObject);
var
header, body_text, footer, homedir : string;
begin
  //Текущий каталог программы
  homedir := ExtractFilePath(ParamStr(0));

  header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+
  '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">'+
  '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />'+
  '<link rel="stylesheet" href="'+homedir+'skins/chat/style.css" type="text/css" />'+
  '</head><body onload="javascript:window.scrollTo(0,0);">'+
  '<script language="JavaScript"> function smile (a) {document.title=a;}</script>';
  footer := '</body></html>';

//  body_text := '<a onclick="smile('':-)'')" href="#"><img src="'+homedir+'smiles/standart/smile.gif" width="21" height="25" alt=":-)" border="0"></a>';

  //Парсим смайлы
  body_text := smile_ ('', false);

  WB_LoadHTML(WebBrowser2,header+body_text+footer);
end;

procedure TForm6.sPageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.sSpeedButton1Click(Sender: TObject);
begin
sSpeedButton1.Visible := false;
sSpeedButton2.Visible := true;
enter_send := false;
sMemo1.WantReturns := true;
end;

procedure TForm6.sSpeedButton2Click(Sender: TObject);
begin
sSpeedButton1.Visible := true;
sSpeedButton2.Visible := false;
enter_send := true;
sMemo1.WantReturns := false;
end;

procedure TForm6.sSpeedButton4Click(Sender: TObject);
var
  Response: String;
  FormData: TIdMultiPartFormDataStream;
  S, E: integer;
  link, hostlink: string;
begin
if OpenPictureDialog1.Execute then
begin

  if (FileExists(OpenPictureDialog1.FileName) = False) then
  begin
    MessageBox(0, 'Файл(ы) не выбран(ы), выберете файл..!!! ', 'Ошибка', MB_ICONHAND);
    Exit;
  end else
  begin
    FormData := TIdMultiPartFormDataStream.Create;
    try
      FormData.AddFormField('upload', 'yes');
      FormData.AddFormField('upload', 'yes');
      FormData.AddFile('F', OpenPictureDialog1.FileName, 'image/jpeg');
      FormData.AddFormField('URLF', '');
      FormData.AddFormField('O', 'yes');
      FormData.AddFormField('M', '640');
      FormData.AddFormField('JQ', '85');
      FormData.AddFormField('J', 'yes');
      FormData.AddFormField('IM', '7');
      FormData.AddFormField('VM', '180');
      FormData.AddFormField('R', '0');
      FormData.AddFormField('VE', 'yes');
      FormData.AddFormField('V', 'zoom');
      FormData.AddFormField('X', '');
      FormData.AddFormField('FS', '');
      IdHTTP1.HandleRedirects := True;
      Response := idHTTP1.Post('http://www.radikal.ru/action.aspx', FormData);
      //[url=http://www.radikal.ru][img]http://s48.radikal.ru/i121/1007/e2/ea464811add5.jpg[/img][/url]
      S := pos('[url=http://www.radikal.ru][img]', Response) + Length('[url=http://www.radikal.ru][img]');;
      E := pos('[/img][/url]', Response);
      link := Copy (Response, S, E - S);
      if link <> '' then
      begin
        hostlink := copy (link, 7, length (link));
        Memo1.Lines.Add('<div class="trumb">Успешно загружено: <br /><a target="_blank" href="'+link+'"><img src="http://zokran.co.cc/resize/150/'+hostlink+'" alt="" border="0"></a>'+
        '<br />Нажмите "Отправить" что бы закончить отправку фото.</div>');
        sMemo1.Text := sMemo1.Text +' '+ link;
      end else
      MessageBox(0, 'Не удалось загрузить файл :( Внимание, файл не должен превышать более 10 Мб и быть формата JPG', 'Ошибка', MB_ICONHAND);

    finally
      FormData.Free;
    end;
  end;
end;
end;

procedure TForm6.sSpeedButton5Click(Sender: TObject);
begin
  try
    WebBrowser1.ExecWB(OLECMDID_COPY, OLECMDEXECOPT_PROMPTUSER);
  except
  end;
end;

procedure TForm6.sSpeedButton6Click(Sender: TObject);
begin
  SaveDialog1.FileName :=form6.Caption+'_.html';
  if SaveDialog1.Execute then
  begin
    if savedialog1.FileName <> '' then
    begin
      Memo2.Lines.SaveToFile(savedialog1.FileName);
    end;
  end;
end;

procedure TForm6.sSpeedButton7Click(Sender: TObject);
begin
Memo1.Clear;
WB_LoadHTML(WebBrowser1,compile_body(''));
end;

procedure TForm6.sSpeedButton8Click(Sender: TObject);
begin
try
WebBrowser1.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_PROMPTUSER);
except
end;
end;

procedure TForm6.sSpeedButton9Click(Sender: TObject);
begin
try
WebBrowser1.ExecWB(OLECMDID_FIND, OLECMDEXECOPT_PROMPTUSER);
except
end;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
HidePopupWnd;
timer1.Enabled := false;
end;

procedure TForm6.tray_flashExecute(Sender: TObject);
begin
form1.TrayIcon1.Animate := false;
form1.TrayIcon1.IconIndex := 0;
end;

procedure TForm6.WebBrowser1Visible(ASender: TObject; Visible: WordBool);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm6.WebBrowser2TitleChange(ASender: TObject;
  const Text: WideString);
begin
if text <> 'about:blank' then sMemo1.Text := sMemo1.Text + ' '+Text+' ';
end;

end.
