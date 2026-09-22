unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, ExtCtrls, sSplitter, StdCtrls, sButton,
  sMemo, sPanel, sListView, sTabControl, ActnList, md5hash2,
  Menus, OleCtrls, SHDocVw, Buttons, sSpeedButton, acAlphaHints, mmsystem, MSHTML, inifiles,
  ExtDlgs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdMultipartFormData,
  acProgressBar, acPNG, ImgList;

type
  TForm7 = class(TForm)
    sTabControl1: TsTabControl;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sSplitter1: TsSplitter;
    chat: TsMemo;
    sButton1: TsButton;
    send: TsMemo;
    ActionList1: TActionList;
    create_conf: TAction;
    new_msg: TAction;
    presence: TAction;
    send_msg: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    create_chat: TAction;
    nicknames: TPopupMenu;
    WebBrowser1: TWebBrowser;
    WebBrowser2: TWebBrowser;
    load_smiles: TAction;
    tray_flash: TAction;
    sSpeedButton1: TsSpeedButton;
    niks_list: TAction;
    BalloonHint1: TBalloonHint;
    Memo1: TMemo;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    sSpeedButton2: TsSpeedButton;
    N20: TMenuItem;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    SaveDialog1: TSaveDialog;
    sSpeedButton4: TsSpeedButton;
    conf_close: TAction;
    confs: TPopupMenu;
    sSpeedButton8: TsSpeedButton;
    Splitter1: TSplitter;
    sSpeedButton9: TsSpeedButton;
    body_load: TAction;
    N21: TMenuItem;
    sSpeedButton10: TsSpeedButton;
    sSpeedButton11: TsSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    IdHTTP1: TIdHTTP;
    Image1: TImage;
    sSpeedButton12: TsSpeedButton;
    conferenceusers: TListView;
    ImageList1: TImageList;
    update_users_list: TAction;
    procedure create_confExecute(Sender: TObject);
    procedure new_msgExecute(Sender: TObject);
    procedure presenceExecute(Sender: TObject);
    procedure send_msgExecute(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sTabControl1Change(Sender: TObject);
    procedure conferenceusersDblClick(Sender: TObject);
    procedure create_chatExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure NickClicked(Sender: TObject);
    procedure ConfClose(Sender: TObject);
    procedure ConfClose2(conf: string);
    procedure chatChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure load_smilesExecute(Sender: TObject);
    procedure WebBrowser2TitleChange(ASender: TObject; const Text: WideString);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure tray_flashExecute(Sender: TObject);
    procedure sendMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sendChange(Sender: TObject);
    procedure conferenceusersMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sendClick(Sender: TObject);
    procedure sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sPageControl1Change(Sender: TObject);
    procedure niks_listExecute(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure conf_closeExecute(Sender: TObject);
    procedure sSpeedButton8Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sSpeedButton9Click(Sender: TObject);
    procedure body_loadExecute(Sender: TObject);
    procedure N21Click(Sender: TObject);
    Procedure WMMove(Var Message : TWMMove); message WM_Move;
    procedure sSpeedButton10Click(Sender: TObject);
    procedure conferenceusersClick(Sender: TObject);
    procedure update_users_listExecute(Sender: TObject);

  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    snd_off, form7_pos_flag : bool;
  end;

var
  Form7: TForm7;
  conference : tmemo;
  nicks : tmemo;
  HookID: THandle;
  msg_body_flag: bool;
  enter_off : bool=false;
  content : string;
  Range: IHTMLTxtRange;
  body_loaded : bool=false;
  first_body_loaded : bool=false;
  allmsg : integer=0;

implementation

uses Unit8, Unit1, Unit6, ActiveX, ComObj, WbPopup, unit10, Unit3;

{$R *.dfm}


function ReadIni(file_name, ASection, AString : String) : String;
var
sIniFile: TIniFile;
sPath : String[60];
begin
sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\'+file_name+'.ini');
Result := sIniFile.ReadString(ASection, AString, '');
sIniFile.Free;
end;

procedure WriteIni(file_name, ASection, AString, AValue : String);
var
sIniFile: TIniFile;
sPath : String[60];
begin
sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\'+file_name+'.ini');
sIniFile.WriteString(ASection, AString, AValue);
sIniFile.Free;
end;

Procedure TForm7.WMMove(Var Message : TWMMove);
begin
  if form7_pos_flag then
  begin
  writeini ('options', 'conf_form', 'top', inttostr(form7.Top));
  writeini ('options', 'conf_form', 'left', inttostr(form7.Left));
  end;
end;


procedure TForm7.conf_closeExecute(Sender: TObject);
var conf_menu : Tmenuitem;
i : integer;
begin
confs.Items.Clear;
for i := 0 to sTabControl1.Tabs.Count - 1 do
begin
  conf_menu := Tmenuitem.Create (send);
  conf_menu.Caption := sTabControl1.Tabs.Strings[i];
  conf_menu.OnClick := ConfClose;
  confs.Items.Insert(0, conf_menu);
end;
confs.Popup(form7.Left+form7.width-20,form7.Top+form7.height-135);
end;

procedure TForm7.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with params do
  begin
    ExStyle := ExStyle or WS_EX_APPWINDOW;
    sleep (10);
  end;
end;

//Звук сообщения групчата
procedure MsgSnd;
var snddir : string;
begin
if (form7.snd_off = false) then
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\group.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
form7.snd_off := false;
end;
end;

function SetCaretPosition(memo:TMemo; x,y:integer) : bool;
var i:integer;
begin
  i := SendMessage(memo.Handle, EM_LINEINDEX, y, 0) + x;
  SendMessage(memo.Handle, EM_SETSEL, i, i);
  result := true;
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

//функция доступа к дочерным memo
function GetMemoByName(Owner : TComponent; AName : string) : Tmemo;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is Tmemo) then Exit(Owner.Components[i] as Tmemo);
  end;
end;

//Проверка существования дочерных memo
function ExistMemoByName(Owner : TComponent; AName : string) : Bool;
var
  i: Integer;
begin
  result := false;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      result := true;
  end;
end;

//функция существования дочерной формы
function ExistFormByName(Owner : TComponent; AName : string) : Bool;
var
  i: Integer;
begin
  result := false;
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      result := true;
  end;
end;

procedure TForm7.body_loadExecute(Sender: TObject);
var header, body_text, footer, conf, homedir : string;
begin

 homedir := ExtractFilePath(ParamStr(0));

 try
 if sTabControl1.TabIndex >= 0 then
 conf := sTabControl1.Tabs.Strings[sTabControl1.TabIndex];
 except
 end;

      header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+
      '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">'+
      '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />'+
      '<title>Lamp IM | Чат '+conf+'</title>'+
      '<link rel="stylesheet" href="'+homedir+'skins\\chat\\style.css" type="text/css" />'+
      '<script language="JavaScript">'+Memo1.Text+'</script>'+
      '</head><body onload="javascript:window.scrollTo(0,100000); ">';
      footer := '</body></html>';
      //Загружаем страницу в Веббраузер
      WB_LoadHTML(WebBrowser1,header+footer);
end;

procedure TForm7.chatChange(Sender: TObject);
var i : integer;
conf : string;
header, body_text, footer, homedir : string;
document: IHTMLDocument2;
begin

 spanel1.Enabled := true;
 conferenceusers.Enabled := true;
 homedir := ExtractFilePath(ParamStr(0));

 if (Memo1.Text = '') then Memo1.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+'skins\chat\js.js');

 try
    if (sTabControl1.Tabs.Count >= 0) and (sTabControl1.TabIndex <> -1) then
    conf := sTabControl1.Tabs.Strings[sTabControl1.TabIndex];
 except

 end;

 if chat.Tag = 0 then body_text := chat.Lines.Strings[chat.Lines.Count-1];

 if chat.Tag = 1 then
 begin
   body_text := chat.text;
 end;

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

 if chat.Tag = 1 then
 begin
      header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+
      '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">'+
      '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />'+
      '<title>Lamp IM | Чат '+conf+'</title>'+
      '<link rel="stylesheet" href="'+homedir+'skins\\chat\\style.css" type="text/css" />'+
      '<script language="JavaScript">'+Memo1.Text+'</script>'+
      '</head><body onload="javascript:window.scrollTo(0,100000); ">';
      footer := '</body></html>';

      //body_text := StringReplace(body_text, '', '');

      //Загружаем страницу в Веббраузер
      content := header+body_text+footer;
      WB_LoadHTML(WebBrowser1,content);
      chat.Tag := 1;
 end;

  //Загружаем построчно в браузер

try
 if chat.Tag = 0 then
  begin
  Range := ((WebBrowser1.Document as IHTMLDocument2).body as IHTMLBodyElement).createTextRange;
  Range.collapse(False);
  Range.pasteHTML(body_text);
  end;
finally
end;

if chat.Tag = 1 then chat.Tag := 0;

//прокручиваем в низ
document := webBrowser1.Document as IHTMLDocument2;
if Assigned(document) then
document.parentWindow.scrollBy(0,+1000000);


if not form7.Active then
begin

  if not form1.presence_incom_flag then
  begin
    //Анимация иконки
    form1.TrayIcon1.Animate := true;
    flashwindow (form7.Handle, true);
    //звук сообщения в новом процессе
    if form1.N8.Checked then createthread(nil,128,@MsgSnd,self,0,h1);
  end;

end;

end;

procedure TForm7.create_chatExecute(Sender: TObject);
begin
try
if conferenceusers.ItemIndex <> -1 then
begin
form1.groupchat_jid := sTabControl1.Tabs.Strings[sTabControl1.TabIndex] +'/'+conferenceusers.Items[conferenceusers.ItemIndex].Caption;
form1.ActionList1.Actions[0].Execute;
end;
finally

end;

end;

procedure TForm7.create_confExecute(Sender: TObject);
var conf_name, user_nick : string;
begin
  conf_name := Lowercase(form8.sComboBox1.Text);
  user_nick := form8.sComboBox3.Text;

  form1.JabberClient1.SendStr('<presence to="'+conf_name+'/'+user_nick+'" >'+
  '<status>'+form1.sLabel1.Caption+'</status><priority>0</priority></presence>');

  if not ExistMemoByName(sTabControl1, 'conf'+md5 (conf_name))  then
  begin
    form7.sTabControl1.Tabs.Add(conf_name);
    conference := tmemo.Create(sTabControl1);
    conference.Parent := sTabControl1;
    conference.Visible := false;
    conference.ScrollBars := ssBoth;
    conference.Name := 'conf'+md5 (conf_name);
    conference.Text := '';
  end
  else form7.Show;

end;

procedure TForm7.FormActivate(Sender: TObject);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caNone;
form7.Hide;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
ActionList1.Actions[5].Execute;
try
form7.height := strtoint(readini ('options', 'conf_form', 'height'));
form7.width := strtoint(readini ('options', 'conf_form', 'width'));
form7.Top := strtoint(readini ('options', 'conf_form', 'top'));
form7.Left := strtoint(readini ('options', 'conf_form', 'left'));
form7_pos_flag := true;
finally

end;
end;

procedure TForm7.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.FormResize(Sender: TObject);
begin
sSpeedButton8.left := form7.Width - 74;
sSpeedButton2.left := form7.Width - 153;
Edit1.Width := form7.Width - 195;

  if form7_pos_flag then
  begin
    writeini ('options', 'conf_form', 'height', inttostr(form7.height));
    writeini ('options', 'conf_form', 'width', inttostr(form7.width));
  end;

end;

procedure TForm7.FormShow(Sender: TObject);
begin

  if first_body_loaded = false then
  begin
    ActionList1.Actions[9].Execute;
    first_body_loaded := true;
  end;

  if not form1.JabberClient1.Connected then
  begin
    sPageControl1.Enabled := false;
    sButton1.Enabled := false;
  end;

  ActionList1.Actions[6].Execute;

end;

procedure TForm7.load_smilesExecute(Sender: TObject);
var
header, body_text, footer, homedir : string;
begin

  //Текущий каталог программы
  homedir := ExtractFilePath(ParamStr(0));

  //Хедер
  header := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+
  '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="lampim">'+
  '<head><meta http-equiv="content-type" content="text/html; charset=windows-1251" />'+
  '<link rel="stylesheet" href="'+homedir+'skins/chat/style.css" type="text/css" />'+
  '</head><body onload="javascript:window.scrollTo(0,0);">'+
  '<script language="JavaScript"> function smile (a) {document.title=a;}</script>';

  //футер
  footer := '</div></body></html>';

//  body_text := '<a onclick="smile('':-)'')" href="#"><img src="'+homedir+'smiles/standart/smile.gif" width="21" height="25" alt=":-)" border="0"></a>';

  //Парсим смайлы
  body_text := smile_ ('', false);

  //Грузим страницу в браузер
  WB_LoadHTML(WebBrowser2,header+body_text+footer);

  end;

procedure TForm7.N10Click(Sender: TObject);
begin
//Отнять права модератора
N20.Click;
end;

procedure TForm7.N12Click(Sender: TObject);
begin
N20.Click;
end;

procedure TForm7.N14Click(Sender: TObject);
begin
N20.Click;
end;

procedure TForm7.N15Click(Sender: TObject);
begin
//Дать голос  (participant)
if (conferenceusers.ItemIndex <> -1 ) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="participant"></item></query></iq>');
  end;
end;

procedure TForm7.N16Click(Sender: TObject);
begin
//Дать права модератора
if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="moderator"></item></query></iq>');
  end;
end;

procedure TForm7.N17Click(Sender: TObject);
begin
//Дать права администратора
if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="admin"></item></query></iq>');
  end;
end;

procedure TForm7.N18Click(Sender: TObject);
begin
//Дать права владельца
if (conferenceusers.ItemIndex <> -1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="owner"></item></query></iq>');
  end;
end;

procedure TForm7.N1Click(Sender: TObject);
begin
  if (conferenceusers.ItemIndex <>-1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    form10.ActionList1.Actions[2].Execute;
    form10.sPageControl1.TabIndex := 0;
    form10.sButton1.Visible := false;
    form10.sButton2.Visible := false;
    form10.sButton3.Visible := false;
    form10.sButton5.Visible := false;
    form10.Image1.Enabled := false;
    form1.pub_vcard_view := true;
    form1.pub_vcard_jid := sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+'/'+
    conferenceusers.Items[conferenceusers.ItemIndex].Caption;
    form10.ActionList1.Actions[0].Execute;
  end;
end;

procedure TForm7.N20Click(Sender: TObject);
begin
//Дать права учасника
if (conferenceusers.ItemIndex <>-1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="member"></item></query></iq>');
  end;
end;

procedure TForm7.N21Click(Sender: TObject);
var i : integer;
begin
  if (conferenceusers.ItemIndex <>-1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    randomize;
    i := random (777);
    if form1.jabberclient1.Connected then
    begin
      form1.jabberclient1.SendStr('<iq type="get" from="'+form1.jabberclient1.JID+'@'+form1.jabberclient1.JabberServer+'/'+form1.jabberclient1.Resources+'" to="'
      +sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+'/'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+'" id="'+inttostr (i)+'"><query xmlns="jabber:iq:version"/></iq>');
      form1.get_version_flag := true;
    end;
  end;
end;

procedure TForm7.N2Click(Sender: TObject);
begin
ActionList1.Actions[4].Execute;
end;

procedure TForm7.N4Click(Sender: TObject);
var reasone : string;
begin
if (conferenceusers.ItemIndex <>-1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
    if inputquery ('Кик', 'Причина:', reasone) then
      begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+'">'+
        '<query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="none"><reason>'+reasone+'</reason></item></query></iq>');
      end;
  end;
end;

procedure TForm7.N8Click(Sender: TObject);
begin
//Визитер
if (conferenceusers.ItemIndex <>-1) and (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  (conferenceusers.Items[conferenceusers.ItemIndex].Caption <> '') then
  begin
        if form1.JabberClient1.Connected then
        form1.JabberClient1.SendStr('<iq type="set" to="'+sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+
        '"><query xmlns="http://jabber.org/protocol/muc#admin"><item nick="'+conferenceusers.Items[conferenceusers.ItemIndex].Caption+
        '" role="visitor"></item></query></iq>');
  end;
end;

procedure TForm7.new_msgExecute(Sender: TObject);
var s, nick_color : string;
begin

if msg_body_flag then
begin
  msg_body_flag := false;
  s := 'groupchat_t1';
end
else
begin
  msg_body_flag := true;
  s := 'groupchat_t2';
end;

if  (form1.topik <> '') then
begin

if ExistMemoByName(sTabControl1, 'conf'+md5 (form1.topik_from))  then
begin
  GetMemoByName(sTabControl1, 'conf'+md5 (form1.topik_from)).Hint := form1.topik;
  if (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = form1.topik_from) then
  edit1.Text := form1.topik;
end;
form1.topik := '';
form1.topik_from := '';
end;

  if form1.conf <> '' then
  begin

    if ExistMemoByName(sTabControl1, 'conf'+md5 (form1.conf))  then
    begin
      if  copy (form1.msg, 1, 3) = '/me' then
      begin
          form1.msg := copy (form1.msg, 4, length (form1.msg));
          GetMemoByName(sTabControl1, 'conf'+md5 (form1.conf)).
          Lines.Add ('<div class="me">*<b>'+form1.user_nick+':</b>'+form1.msg+'</div>');
      end
      else if (pos (form3.Edit1.text, ' '+form1.msg) > 1) or (pos (form8.sComboBox3.text, ' '+form1.msg) > 1) then
      begin
            //Генерируем цвет ника
            nick_color := copy (md5(form1.user_nick), 1,6);
            nick_color := stringreplace (nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

          GetMemoByName(sTabControl1, 'conf'+md5 (form1.conf)).
          Lines.Add ('<div class="vip">['+FormatDateTime('h:m',now)+'] <font color="#'+nick_color+'">'+
          '<b>'+form1.user_nick+':</b></font> '+form1.msg+'</div>');
      end
      else
      begin
            //Генерируем цвет ника
            nick_color := copy (md5(form1.user_nick), 1,6);
            nick_color := stringreplace (nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

          GetMemoByName(sTabControl1, 'conf'+md5 (form1.conf)).
          Lines.Add ('<div class="'+s+'">['+FormatDateTime('h:m',now)+'] <font color="#'+nick_color+'">'+
          '<b>'+form1.user_nick+':</b></font> '+form1.msg+'</div>');
      end;

    if sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = form1.conf then
    chat.Text := GetMemoByName(sTabControl1, 'conf'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Text;

    //chat.Perform(WM_VScroll, SB_BOTTOM, 0);
    end;

  end;

end;


function get_params (str:string): string;
begin
result := copy (str, 0, pos('¦', str)-1);
end;

function del_params (str:string): string;
begin
delete (str, 1, pos('¦', str));
result := str;
end;


procedure TForm7.presenceExecute(Sender: TObject);
var tmp_str, conf_name, status_total, nick_end_options, tmp_nick, tmp : string;
u, i,c, GID, t : integer;
present : bool;
itm : tlistitem;
begin
  // in presence variables -------
  // presence_from - JID
  // presence_nick - ник
  // presence_type - тип
  // presence_conf_status - статус
  // presence_conf_jid -
  // presence_conf_show

  if form1.presence_from <> '' then
  begin

  if ExistMemoByName(sTabControl1, 'conf'+md5 (form1.presence_conf_jid))  then
  begin
    if form1.presence_conf_status <> '' then status_total := '['+form1.presence_conf_status+'] ';
    if form1.presence_conf_show <> '' then status_total := status_total+'['+form1.presence_conf_show+']';
    if (form1.presence_conf_show = '') and (form1.presence_type <> 'unavailable') then status_total := status_total+'[Онлайн] ';
    if (form1.presence_conf_show = '') and (form1.presence_type = 'unavailable') then status_total := status_total+'[Отключен] ';

    if (form1.presence_conf_affiliation <> '') and (form1.presence_conf_affiliation <> 'none') then status_total := status_total + '['+form1.presence_conf_affiliation+'] ';
    if (form1.presence_conf_role <> '') and (form1.presence_conf_affiliation <> 'none') then status_total := status_total + '['+form1.presence_conf_role+'] ';

    GetMemoByName(sTabControl1, 'conf'+md5 (form1.presence_conf_jid)).
    Lines.Add('<div class="conf_status">['+FormatDateTime('h:m',now)+'] '+form1.presence_nick+' '+status_total+'</div>');

    if sTabControl1.Tabs.Strings[sTabControl1.TabIndex] = form1.presence_conf_jid then
    begin
      form7.chat.Text := GetMemoByName(sTabControl1, 'conf'+md5 (form1.presence_conf_jid)).Text;
    end;

  end;

  if form1.presence_type = 'unavailable' then
  begin

       if ExistMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf))  then
       begin
         c := GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Count;
         for I := 0 to c - 1 do
          begin
          if copy (GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Strings[i], 0, length (form1.presence_nick)) = form1.presence_nick then
            begin
              GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Delete(i);
            end;
          end;

  end;


    end
    else
    begin

    if not ExistMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf))  then
    begin
      nicks := tmemo.Create(sTabControl1);
      nicks.Parent :=sTabControl1;
      nicks.Visible := false;
      nicks.ScrollBars := ssBoth;
      nicks.Name := 'nicks'+md5 (form1.presence_conf);
      nicks.Text := form1.presence_nick+'¦'+form1.presence_conf_affiliation+'¦'+form1.presence_conf_role+'¦'+form1.presence_conf_show;
      //conferenceusers.Items.Text := nicks.Text;

    end
      else
        begin
         present := false;
         c := GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Count;
         for I := 0 to c - 1 do
         begin
          tmp_nick := GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Strings[i];
            if copy (tmp_nick, 0, pos ('¦', tmp_nick)-1) = form1.presence_nick then
            begin
              present := true;
              GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines[i] := form1.presence_nick+'¦'+form1.presence_conf_affiliation+'¦'+form1.presence_conf_role+'¦'+form1.presence_conf_show;
            end;
         end;

     if not present then GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.insert (0, form1.presence_nick+'¦'+form1.presence_conf_affiliation+'¦'+form1.presence_conf_role+'¦'+form1.presence_conf_show);


     for t := 0 to GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Count - 1 do
     begin
//       showmessage (GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).Lines.Strings[t]);
     end;


      //Обновление списка юзеров в конфе 2
      //ActionList1.Actions[10].Execute;
      end;

    end; //end presence_type check

  end;

    //showmessage (GetMemoByName(sTabControl1, 'nicks'+md5 (form1.presence_conf)).text);

    //Обновление списка юзеров в конфе
    try
    if (sTabControl1.Tabs.Count > 0) and (sTabControl1.TabIndex<>-1) then
        ActionList1.Actions[10].Execute;
    finally
    end;


form1.presence_incom_flag := false;
end;

procedure TForm7.sButton1Click(Sender: TObject);
begin
  if send.Text <> '' then
  begin
   if form7.sTabControl1.Tabs.Count >= 1 then ActionList1.Actions[3].Execute;
  end;
end;

procedure TForm7.NickClicked(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
begin
menuItem := TMenuItem(sender);
send.Lines.Text := Format('%s%s: ',[send.Lines.Text, menuItem.Caption]);

//перемещаем курсор в конец строки
p.X := length (send.Text);
p.y := send.Lines.Count;
send.CaretPos := p;
send.SetFocus;
menuItem.Free;
end;

procedure TForm7.ConfClose(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
    conf : string;
    i, n : integer;
begin
menuItem := TMenuItem(sender);
conf := Format('%s', [menuItem.Caption]);
if conf <> '' then
begin

   //Удаляем вкладку
    for I := 0 to sTabControl1.Tabs.Count - 1 do
    begin
      if sTabControl1.Tabs.Strings[i] = conf then
      begin

        if sTabControl1.TabIndex <> -1 then
        begin
        if sTabControl1.Tabs.Strings[i] = sTabControl1.Tabs.Strings[sTabControl1.TabIndex] then
        begin
          chat.Lines.Add('<div class="status">Отключен</div>');
          sTabControl1.Tabs.Delete(i);
          sSpeedButton7.Click;
          Edit1.Clear;
          conferenceusers.Clear;
        end
        else
        begin
          sTabControl1.Tabs.Delete(i);
        end;

      end else sTabControl1.Tabs.Delete(i);

        break;
      end;
    end;

        //Поиск ника в массиве конф
        for n := 0 to high (form1.forclose_confs_arr) do
        begin
          if form1.forclose_confs_arr[n, 0] = conf then
          begin
            form1.JabberClient1.SendStr('<presence type="unavailable" to="'+conf+'/'+form1.forclose_confs_arr[n, 1]+'" />');
            break;
          end;
        end;

  //Уничтожение memo конфы
  if ExistMemoByName(sTabControl1, 'conf'+md5 (conf))  then
  GetMemoByName(sTabControl1, 'conf'+md5 (conf)).Destroy;

end;

end;


procedure TForm7.ConfClose2(conf: string);
 var
    p : tpoint;
    i, n : integer;
begin

if conf <> '' then
begin

   //Удаляем вкладку
    for I := 0 to sTabControl1.Tabs.Count - 1 do
    begin
      if sTabControl1.Tabs.Strings[i] = conf then
      begin
        if sTabControl1.Tabs.Strings[i] = sTabControl1.Tabs.Strings[sTabControl1.TabIndex] then
        begin
          chat.Lines.Add('<div class="status">Отключен</div>');
          sTabControl1.Tabs.Delete(i);
          sSpeedButton7.Click;
          Edit1.Clear;
          conferenceusers.Clear;
        end
        else
        begin
          sTabControl1.Tabs.Delete(i);
        end;

        break;
      end;
    end;

        //Поиск ника в массиве конф
        for n := 0 to high (form1.forclose_confs_arr) do
        begin
          if form1.forclose_confs_arr[n, 0] = conf then
          begin
            form1.JabberClient1.SendStr('<presence type="unavailable" to="'+conf+'/'+form1.forclose_confs_arr[n, 1]+'" />');
            break;
          end;
        end;

  //Уничтожение memo конфы
  if ExistMemoByName(sTabControl1, 'conf'+md5 (conf))  then
  GetMemoByName(sTabControl1, 'conf'+md5 (conf)).Destroy;

end;

end;


procedure TForm7.niks_listExecute(Sender: TObject);
var n_menu : Tmenuitem;
i : integer;
begin

nicknames.Items.Clear;
for i := 0 to conferenceusers.Items.Count - 1 do
begin
  n_menu := Tmenuitem.Create (send);
  n_menu.Caption := conferenceusers.Items[i].Caption;
  n_menu.OnClick := NickClicked;
  nicknames.Items.Insert(0, n_menu);
end;

nicknames.Popup(form7.left+20,form7.Top+form7.height-90);
end;

procedure TForm7.sendChange(Sender: TObject);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.sendClick(Sender: TObject);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.sendKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (key = VK_RETURN) and (enter_off = false) then ActionList1.Actions[3].Execute
else enter_off := false;

if (key = VK_F1) then
begin
enter_off := true;
key := 0;
ActionList1.Actions[7].Execute;
end;

if (key = VK_F2) then
begin
enter_off := true;
key := 0;
sSpeedButton9.Click;
end;

if (key = VK_F3) then
begin
enter_off := true;
key := 0;
sSpeedButton5.Click;
end;

if (key = VK_F4) then
begin
enter_off := true;
key := 0;
sSpeedButton6.Click;
end;

if (key = VK_F5) then
begin
enter_off := true;
key := 0;
sSpeedButton4.Click;
end;

if (key = VK_F6) then
begin
enter_off := true;
key := 0;
sSpeedButton3.Click;
end;

if (key = VK_F7) then
begin
enter_off := true;
key := 0;
sSpeedButton7.Click;
end;

if (key = VK_F8) then
begin
enter_off := true;
key := 0;
sSpeedButton10.Click;
end;

end;

procedure TForm7.sendMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.send_msgExecute(Sender: TObject);
begin
form1.JabberClient1.SendMessage(sTabControl1.Tabs.Strings[sTabControl1.TabIndex],'groupchat', send.Text);
send.Clear;
end;

procedure TForm7.sPageControl1Change(Sender: TObject);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.sPageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.sSpeedButton10Click(Sender: TObject);
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
        chat.Lines.Add('<div class="trumb">Успешно загружено: <br /><a target="_blank" href="'+link+'"><img src="http://zokran.co.cc/resize/150/'+hostlink+'" alt="" border="0"></a>'+
        '<br />Нажмите "Отправить" что бы закончить отправку фото.</div>');
       send.Text := send.Text +' '+ link;
      end else
      MessageBox(0, 'Не удалось загрузить файл :( Внимание, файл не должен превышать более 10 Мб и быть формата JPG', 'Ошибка', MB_ICONHAND);

    finally
      FormData.Free;
    end;
  end;
end;

end;

procedure TForm7.sSpeedButton1Click(Sender: TObject);
begin
ActionList1.Actions[7].Execute;
end;

procedure TForm7.sSpeedButton2Click(Sender: TObject);
var i:integer;
begin
  if (sTabControl1.Tabs.Strings[sTabControl1.TabIndex] <> '') and
  form1.JabberClient1.Connected  then
  begin
    randomize;
    i := random (777);
    form1.JabberClient1.SendStr('<message type="groupchat" id="'+inttostr (i)+'" to="'+
    sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+'">'+
    '<subject>'+Edit1.text+'</subject><body>/me изменил тему на: '+Edit1.text+'</body></message>');
  end;
end;

procedure TForm7.sSpeedButton3Click(Sender: TObject);
begin
try
WebBrowser1.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_PROMPTUSER);
except
end;
end;

procedure TForm7.sSpeedButton4Click(Sender: TObject);
begin
try
WebBrowser1.ExecWB(OLECMDID_FIND, OLECMDEXECOPT_PROMPTUSER);
except
end;
end;

procedure TForm7.sSpeedButton5Click(Sender: TObject);
begin
  try
    WebBrowser1.ExecWB(OLECMDID_COPY, OLECMDEXECOPT_PROMPTUSER);
  except
  end;
end;

procedure TForm7.sSpeedButton6Click(Sender: TObject);
var f: TextFile;
begin
  SaveDialog1.FileName :=sTabControl1.Tabs.Strings[sTabControl1.TabIndex]+'_.html';
  if SaveDialog1.Execute then
  begin

    if savedialog1.FileName <> '' then
    begin
      AssignFile(F, savedialog1.FileName);
      Rewrite(f);
      Write(f,chat.Text);
      CloseFile(f);
    end;

  end;

end;

procedure TForm7.sSpeedButton7Click(Sender: TObject);
begin
chat.Clear;
ActionList1.Actions[9].Execute;
end;

procedure TForm7.sSpeedButton8Click(Sender: TObject);
begin
ActionList1.Actions[8].Execute;
end;

procedure TForm7.sSpeedButton9Click(Sender: TObject);
var p : tpoint;
begin
send.Text := '/me '+send.Text;

//перемещаем курсор в конец строки
p.X := length (send.Text);
p.y := send.Lines.Count;
send.CaretPos := p;
send.SetFocus;
end;

procedure TForm7.sTabControl1Change(Sender: TObject);
var u, GID : integer;
itm : tlistitem;
tmp_str, nick_end_options : string;
begin
body_loaded := false;
chat.Tag := 1;
chat.Text := GetMemoByName(sTabControl1, 'conf'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Text;
//conferenceusers.Items := GetMemoByName(sTabControl1, 'nicks'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines;

//Обновление списка юзеров
ActionList1.Actions[10].Execute;

edit1.Text := GetMemoByName(sTabControl1, 'conf'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Hint;
end;

procedure TForm7.tray_flashExecute(Sender: TObject);
begin
form1.TrayIcon1.Animate := false;
form1.TrayIcon1.IconIndex := 0;
end;

procedure TForm7.update_users_listExecute(Sender: TObject);
var u, GID : integer;
itm : tlistitem;
tmp_str, nick_end_options : string;
begin

conferenceusers.Items.Clear;
for u := 0 to GetMemoByName(sTabControl1, 'nicks'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines.Count - 1 dobegin
        nick_end_options := GetMemoByName(sTabControl1, 'nicks'+md5 (sTabControl1.Tabs.Strings[sTabControl1.TabIndex])).Lines.Strings[u];

        if get_params (nick_end_options) <> '' then
        begin
        itm := conferenceusers.Items.Add;
        //Присвоить ник
        itm.Caption := get_params (nick_end_options);
        //Удаляем ник
        nick_end_options := del_params (nick_end_options);
        //Берем affiliation
        tmp_str := get_params (nick_end_options);

        //Проверяем и присваеваем тип прав пользователя
        GID := 777;
        if tmp_str = 'none' then GID := 5;
        if tmp_str = 'owner' then GID := 0;
        if tmp_str = 'admin' then GID := 1;
        if tmp_str = 'member' then GID := 3;

        //Удаляем affiliation
        nick_end_options := del_params (nick_end_options);

        //Берем role
        tmp_str := get_params (nick_end_options);
         if (GID <> 3) and (tmp_str = 'participant') then GID := 4;
        if (GID = 5) and (tmp_str = 'moderator') then GID := 2;
        if tmp_str = 'visitor' then GID := 5;
        itm.GroupID := GID;

        //Удаляем affiliation, получаем show status, устанавливаем соответствующую иконку
        //соответственно статусу
        nick_end_options := del_params (nick_end_options);
        if (nick_end_options = '') or (nick_end_options = 'online') or (nick_end_options = 'avaliable') then itm.ImageIndex := 0;
        if nick_end_options = 'chat' then itm.ImageIndex := 1;
        if nick_end_options = 'away' then itm.ImageIndex := 2;
        if (nick_end_options = 'na') or (nick_end_options = 'xa') then itm.ImageIndex := 3;
        if nick_end_options = 'dnd' then itm.ImageIndex := 4;
        if nick_end_options = 'invisible' then itm.ImageIndex := 5;

        end;

end;



end;

procedure TForm7.conferenceusersClick(Sender: TObject);
begin
//conferenceusers.
//showmessage ();
end;

procedure TForm7.conferenceusersDblClick(Sender: TObject);
begin
ActionList1.Actions[4].Execute;
end;

procedure TForm7.conferenceusersMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
ActionList1.Actions[6].Execute;
end;

procedure TForm7.WebBrowser2TitleChange(ASender: TObject;
  const Text: WideString);
begin
if text <> 'about:blank' then send.Text := send.Text + ' '+Text+' ';
end;

end.
