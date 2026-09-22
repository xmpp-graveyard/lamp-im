unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, sSkinProvider, Jabber, ActnList, ImgList, ExtCtrls,
  sPanel, ComCtrls, sListView, jpeg, XPMan, Menus, acPNG, GIFImg, StdCtrls,
  sButton, Buttons, sBitBtn, GmXml, md5hash2, sLabel, sMemo, ExtDlgs, sDialogs,
  Math, EncdDecd, registry, mmsystem, IniFiles, Sockets, shellapi,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  acProgressBar, sHintManager, acAlphaHints;

type
  TForm1 = class(TForm)
    JabberClient1: TJabberClient;
    ActionList1: TActionList;
    LampList1: TImageList;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    XPManifest1: TXPManifest;
    TrayIcon1: TTrayIcon;
    TrayMenu1: TPopupMenu;
    rootMenu1: TPopupMenu;
    StatusMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    TrayImageList1: TImageList;
    N4: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    XML1: TMenuItem;
    sPanel3: TsPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    sBitBtn1: TsBitBtn;
    N16: TMenuItem;
    N18: TMenuItem;
    groupchat_window: TAction;
    sPanel4: TsPanel;
    Image1: TImage;
    sLabel1: TsLabel;
    roster_menu: TPopupMenu;
    N19: TMenuItem;
    Vcard1: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    chat_window: TAction;
    sOpenPictureDialog1: TsOpenPictureDialog;
    VCard2: TMenuItem;
    load_avatar: TAction;
    req_autorization: TAction;
    autorization: TAction;
    remove_autorize: TAction;
    sListView1: TListView;
    N39: TMenuItem;
    DNBRadio1: TMenuItem;
    sSkinManager1: TsSkinManager;
    acount_chek: TAction;
    sort_contacts: TAction;
    N40: TMenuItem;
    N41: TMenuItem;
    PCGames1: TMenuItem;
    N42: TMenuItem;
    add_invite_item: TAction;
    N43: TMenuItem;
    status_in_confs: TAction;
    IdHTTP1: TIdHTTP;
    RSS1: TMenuItem;
    Timer1: TTimer;
    autorize_and_add: TAction;
    N5: TMenuItem;
    showmain: TAction;
    sProgressBar1: TsProgressBar;
    N6: TMenuItem;
    N7: TMenuItem;
    N17: TMenuItem;
    sHintManager1: TsHintManager;
    loadingbar: TsProgressBar;
    procedure Image2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure InviteConf(Sender: TObject);
    procedure MoveToGroup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure JabberClient1Connect(Sender: TObject);
    procedure JabberClient1ConnectError(Sender: TObject);
    procedure JabberClient1Disconnect(Sender: TObject);
    procedure JabberClient1GetBookMarks(Sender: TObject; BookMarks: string);
    procedure JabberClient1GetRoster(Sender: TObject; RosterList: string);
    procedure N9Click(Sender: TObject);
    procedure JabberClient1IQ(Sender: TObject; XMLMessage: string);
    procedure JabberClient1JabberOnline(Sender: TObject);
    procedure JabberClient1LoginError(Sender: TObject; Error: string);
    procedure JabberClient1Message(Sender: TObject; XMLMessage: string);
    procedure JabberClient1Presence(Sender: TObject; Presence: string);
    procedure JabberClient1ReceiveData(Sender: TObject; SendStr: string);
    procedure JabberClient1SendData(Sender: TObject; SendStr: string);
    procedure N15Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sListView1Click(Sender: TObject);
    procedure sListView1DblClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure groupchat_windowExecute(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure joinconf(Sender: TObject);
    procedure chat_windowExecute(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure sListView1Edited(Sender: TObject; Item: TListItem; var S: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VCard2Click(Sender: TObject);
    procedure load_avatarExecute(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure req_autorizationExecute(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure autorizationExecute(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure remove_autorizeExecute(Sender: TObject);
    procedure Vcard1Click(Sender: TObject);
    procedure DNBRadio1Click(Sender: TObject);
    procedure acount_chekExecute(Sender: TObject);
    procedure sort_contactsExecute(Sender: TObject);
    procedure sListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    Procedure WMMove(Var Message : TWMMove); message WM_Move;
    procedure FormResize(Sender: TObject);
    procedure PCGames1Click(Sender: TObject);
    procedure add_invite_itemExecute(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure roster_menuPopup(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure status_in_confsExecute(Sender: TObject);
    procedure RSS1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure autorize_and_addExecute(Sender: TObject);
    procedure showmainExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure sListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sListView1MouseLeave(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N7771Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    byte_send, byte_recv : integer;
    msg : string;
    user_nick : string;
    conf : string;
    topik : string;
    presence_incom_flag : bool;
    presence_from : string;
    presence_nick : string;
    presence_type : string;
    presence_conf_jid : string;
    presence_conf : string;
    presence_conf_show, presence_conf_status : string;
    presence_conf_affiliation : string;
    presence_conf_role : string;

    invite_popup_flag : bool;

    groupchat_jid : string;
    current_show : string;
    iq_id : string;

    vcard_flag, pub_vcard_view  : bool;
    pub_vcard_jid : string;
    up_vcard_flag : bool;
    get_version_flag : bool;

    topik_from : string;

    new_contact_flag : bool;
    //Переменные групп
    group_update_flag : bool;
    group_jid : string;
    group_id : integer;
    group_name : string;

    conference_list_flag : bool;
    form_pos_flag : bool;
    conference_list_id : string;
    new_contact_nick : string;
    new_contact_jid : string;
    forclose_confs_arr : array of array of string;
    client_online : bool;
    const lamp_version = '0.3';

  end;

var
  Form1: TForm1;
  welcomesnd : bool;
  autorize_JID : string;

  //Флаги
  roster_flag : bool=true;
  roster_rename : bool=false;

implementation

uses Unit3, Unit2, Unit4, Unit5, Unit6, Unit7,
Unit8, ImgSize, Unit11, Unit10, Unit15, Unit13, Unit14, Unit18;

{$R *.dfm}

Function ReadComputerName:string;
var
i:DWORD;
p:PChar;
begin
i:=255;
GetMem(p, i);
GetComputerName(p, i);
Result:=String(p);
FreeMem(p);
end;

function remove_res (jid : string) : string;
begin
if pos ('/', jid) > 1 then
result := copy (jid, 1, pos ('/', jid)-1)
else result := jid;
end;


function toescaping (value : String) : String;
begin
Result := value;
//Result := stringreplace (Result, '>', '&gt;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&', '&amp;',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '<', '&lt;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '"', '&quot;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '"', '&quot;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '©', '&copy;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '™', '&trade;',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '"', '&bdquo;', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '"', '&ldquo;',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '''', '&apos;', [rfReplaceAll, rfIgnoreCase]);
end;

function from_escaping (value : String) : String;
begin
Result := value;
Result := stringreplace (Result, '&gt;', '>',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&amp;', '&', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&lt;', '<', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&quot;', '"', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&copy;', '©', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&trade;', '™',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&bdquo;', '"', [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&ldquo;', '"',  [rfReplaceAll, rfIgnoreCase]);
Result := stringreplace (Result, '&apos;', '''', [rfReplaceAll, rfIgnoreCase]);
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

procedure WriteIni(file_name, ASection, AString, AValue : String);
var
sIniFile: TIniFile;
sPath : String[60];
begin
sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\'+file_name+'.ini');
sIniFile.WriteString(ASection, AString, AValue);
sIniFile.Free;
end;

function ReadINISections(file_name:string; Strings: TStrings) : bool;
var
sIniFile: TIniFile;
sPath : String[60];
begin
sIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\'+file_name+'.ini');
sIniFile.ReadSections('', Strings);
sIniFile.Free;
end;

//Получение инфы по нику
//info_type = [uname, group, groupid, jid]
function nick2info (nick:string; info_type : string) : string;
var str : string;
LB : TlistBox;
I: Integer;
begin
LB := TlistBox.Create (form1);
LB.Parent := form1;
LB.Visible := false;
ReadINISections('rostr', LB.items);
for i := 0 to LB.items.Count - 1 do
begin
application.ProcessMessages;
if readini ('rostr',LB.items.Strings[i],'uname') = nick then
Result := readini ('rostr',LB.items.Strings[i],info_type);
end;
LB.Free;
end;

//Получение инфы по джиду
//info_type = [uname, group, groupid, jid]
function jid2info (JID:string; info_type : string) : string;
var str : string;
LB : TlistBox;
I: Integer;
begin
LB := TlistBox.Create (form1);
LB.Parent := form1;
LB.Visible := false;
ReadINISections('rostr', LB.items);
for i := 0 to LB.items.Count - 1 do
begin
if LB.items.Strings[i] = JID then
Result := readini ('rostr',LB.items.Strings[i],info_type);
application.ProcessMessages;
end;
LB.Free;
end;



//Проверка наличия JID
function JIDexists (JID:string) : bool;
var str : string;
LB : TlistBox;
I: Integer;
begin
LB := TlistBox.Create (form1);
LB.Parent := form1;
LB.Visible := false;
ReadINISections('rostr', LB.items);
for i := 0 to LB.items.Count - 1 do
begin
if AnsiLowerCase(LB.items.Strings[i]) = AnsiLowerCase(JID) then Result := true;
application.ProcessMessages;
end;
LB.Free;
end;

//Добавление пользователей в ростр
function load_rostr (rostr : TListView; reload_rostr: bool) : bool;
var str : string;
LB : TlistBox;
I: Integer;
Item : TlistItem;
begin
LB := TlistBox.Create (form1);
LB.Parent := form1;
LB.Visible := false;
ReadINISections('rostr', LB.items);

for i := 0 to LB.items.Count - 1 do
begin
  //Добавляем контакт в группу
  Item := rostr.Items.Add;
  Item.Caption := readini ('rostr',LB.items.Strings[i],'uname'); // Имя контакта

    try
    Item.ImageIndex := strtoint (readini ('rostr',LB.items.Strings[i],'show'));
    Item.SubItems.Insert(0, readini ('rostr',LB.items.Strings[i],'status'));

    //Сохраняем индекс
    WriteIni('rostr', LB.items.Strings[i], 'index', inttostr(Item.Index));

    Item.GroupID := strtoint(readini ('rostr',LB.items.Strings[i],'groupid'));
    except
    application.ProcessMessages;
    end;

  result := true;
  end;

  LB.Free;

end;

//Обновление ростера по статусам
function update_rostr (rostr : TListView; user_jid:string; only_online:bool) : bool;
var index, i, u : integer;
have_in_rostr : bool;
Item : TlistItem;
jid : string;
begin

  if not only_online then
  begin
      have_in_rostr := false;
      for i := 0 to rostr.Items.Count - 1 do
      begin
        if jid2info (user_jid, 'uname') = rostr.Items[i].Caption then have_in_rostr := true;
        application.ProcessMessages;
      end;

  if not have_in_rostr then
  begin
      //Добавляем контакт в группу
      Item := rostr.Items.Add;
      Item.Caption := readini ('rostr',user_jid,'uname'); // Имя контакта
      try
        Item.ImageIndex := strtoint (readini ('rostr',user_jid,'show'));
        Item.SubItems.Insert(0, readini ('rostr',user_jid,'status'));
        //Сохраняем индекс
        WriteIni('rostr', user_jid, 'index', inttostr(Item.Index));
        Item.GroupID := strtoint(readini ('rostr',user_jid,'groupid'));
      except
      end;

          //Реиндексация онлайн контактов
          for u := 0 to rostr.Items.Count - 1 do
          begin
            application.ProcessMessages;
            jid := nick2info (rostr.Items[u].Caption,'jid');
            if jid <> '' then
            begin
              jid := remove_res (jid);
                try
                  writeini ('rostr',jid,'index', inttostr(rostr.Items[u].Index));
                except
                end;
            end;
          end; //реиндекс. закончена

      result := true;

  end
  else
    begin
      try
        //Чтение индекса контакта
        index := strtoint(readini ('rostr',user_jid,'index'));

        //Удаление оффлайн контакта с ростера
        if readini ('rostr',user_jid,'show') = '6' then
        begin
        rostr.Items[index].Delete;

          //Реиндексация онлайн контактов
          for u := 0 to rostr.Items.Count - 1 do
          begin
            application.ProcessMessages;
            jid := nick2info (rostr.Items[u].Caption,'jid');
            if jid <> '' then
            begin
              jid := remove_res (jid);
              try
              writeini ('rostr',jid,'index', inttostr(rostr.Items[u].Index));
              except
              end;
            end;
          end; //реиндекс. закончена

        result := true;
        end
        else
        begin
          //Обновление статусов
          rostr.Items[index].ImageIndex := strtoint(readini ('rostr',user_jid,'show'));
          rostr.Items[index].SubItems.Text := readini ('rostr',user_jid,'status');
          rostr.Items[index].GroupID := strtoint(readini ('rostr',user_jid,'groupid'));
          result := true;
          application.ProcessMessages;
        end;


      except
      end;

    end;

  end
  else
    begin
      try
        index := strtoint(readini ('rostr',user_jid,'index'));
        rostr.Items[index].ImageIndex := strtoint(readini ('rostr',user_jid,'show'));
        rostr.Items[index].SubItems.Text := readini ('rostr',user_jid,'status');
        rostr.Items[index].GroupID := strtoint(readini ('rostr',user_jid,'groupid'));
        result := true;
        application.ProcessMessages;
      except
      end;
    end;

end;


Procedure TForm1.WMMove(Var Message : TWMMove);
begin
  if form_pos_flag then
  begin
  writeini ('options', 'form', 'top', inttostr(form1.Top));
  writeini ('options', 'form', 'left', inttostr(form1.Left));
  end;
end;

procedure TForm1.InviteConf(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
    conf : string;
    i, n : integer;
begin
i := random (777);
menuItem := TMenuItem(sender);
conf := Format('%s', [menuItem.Caption]);
if conf <> '' then
begin


  if (sListView1.ItemIndex >= 0 ) then
  begin
    if sListView1.Selected.Selected then
    begin
      jabberclient1.SendStr('<message to="'+conf+'" id="inv'+inttostr(i)+'" >'+
      '<x xmlns="http://jabber.org/protocol/muc#user"><invite to="'+
      nick2info (sListView1.Selected.Caption, 'jid')+
      '" /></x></message>');
    end;
  end;

end;
end;



procedure TForm1.MoveToGroup(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
    group : string;
    i, n : integer;
begin
i := random (777);
iq_id := 'grp'+inttostr(i);
menuItem := TMenuItem(sender);
group := Format('%s', [menuItem.Caption]);
if (group <> '') then
begin

  if (sListView1.ItemIndex <> -1 ) then
  begin
    if sListView1.Selected.Selected then
    begin
      if jabberclient1.Connected then
      begin
        group_id := 0;
        group_jid := remove_res(nick2info (sListView1.Selected.Caption, 'jid'));
        group_name := group;

        for n := 0 to sListView1.Groups.Count - 1 do
        begin
         if sListView1.Groups.Items[n].Header = group_name then
           group_id := sListView1.Groups.Items[n].GroupID;
        end;

        if group_id = 0 then
        begin
          jabberclient1.SendStr('<iq type="set" id="grp'+inttostr(i)+'" >'+
          '<query xmlns="jabber:iq:roster">'+
          '<item name="'+nick2info (sListView1.Selected.Caption, 'uname')+
          '" jid="'+group_jid+'" ></item></query></iq>');
          group_update_flag := true;
        end
        else
        begin
          jabberclient1.SendStr('<iq type="set" id="grp'+inttostr(i)+'" >'+
          '<query xmlns="jabber:iq:roster">'+
          '<item name="'+nick2info (sListView1.Selected.Caption, 'uname')+
          '" jid="'+group_jid+'" >'+
          '<group>'+group+'</group></item></query></iq>');
          group_update_flag := true;
        end;

      end;
    end;
  end;


end;
end;

procedure TForm1.joinconf(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
    conf : string;
    i, n : integer;
    nick, tmp_confname, tmp_nick : string;

begin
i := random (777);
menuItem := TMenuItem(sender);
conf := Format('%s', [menuItem.Caption]);
nick := copy (conf, pos ('/', conf)+1, length(conf));
conf := copy (conf, 0, pos ('/', conf)-1);

  if (conf <> '') and (nick <> '') then
  begin
    tmp_confname := form8.sComboBox1.Text;
    tmp_nick := form8.sComboBox3.Text;
    form8.sComboBox1.Text := conf;
    form8.sComboBox3.Text := nick;
    form8.sButton3.Click;
    form8.sComboBox1.Text := tmp_confname;
    form8.sComboBox3.Text := tmp_nick;
  end;

end;


//Звук Запрос авторизации
procedure SubsSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\subscr.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

//Звук Welcome
procedure WellSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\welcome.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

//Звук online
procedure onlineSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\online.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

//Звук Отключения
procedure DissSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\disconnect.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

//Звук ошибка
procedure ErrorSnd;
var snddir : string;
begin
snddir := ExtractFilePath(ParamStr(0))+'sounds\'+readini ('options', 'system', 'sounds')+'\warning.wav';
if fileexists (snddir) then
PlaySound(PChar(snddir), 0, SND_FILENAME);
end;

//Поиск елемента в Listview
function FindListViewItem(lv: TsListView; const S: string; column: Integer): TListItem;
var
  i: Integer;
  found: Boolean;
begin
  Assert(Assigned(lv));
  Assert((lv.viewstyle = vsReport) or (column = 0));
  Assert(S <> '');
  for i := 0 to lv.Items.Count - 1 do
  begin
    Result := lv.Items[i];
    if column = 0 then
      found := AnsiCompareText(Result.Caption, S) = 0
    else if column > 0 then
      found := AnsiCompareText(Result.SubItems[column - 1], S) = 0
    else
      found := False;
    if found then
      Exit;
  end;
  // No hit if we get here
  Result := nil;
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
function GetMenuItemByName(Owner : TComponent; AName : string) : Tmenuitem;
var
  i: Integer;
begin
  AName := AnsiLowerCase(AName);
  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if AnsiLowerCase(Owner.Components[i].Name) = AName then
      if (Owner.Components[i] is Tmemo) then Exit(Owner.Components[i] as TmenuItem);
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

procedure AddColoredLine(ARichEdit: TRichEdit; AText: string; AColor: TColor);
 begin
   with ARichEdit do
   begin
     SelStart := Length(Text);
     SelAttributes.Color := AColor;
     SelAttributes.Size := 8;
     SelAttributes.Name := 'MS Sans Serif';
     Lines.Add(AText);
   end;
 end;

procedure TForm1.acount_chekExecute(Sender: TObject);
begin

//Проверка данных аккаунта
if (form3.sEdit1.Text = '') or (form3.sEdit3.Text = '') or (form3.sEdit2.Text = '') then
begin
form6.SwowPopupWnd ('Введите данные Вашей учетной записи!');
form3.Show;
end
else
begin
JabberClient1.JID := form3.sEdit1.Text;
JabberClient1.Password := form3.sEdit2.Text;
jabberclient1.jabberserver := form3.sEdit3.Text;
JabberClient1.Connect(1);
loadingbar.Visible := true;
end;

end;

procedure TForm1.add_invite_itemExecute(Sender: TObject);
var itm : TmenuItem;
i : integer;
begin
if invite_popup_flag then
begin

for i := 0 to form7.sTabControl1.Tabs.Count - 1 do
begin
  itm := TmenuItem.Create(owner);
  itm.Name := 'menu_'+md5(form7.sTabControl1.Tabs.Strings[i]);
  itm.Caption := form7.sTabControl1.Tabs.Strings[i];
  itm.OnClick := InviteConf;
  roster_menu.Items[6].Insert(0,itm);
end;

invite_popup_flag := false;
end;
end;

procedure TForm1.autorizationExecute(Sender: TObject);
begin

  //Авторизируем
  if sListView1.Selected.Selected then
  begin
    jabberclient1.SendStr('<presence type="subscribed" to="'+
    nick2info (sListView1.Selected.Caption, 'jid')+'" />');
  end;

end;

procedure TForm1.autorize_and_addExecute(Sender: TObject);
var jid_present : bool;
r, j : integer;
begin

     if MessageDlg ('Подтвердить авторизацию от '+autorize_JID+'? ', mtConfirmation, mbYesNo, 1) = mrYes then
     begin

        if sListView1.Items.Count > 0 then
        begin
          for j := 0 to sListView1.Items.Count - 1 do
          begin
            if Lowercase(nick2info (sListView1.Items[j].Caption, 'jid')) =  Lowercase(autorize_JID) then jid_present := true;
          end;
        end;

        if jid_present = false then
        begin
          InputQuery('Добавление нового контакта', 'Введите ник: ', new_contact_nick);
          if new_contact_nick <> '' then
          begin
              randomize;
              r := random (777);
              form1.iq_id := 'nc'+inttostr(r);
              form1.new_contact_flag := true;
              form1.new_contact_jid := autorize_JID;
              form1.new_contact_nick := new_contact_nick;
              form1.JabberClient1.SendStr('<iq type="set" id="nc'+inttostr(r)+'" >'+
              '<query xmlns="jabber:iq:roster">'+
              '<item name="'+new_contact_nick+'" jid="'+autorize_JID+'" />'+
              '</query></iq>');
              sleep (1000);
              jabberclient1.SendStr('<presence type="subscribed" to="'+autorize_JID+'" />');
              form6.SwowPopupWnd ('Авторизация одобрена!');
          end;
        end
          else
          begin
            jabberclient1.SendStr('<presence type="subscribed" to="'+autorize_JID+'" />');
            form6.SwowPopupWnd ('Авторизация одобрена!');
          end;

     end
      else
     begin
      jabberclient1.SendStr('<presence type="unsubscribed" to="'+autorize_JID+'" />');
      form6.SwowPopupWnd ('Авторизация отменена!');
     end;

autorize_JID := '';
end;

procedure TForm1.chat_windowExecute(Sender: TObject);
var JID, JID2 : string;
begin

//if (ExistFormByName (owner, 'Form17')) then showmessage ('yes') else showmessage ('no');

  if (sListView1.ItemIndex >= 0 ) then
  begin
    JID2 := nick2info (sListView1.Selected.Caption, 'jid');
    if pos ('/', JID2) > 0 then
    begin
      JID2 := copy (JID2, 1, pos ('/', JID2)-1);
    end;

    JID := md5(JID2);
    if (ExistFormByName (owner, 'form'+JID) = false) then
    begin
    Form6 := Tform6.Create(application);
    Form6.Name := 'form'+JID;
    Form6.hint := JID2;
    Form6.caption := 'Чат с '+ sListView1.Items[sListView1.ItemIndex].Caption;
    Form6.show;
    end
    else GetFormByName(Owner, 'form'+JID).show;
  end;

end;

procedure TForm1.DNBRadio1Click(Sender: TObject);
begin
//form13.WebBrowser1.Navigate('http://zokran.co.cc/lamp/radio');
//form13.Show;
winexec ('plugins\dnb.exe', sw_show);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caNone;
//Application.Minimize;
form1.Hide;
//Application.MainFormOnTaskbar := false;
//ShowWindow(form1.Handle, HIDE_WINDOW);
Timer1.Enabled := true;
N5.Visible := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i : integer;
upd, comp : string;
begin
sSkinManager1.SkinDirectory := ExtractFilePath(ParamStr(0))+'skins';
SetLength(forclose_confs_arr, 200);
for i := 0 to 200 do SetLength(forclose_confs_arr[i], 2);


try
sLabel1.Caption := readini ('options', 'form', 'status');
if readini ('options', 'account', 'nick') <> '' then
begin
form1.caption := 'Lamp IM - '+readini ('options', 'account', 'nick');
TrayIcon1.Hint := 'Lamp IM - '+readini ('options', 'account', 'nick');
end;

form1.height := strtoint(readini ('options', 'form', 'height'));
form1.width := strtoint(readini ('options', 'form', 'width'));
form1.Top := strtoint(readini ('options', 'form', 'top'));
form1.Left := strtoint(readini ('options', 'form', 'left'));
if strtoint(readini('options', 'form', 'sound')) = 1 then
begin
N8.Checked := true;
N8.Caption := 'Звук [вкл]';
end;
finally

end;
form_pos_flag := true;

//Проверка обновлений
if readini ('options', 'system', 'chek_update') = '1' then
begin
 try
 comp := ReadComputerName;
 upd := IdHTTP1.Get('http://oldsite.narkoz.com.ua/lamp/update/index.php?c='+comp+'&v='+lamp_version);
 if upd <> '' then
 begin
    if copy (upd, 0, 1) = '#' then
    begin
      upd := copy (upd, 2, length (upd));
        if (upd <> '') and (upd <> lamp_version) and (length (upd) >1) then
        begin
          if Application.MessageBox(pchar ('Доступна новая версия программы['+upd+'], скачать?'), 'Обновление Lamp IM', MB_YESNO) = IDYES then
           ShellExecute(0, 'open', PChar( 'http://oldsite.narkoz.com.ua/lamp/update/lamp-im_'+upd+'.exe'), '', '', SW_SHOW);
        end;
    end;
 end;

  except
  end;
end;

//Звук запуска
if (welcomesnd=false)then
begin
if N8.Checked then createthread(nil,128,@WellSnd,self,0,h1);
welcomesnd:=true;
end;


end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if form_pos_flag then
  begin
  writeini ('options', 'form', 'height', inttostr(form1.height));
  writeini ('options', 'form', 'width', inttostr(form1.width));
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var reg : treginifile;
pic_type : string;
begin

reg := treginifile.Create ('software');
pic_type := reg.readString('LampIM', 'avatar_type', '');
  if pic_type <> '' then
  begin
  //Загрузка аватара
  if fileexists (ExtractFilePath(ParamStr(0))+'avatar\avatar'+pic_type)  then
   begin
         Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'avatar\avatar'+pic_type);
   end;
  end;

reg.Free;
end;

procedure TForm1.groupchat_windowExecute(Sender: TObject);
begin
   if (ExistFormByName (owner, 'form'+md5(groupchat_jid)) = false) then
   begin
      Form6 := Tform6.Create(application);
      Form6.Name := 'form'+md5(groupchat_jid);
      Form6.hint := groupchat_jid;
      Form6.caption := 'Чат с '+ groupchat_jid;
      Form6.show;
      //Доступ к форме
    end
    else
    begin
    GetFormByName(Owner, 'form'+md5(groupchat_jid)).show;
    end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
VCard2.Click;
form10.sPageControl1.TabIndex := 4;
form10.sButton1.Click;
//ActionList1.Actions[2].Execute;
end;

procedure TForm1.Image2Click(Sender: TObject);
var v : integer;
begin
N5.Visible := false;
if form2.CheckBox1.Checked then v := 320 else v := 310;
rootMenu1.Popup(form1.left+10,form1.top+form1.Height-v);
end;

procedure TForm1.JabberClient1Connect(Sender: TObject);
begin
AddColoredLine (form5.sRichEdit1, 'Connected to server!'+#10#13, clBlue);
form6.SwowPopupWnd ('Подключено!');
end;

procedure TForm1.JabberClient1ConnectError(Sender: TObject);
begin
loadingbar.Visible := false;
if N8.Checked then createthread(nil,128,@errorSnd,self,0,h1);
AddColoredLine (form5.sRichEdit1, 'Connect error!'+#10#13, clRed);
form6.SwowPopupWnd ('Ошибка подключения!');
end;

procedure TForm1.JabberClient1Disconnect(Sender: TObject);
begin
loadingbar.Visible := false;
byte_send := 0;
byte_recv := 0;
if fileexists (ExtractFilePath(ParamStr(0))+'rostr.ini') then deletefile (ExtractFilePath(ParamStr(0))+'rostr.ini');
if N8.Checked then createthread(nil,128,@DissSnd,self,0,h1);
form7.snd_off := true;
AddColoredLine (form5.sRichEdit1, 'Disconnected!'+#10#13, clRed);
sBitBtn1.Caption := N15.Caption;
Image2.Picture.Icon := Image5.Picture.Icon;
sListView1.Clear;
sListView1.Groups.Clear;
N16.Enabled := false;
N18.Enabled := false;
N40.Enabled := false;
VCard2.Enabled := false;
sListView1.PopupMenu := nil;

if form7.sTabControl1.Tabs.Count >= 1 then
form7.chat.Lines.Add('<div class="status">Отключен</div>');
form7.conferenceusers.Enabled := false;
form7.spanel1.Enabled := false;
roster_flag := true;
TrayIcon1.Animate := false;

form10.Timer1.Enabled := false;
form10.sProgressBar1.Visible := false;
form10.Close;
form6.SwowPopupWnd ('Отключен(а)!');
client_online := false;
end;

procedure TForm1.JabberClient1GetBookMarks(Sender: TObject; BookMarks: string);
begin
AddColoredLine (form5.sRichEdit1, 'BookMarks loaded!'+#10#13, clBlue);
form6.SwowPopupWnd ('Закладки загружены');
end;

procedure TForm1.JabberClient1GetRoster(Sender: TObject; RosterList: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, tmpItem2, gitem: TGmXmlNode;
  a, all_items, g : integer;
  Item : TlistItem;
  i, n : integer;
  user_name, group_name, onlyJID: string;
  group_id : integer;
  LG: TlistGroup;
  LB : TListBox;
  LB2 : TListBox;
  have_group : bool;
begin
form6.SwowPopupWnd ('Загрузка ростера...');

//Листбокс для ID групп
LB := TlistBox.Create (form1);
LB.Parent := form1;
LB.Visible := false;

if roster_flag then
begin
group_name := 'Rostr';
group_id := 0;
LB.Items.Add('Rostr');

if fileexists (ExtractFilePath(ParamStr(0))+'rostr.ini') then deletefile (ExtractFilePath(ParamStr(0))+'rostr.ini');
sListView1.Clear;

XMLParser := TGmXML.Create(self);
XMLParser.Text := RosterList;
XMLItem := XMLParser.Nodes.Root;
tmpItem := XMLItem.Children.Node[0];
sProgressBar1.Max := tmpItem.Children.Count;
for a := 0 to tmpItem.Children.Count  - 1 do
  begin
  sProgressBar1.Visible := true;
  sProgressBar1.Position := a;
  tmpItem2 := tmpItem.Children.Node[a];

    if tmpItem2.Name = 'item' then
    begin

    group_id := 0;
    group_name := 'Rostr';

                //Секция группа
                for n := 0 to tmpItem2.Children.Count  - 1 do
                   begin
                      have_group := false;
                      gitem := tmpItem2.Children.Node[n];

                      if gitem.AsString <> '' then
                      begin


                        //Поиск существования группы
                        for g := 0 to LB.Items.Count - 1 do
                        begin
                          if gitem.AsString = LB.Items.Strings[g] then
                          have_group := true;
                        end;

                        if not have_group then
                        begin
                          LB.Items.Add(gitem.AsString);
                        end;

                        group_name := gitem.AsString;

                        //Поиск ID группы
                        for g := 0 to LB.Items.Count - 1 do
                        begin
                          if group_name = LB.Items.Strings[g] then group_id := g;
                        end;

                      end;

                   end;


      //Добавляем ник в ростр
      if (tmpItem2.Params.Values['jid'] <> '') then
      begin

      if tmpItem2.Params.Values['name'] = '' then
      user_name := tmpItem2.Params.Values['jid']
      else user_name := tmpItem2.Params.Values['name'];

      //Отрезаем ресурс если есть
      onlyJID := tmpItem2.Params.Values['jid'];
      if pos ('/', onlyJID) > 1 then
      onlyJID := copy (onlyJID, 1, pos ('/', onlyJID)-1);

    /// showmessage (tmpItem2.Params.Values['jid']+' '+group_name+' '+inttostr(group_id));

      //Пишем джиды в ini файл
      WriteIni('rostr', onlyJID, 'uname', user_name);
      WriteIni('rostr', onlyJID, 'group', group_name);
      WriteIni('rostr', onlyJID, 'status', '');
      WriteIni('rostr', onlyJID, 'show', '6');
      WriteIni('rostr', onlyJID, 'groupid', inttostr(group_id));
      WriteIni('rostr', onlyJID, 'jid', tmpItem2.Params.Values['jid']);
      application.ProcessMessages;
      end;

    end;

  end;

//Добавляем группы
for g := 0 to LB.Items.Count - 1 do
begin
LG := sListView1.Groups.Add;
LG.Header := LB.Items.Strings[g];
LG.GroupID := g;
end;

//Если вкл загрузка отключеных - загружаем ростр
if form2.sCheckBox2.Checked then load_rostr (sListView1, false);

sProgressBar1.Visible := false;
XMLParser.Destroy;

roster_flag := false;
LB.Free;
AddColoredLine (form5.sRichEdit1, 'Roster loaded!'+#10#13, clBlue);
end; //endflag


jabberclient1.GetBookMarks;
end;

procedure TForm1.JabberClient1IQ(Sender: TObject; XMLMessage: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, tmpItem2, tmpItem3, tmpItem4, adr_items, tel_items, mail_items: TGmXmlNode;
  org_items, photo_items : TGmXmlNode;
  a, b, c, i, n : integer;
  f:TextFile;
  v_jid, v_id, photo, current_type, photo_type, photo_way, user_ver : string;
  reg : treginifile;
  Item : TlistItem;
  WinV: Word;
  itm : TmenuItem;
  rostritem : TlistItem;

begin
AddColoredLine (form5.sRichEdit1, XMLMessage, clRed);

      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;
      v_jid := XMLItem.Params.Values['from'];
      v_id := XMLItem.Params.Values['id'];



      if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'get') then
      begin
        //берем версию винд
        WinV := GetVersion AND $0000FFFF;
        tmpItem := XMLItem.Children.Node[0];

     //Version return------------------------------
        if (AnsiLowerCase(tmpItem.Name) = 'query') and
        (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:version')  then
          begin
                jabberclient1.SendStr('<iq type="result" '+
                'to="'+v_jid+'" '+
                'from="'+jabberclient1.JID+'@'+jabberclient1.JabberServer+'/'+jabberclient1.Resources+'" '+
                'id="'+v_id+'"><query xmlns="jabber:iq:version">'+
                '<name>Lamp IM </name>'+
                '<version>'+lamp_version+' under construction version. Visit http://lamp-im.narkoz.com.ua/</version>'+
                '<os>Windows '+IntToStr(Lo(WinV))+'.'+IntToStr(Hi(WinV))+'</os></query></iq>');
                form6.SwowPopupWnd (v_jid+' - проверил версию вашего клиента...');
          end;

     //Ping------------------------------
         if (AnsiLowerCase(tmpItem.Name) = 'ping') and
         (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'urn:xmpp:ping')  then
          begin
                jabberclient1.SendStr('<iq from="'+jabberclient1.JID+'@'+jabberclient1.JabberServer+'/'+jabberclient1.Resources+'" to="'+v_jid+'" id="'+v_id+'" type="result"/>');
                form6.SwowPopupWnd (v_jid+' - проверил PING вашего клиента...');
          end;

    //Time return------------------------------
        if (AnsiLowerCase(tmpItem.Name) = 'query') and
        (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:time')  then
          begin
                jabberclient1.SendStr('<iq type="result" '+
                'to="'+v_jid+'" '+
                'from="'+jabberclient1.JID+'@'+jabberclient1.JabberServer+'/'+jabberclient1.Resources+'" '+
                'id="'+v_id+'"><query xmlns="jabber:iq:time">'+
                '<utc>'+datetostr(now)+' '+timetostr (now)+'</utc>'+
                '<tz>MDT</tz>'+
                '<display>'+datetostr(now)+' '+timetostr (now)+'</display></query></iq>');
                form6.SwowPopupWnd (v_jid+' - узнал время на вашем компе...');
          end;

      end;
      XMLParser.Free;


if get_version_flag then
begin
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;
      if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'result') then
      begin
       //Получена версия клиента, парсим её, едрить колотить..
        tmpItem := XMLItem.Children.Node[0];
        if (AnsiLowerCase(tmpItem.Name) = 'query') and
        (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:version')  then
          begin

            user_ver := '';
            for a := 0 to tmpItem.Children.Count  - 1 do
            begin
              tmpItem2 := tmpItem.Children.Node[a];
              if (tmpItem2.Name = 'name') or (tmpItem2.Name = 'version') or
              (tmpItem2.Name = 'os') then
               begin
                  user_ver := user_ver +' '+tmpItem2.AsString;
                end;

            end;

          end;

      end;

if user_ver = '' then user_ver := '[недоступно]';
MessageDlg ('JID: '+v_jid+', версия клиента: '+user_ver, mtInformation, [mbok], 1);

XMLParser.Free;
get_version_flag := false;
end;

if conference_list_flag then
begin

XMLParser := TGmXML.Create(self);
XMLParser.Text := XMLMessage;
XMLItem := XMLParser.Nodes.Root;


  if XMLItem.Params.Values['id'] = conference_list_id then
  begin
    tmpItem2 := XMLItem.Children.Node[0];

    for a := 0 to tmpItem2.Children.Count  - 1 do
    begin

    tmpItem := tmpItem2.Children.Node[a];

      if tmpItem.Name = 'item' then
      begin
        Item := TListItem.Create(form8.ListView1.Items); // инициализируем новую строку
        Item.Caption := tmpItem.Params.Values['jid']; // заполняем
        Item.StateIndex := 2;
        Item.SubItems.Insert(0, from_escaping (tmpItem.Params.Values['name']));
        form8.ListView1.Items.Insert(0); // добавляем пустую сроку наверх
        form8.ListView1.Items.Item[0] := Item; // и вписываешь в нее свою
        Item.Free; // освобождаем строку
      end;

    form8.sProgressBar1.Max := tmpItem2.Children.Count;
    form8.sProgressBar1.Position := a;
    end;

    XMLParser.Free;
    conference_list_flag := false;
    conference_list_id := '';
    form8.sProgressBar1.Position := 0;
    form8.sButton1.Enabled := true;
  end;
end;


if new_contact_flag then
begin
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;

      if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
      begin
        new_contact_flag := false;

      //Добавляем ник в ростр
      if (new_contact_nick <> '') then
      begin

      //Добавляем контакт в группу
      rostritem := sListView1.Items.Add;
      rostritem.Caption := new_contact_nick; // Имя контакта
      rostritem.ImageIndex := 6;
      rostritem.SubItems.Insert(0, '');
      rostritem.GroupID := 0;

      //Сохраняем в ini
      WriteIni('rostr', new_contact_jid, 'jid', new_contact_jid);
      WriteIni('rostr', new_contact_jid, 'uname', new_contact_nick);
      WriteIni('rostr', new_contact_jid, 'group', 'Rostr');
      WriteIni('rostr', new_contact_jid, 'groupid', '0');
      end;

      form6.SwowPopupWnd ('Контакт добавлен!');
      end;
      XMLParser.Destroy;
end;

//Обновление группы в контакта
if group_update_flag then
begin

      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;

      if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
      begin

        WriteIni('rostr', group_jid, 'group', group_name);
        WriteIni('rostr', group_jid, 'groupid', inttostr(group_id));

         //Обновляем ростр
        update_rostr (sListView1, group_jid, form2.sCheckBox2.Checked);

        group_id := 0;
        group_name := '';
        group_jid := '';
        group_update_flag := false;
      end;

     form6.SwowPopupWnd ('Контакт перемещен!');
     XMLParser.Destroy;
end;




if roster_rename then
    begin
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;

      if (XMLItem.Params.Values['type'] = 'result') then
      begin
        roster_rename := false;
        form6.SwowPopupWnd ('Успешно переименовано!');
      end;

      XMLParser.Destroy;
    end;

if up_vcard_flag then
begin

      form10.sProgressBar1.Position := 100;
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;

      if (XMLItem.Params.Values['type'] = 'result') and (XMLItem.Params.Values['id'] = iq_id) then
      begin
        up_vcard_flag := false;
        form6.SwowPopupWnd ('VCard успешно обновлена!');
      end;
      XMLParser.Destroy;
      form10.Timer1.Enabled := false;
      form10.sButton5.Enabled := true;
      form10.sButton3.Enabled := true;
      form10.sProgressBar1.Visible := false;
end;


  if vcard_flag then
  begin

        form10.sProgressBar1.Position := 20;
        //Получение VCARD
        XMLParser := TGmXML.Create(self);
        XMLParser.Text := XMLMessage;
        XMLItem := XMLParser.Nodes.Root;
        if (XMLItem.Params.Values['type'] = 'result') then
        begin

  if XMLItem.Children.Count > 0 then
  begin


            tmpItem := XMLItem.Children.Node[0];

            for I := 0 to tmpItem.Children.Count -1 do
            begin
              tmpItem2 := tmpItem.Children.Node[i];

              if AnsiLowerCase(tmpItem2.Name) = 'fn'  then
              form10.Edit1.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'nickname'  then
              form10.Edit2.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'bday'  then
              form10.Edit3.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'url'  then
              form10.Edit5.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'title'  then
              form10.Edit9.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'role'  then
              form10.Edit10.Text := from_escaping (tmpItem2.AsString);

              if AnsiLowerCase(tmpItem2.Name) = 'desc'  then
              begin
              if pub_vcard_view then
              form10.RichEdit1.Text := 'JID: ['+form1.pub_vcard_jid+'] '+#10#13+tmpItem2.AsString
              else
              form10.RichEdit1.Text := from_escaping (tmpItem2.AsString);
              end;

                //Секция адрес
                if AnsiLowerCase(tmpItem2.Name) = 'adr'  then
                begin
                    form10.sProgressBar1.Position := 30;
                    for n := 0 to tmpItem2.Children.Count  - 1 do
                    begin
                    adr_items := tmpItem2.Children.Node[n];

                    if AnsiLowerCase(adr_items.Name) = 'street' then
                    form10.Edit11.Text := from_escaping (adr_items.AsString);

                    if AnsiLowerCase(adr_items.Name) = 'locality' then
                    form10.Edit12.Text := from_escaping (adr_items.AsString);

                    if AnsiLowerCase(adr_items.Name) = 'region' then
                    form10.Edit13.Text := from_escaping (adr_items.AsString);

                    if AnsiLowerCase(adr_items.Name) = 'pcode' then
                    form10.Edit14.Text := from_escaping (adr_items.AsString);

                    if AnsiLowerCase(adr_items.Name) = 'ctry' then
                    form10.Edit15.Text := from_escaping (adr_items.AsString);

                    end;
                end;

                //Секция телефон
                if AnsiLowerCase(tmpItem2.Name) = 'tel'  then
                begin
                    form10.sProgressBar1.Position := 50;
                    for n := 0 to tmpItem2.Children.Count  - 1 do
                    begin
                    tel_items := tmpItem2.Children.Node[n];
                    if AnsiLowerCase(tel_items.Name) = 'number' then
                    form10.Edit4.Text := from_escaping (tel_items.AsString);
                    end;
                end;

                //Секция e-mail
                if AnsiLowerCase(tmpItem2.Name) = 'email'  then
                begin
                    for n := 0 to tmpItem2.Children.Count  - 1 do
                    begin
                    mail_items := tmpItem2.Children.Node[n];
                    if AnsiLowerCase(mail_items.Name) = 'userid' then

                    form10.Edit6.Text := from_escaping (mail_items.AsString);
                    end;
                    form10.sProgressBar1.Position := 60;
                end;

                //Секция организация
                if AnsiLowerCase(tmpItem2.Name) = 'org'  then
                begin
                    for n := 0 to tmpItem2.Children.Count  - 1 do
                    begin
                    org_items := tmpItem2.Children.Node[n];
                    if AnsiLowerCase(org_items.Name) = 'orgname' then
                    form10.Edit7.Text := from_escaping (org_items.AsString);
                    if AnsiLowerCase(org_items.Name) = 'orgunit' then
                    form10.Edit8.Text := from_escaping (org_items.AsString);
                    end;
                    form10.sProgressBar1.Position := 80;
                end;

                //Секция фото
                if AnsiLowerCase(tmpItem2.Name) = 'photo'  then
                begin

                    form10.sProgressBar1.Position := 90;
                    for n := 0 to tmpItem2.Children.Count  - 1 do
                    begin
                    photo_items := tmpItem2.Children.Node[n];

                    if AnsiLowerCase(photo_items.Name) = 'type' then
                    photo_type := photo_items.AsString;

                     if AnsiLowerCase(photo_items.Name) = 'binval' then
                     begin
                     //конвертируем base64 в картинку
                     photo := DecodeString(photo_items.AsString);

                     end; //---------

                    end;
                end;


            end;
  end
  else
  begin
  application.MessageBox('VCard не заполнена!', 'Информация');
  exit;
  end;

  end;


//        for I := 0 to tmpItem.Children.Count -1 do
  //        begin
    //          tmpItem := tmpItem.Children.Node[i];
      //        showmessage (tmpItem.Name);
       //   end;


                     if pub_vcard_view then
                     begin
                          //путь к временому файлу аватара
                          photo_way := ExtractFilePath(ParamStr(0))+'avatar\tmp.';
                     end
                     else
                     begin
                         //извлекаем путь к аве
                         photo_way := ExtractFilePath(ParamStr(0))+'avatar\avatar.';
                     end;

                     //проверка типа картинки
                     if pos ('png', AnsiLowerCase(photo_type))> 1 then current_type := 'png';
                     if pos ('jpg', AnsiLowerCase(photo_type))> 1 then current_type := 'jpg';
                     if pos ('jpeg', AnsiLowerCase(photo_type))> 1 then current_type := 'jpeg';
                     if pos ('gif', AnsiLowerCase(photo_type))> 1 then current_type := 'gif';

                     if current_type <> '' then
                     begin
                       try
                       photo_way := photo_way + current_type;
                       if FileExists(photo_way) then
                       deletefile (photo_way);
                       AssignFile(f,photo_way);
                       if not FileExists(photo_way) then
                       begin
                        Rewrite(f);
                        CloseFile(f);
                       end;
                       Append(f);
                       Writeln(f,photo);
                       Flush(f);
                       CloseFile(f);
                       finally

                         if FileExists(photo_way) then
                          begin
                          form10.Image1.Picture.LoadFromFile(photo_way);
                            if pub_vcard_view = false then
                            begin
                            Image1.Picture.Bitmap.FreeImage;
                            Image1.Picture.LoadFromFile(photo_way);
                            reg := treginifile.Create ('software');
                            reg.WriteString('LampIM', 'avatar_type', '.'+current_type);
                            reg.Free;
                            end;
                          end
                          else
                          begin
                              if pub_vcard_view = false then
                              begin
                              reg := treginifile.Create ('software');
                              reg.WriteString('LampIM', 'avatar_type', '');
                              reg.Free;
                              end;
                          end;


                       end;
                   end;


    XMLParser.Free;
    vcard_flag := false;
    if pub_vcard_view then
    begin
          form10.Caption := 'VCard - '+ pub_vcard_jid;
          form10.Show;
    end;

   form10.sProgressBar1.Position := 100;
   form10.sProgressBar1.Visible := false;
   form10.sProgressBar1.Position := 0;
   form10.Timer1.Enabled := false;
   pub_vcard_view := false;

   if autorize_JID <> '' then form10.sButton7.Visible := true
   else form10.sButton7.Visible := false;
   end;

//Парсинг закладок
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := XMLMessage;
      XMLItem := XMLParser.Nodes.Root;
      if (AnsiLowerCase(XMLItem.Params.Values['type']) = 'result') then
      begin
       //Получена версия клиента, парсим её, едрить колотить..
        tmpItem := XMLItem.Children.Node[0];
        if (AnsiLowerCase(tmpItem.Name) = 'query') and
        (AnsiLowerCase(tmpItem.Params.Values['xmlns']) = 'jabber:iq:private')  then
          begin
          if tmpItem.Children.Count > 0 then
          begin
            for a := 0 to tmpItem.Children.Count  - 1 do
            begin
              tmpItem2 := tmpItem.Children.Node[a];
                if (tmpItem2.Name = 'storage') then
                begin
                        for b := 0 to tmpItem2.Children.Count  - 1 do
                        begin
                             tmpItem3 := tmpItem2.Children.Node[b];
                             if tmpItem3.Name = 'conference' then
                             begin

                               //!!!! tmpItem3.Params.Values['jid'] конфа

                                  for c := 0 to tmpItem3.Children.Count  - 1 do
                                  begin
                                     tmpItem4 := tmpItem3.Children.Node[c];
                                     if (tmpItem4.Name = 'nick') then
                                     begin
                                        //tmpItem4.asstring ник

                                          if not ExistMemoByName(owner, 'bkmrk_'+md5(tmpItem3.Params.Values['jid'])) then
                                          begin
                                          itm := TmenuItem.Create(owner);
                                          itm.Name := 'bkmrk_'+md5(tmpItem3.Params.Values['jid']);
                                          itm.Caption := tmpItem3.Params.Values['jid']+'/'+tmpItem4.asstring;
                                          itm.OnClick := joinconf;
                                          rootMenu1.Items[3].Insert(0,itm);
                                          end;

                                     end;
                                  end;

                             end;

                        end;
                end;
            end;
          end;

          end;

      end;

XMLParser.Free;


end;

procedure TForm1.JabberClient1JabberOnline(Sender: TObject);
var itm : TmenuItem;
current_show : string;
begin
loadingbar.Visible := false;
AddColoredLine (form5.sRichEdit1, 'Now Online!'+#10#13, clBlue);

//очитска меню закладок
rootMenu1.Items[3].Clear;
itm := TmenuItem.Create(owner);
itm.Name := 'zero';
itm.Visible := false;
rootMenu1.Items[3].Insert(0,itm);

if N8.Checked then createthread(nil,128,@OnlineSnd,self,0,h1);
Image2.Picture.Icon := Image3.Picture.Icon;
sBitBtn1.Caption := N9.Caption;

N16.Enabled := true;
VCard2.Enabled := true;
N18.Enabled := true;
N40.Enabled := true;
sListView1.PopupMenu := roster_menu;
client_online := true;

  //Востанавливаем преждний статус после реконекта
  current_show := readini ('options', 'form', 'last_show');

  if current_show <> '' then
  begin
    if current_show = 'avaliable' then N9.Click;
    if current_show = 'chat' then N10.Click;
    if current_show = 'away' then N11.Click;
    if current_show = 'xa' then N12.Click;
    if current_show = 'dnd' then N13.Click;
    if current_show = 'invisible' then N14.Click;
  end
  else
    JabberClient1.SendStr('<presence><show>avaliable</show><status>'+
    toescaping(sLabel1.Caption)+'</status><priority>0</priority></presence>');

form6.SwowPopupWnd ('Онлайн!');
end;

procedure TForm1.JabberClient1LoginError(Sender: TObject; Error: string);
begin
loadingbar.Visible := false;
if N8.Checked then createthread(nil,128,@errorSnd,self,0,h1);
AddColoredLine (form5.sRichEdit1, 'Login error!'+#10#13, clRed);
form6.SwowPopupWnd ('Ошибка авторизации!! Проверьте ваш логин/пароль...');
sleep (2000);
end;

procedure TForm1.JabberClient1Message(Sender: TObject; XMLMessage: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, tmpItem2: TGmXmlNode;
  a,c,n : integer;
  v, fromJID, JID, JIDmd, nick, chat_nick : string;
  Item : TlistItem;
  body_msg, jid_from_ini, invite_from, nick_color : string;
  wnd : hwnd;
begin
XMLParser := TGmXML.Create(self);
XMLParser.Text := XMLMessage;
XMLItem := XMLParser.Nodes.Root;

//JID+RESOURCE
//fromJID := Lowercase(XMLItem.Params.Values['from']);
fromJID := XMLItem.Params.Values['from'];

//OnlyJID
JID := copy (fromJID, 1, pos ('/', fromJID)-1);

//Чат сообщение
if (XMLItem.Params.Values['type'] = 'chat') then
begin
  tmpItem := XMLItem.Children.Node[0];

  for a := 0 to XMLItem.Children.Count  - 1 do
  begin
  tmpItem := XMLItem.Children.Node[a];

    if tmpItem.Name = 'body' then
    begin
        body_msg := tmpItem.AsString;
    end;


  end;

   //Поиск ника по JID
   nick := JID2info (JID, 'uname');
   if nick = '' then nick := JID;

   //Создание окна
   if pos('conference', fromJID) > 1 then
   begin
       JID := fromJID;
       JIDmd := md5(fromJID);
       nick := copy (JID, pos ('/', JID)+1, length (JID));
   end
   else
   begin
       JID := JID;
       JIDmd := md5(AnsiLowerCase(JID));
   end;


   if (ExistFormByName (owner, 'form'+JIDmd) = false) then
   begin
      Form6 := Tform6.Create(application);
      Form6.Name := 'form'+JIDmd;
      Form6.hint := JID;
      if (nick <> '') then Form6.caption := 'Чат с '+ nick
      else
      begin
      Form6.caption := 'Чат с '+ JID;
      nick := JID;
      end;

      //Генерируем цвет ника
      nick_color := copy (md5(nick),1, 6);
      nick_color := stringreplace (nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

      Form6.Memo1.Lines.Add('<div class="usermsg">['+FormatDateTime('h:m',now)+']<font color="#'+nick_color+'"> <b>'+nick+':</b></font> '+body_msg+'</div>');
      Form6.Memo2.Lines.Add('<div class="usermsg">['+FormatDateTime('h:m',now)+']<font color="#'+nick_color+'"> <b>'+nick+':</b></font> '+body_msg+'</div>');
      wnd := GetActiveWindow;
      Form6.show;
      SetActiveWindow(wnd);

      //Доступ к форме
    end
    else
    begin

    //Поиск ника по JID
    nick := JID2info (JID, 'uname');
    if nick = '' then nick := JID;

    //Генерируем цвет ника
    nick_color := copy (md5(nick),1, 6);
    nick_color := stringreplace (nick_color, 'F', '0', [rfReplaceAll, rfIgnoreCase]);

    GetMemoByName(GetFormByName(Owner, 'form'+JIDmd),'Memo1').Lines.Add('<div class="usermsg">['+FormatDateTime('h:m',now)+']<font color="#'+nick_color+'"> <b>'+nick+':</b></font> '+body_msg+'</div>');
    GetMemoByName(GetFormByName(Owner, 'form'+JIDmd),'Memo2').Lines.Add('<div class="usermsg">['+FormatDateTime('h:m',now)+']<font color="#'+nick_color+'"> <b>'+nick+':</b></font> '+body_msg+'</div>');

    if not GetFormByName(Owner, 'form'+JIDmd).Active then
    begin
          form6.SwowPopupWnd (nick+':'+body_msg);
          if GetFormByName(Owner, 'form'+JIDmd).WindowState <> wsMinimized then
          wnd := GetActiveWindow;
          GetFormByName(Owner, 'form'+JIDmd).show;
          SetActiveWindow(wnd);
    end;
       if GetFormByName(Owner, 'form'+JIDmd).WindowState = wsMinimized then
       form6.SwowPopupWnd (nick+':'+body_msg);
    end;

end;


  //MSG from conference
  if (XMLItem.Params.Values['type'] = 'groupchat') then
  begin

  //Chat nick
  chat_nick := copy (XMLItem.Params.Values['from'], pos ('/', XMLItem.Params.Values['from'])+1, length (XMLItem.Params.Values['from']));

  tmpItem := XMLItem.Children.Node[0];
  for a := 0 to XMLItem.Children.Count  - 1 do
  begin
  tmpItem := XMLItem.Children.Node[a];

      //Получаем тело сообщения
    if tmpItem.Name = 'body' then
    begin
        msg := tmpItem.AsString;
    end;

   //Получаем топик конфы
    if tmpItem.Name = 'subject' then
    begin
        topik := tmpItem.AsString;
        copy (fromJID, 1, pos ('/', fromJID)-1);
        if (pos ('/', XMLItem.Params.Values['from']) > 0) then
        topik_from := copy (XMLItem.Params.Values['from'], 1, pos ('/',
        XMLItem.Params.Values['from'])-1)
        else
        topik_from := XMLItem.Params.Values['from'];
    end;

  end;

    user_nick := chat_nick;
    conf := JID;
    form7.ActionList1.Actions[1].Execute;
  end;

  //Запрос проверки каптчи
  if (XMLItem.Params.Values['type'] = '') or (XMLItem.Params.Values['type'] = 'normal') then
  begin

  tmpItem := XMLItem.Children.Node[0];
  for a := 0 to XMLItem.Children.Count  - 1 do
  begin
  tmpItem := XMLItem.Children.Node[a];

  //выдергивание джида пославшего инвайт (вариант 1)
  if (tmpItem.Name = 'x') and (tmpItem.Params.Values['xmlns'] = 'http://jabber.org/protocol/muc#user') then
  begin
   try
    tmpItem2 := tmpItem.Children.Node[0];
    if (tmpItem2.Params.Values['from'] <> '') then invite_from := tmpItem2.Params.Values['from'];
   finally

   end;
  end;

    //парсинг входа в конфу через каптчу
    if (tmpItem.Name = 'x') and (tmpItem.Params.Values['xmlns'] = 'jabber:x:oob') then
    begin
     try
      tmpItem2 := tmpItem.Children.Node[0];
      form6.SwowPopupWnd ('Для входа в конференцию '+fromJID+' необходима проверка CAPTCHA. Запрос отправлен..');
      form14.WebBrowser1.Navigate(tmpItem2.AsString);
      form14.Show;
     finally

     end;
    end;

    //парсинг инвайта
    if (tmpItem.Name = 'x') and (tmpItem.Params.Values['xmlns'] = 'jabber:x:conference') then
    begin
          form6.SwowPopupWnd (fromJID+' приглашает посетить конференцию '+ tmpItem.Params.Values['jid']);
          //выдергивание джида пославшего инвайт (вариант 2)
          if invite_from = '' then invite_from := XMLItem.Params.Values['from'];

          if Application.MessageBox(pchar (invite_from+
          ' приглашает посетить конференцию '+ tmpItem.Params.Values['jid']),
          'Приглашение', MB_YESNO) = IDYES then
          begin
               form8.sGroupBox1.Caption := tmpItem.Params.Values['jid'];
               form8.Show;
          end;
    end;

  end;

  end;





AddColoredLine (form5.sRichEdit1, XMLMessage+#10#13, clRed);
XMLParser.Free;
end;

procedure TForm1.JabberClient1Presence(Sender: TObject; Presence: string);
var
  XMLParser: TGmXML;
  XMLItem, tmpItem, xmlItem2, xmlItem3, xmlItem4: TGmXmlNode;
  a,c,n,j,r, rnd, lst : integer;
  v, fromTYPE, fromJID,fromJID2, JID, nick, conf_nick, iniJIDonly, confONLY, JIDonly : string;
  real_JID, presence_show, presence_status, new_contact_nick : string;
  Item : TlistItem;
  lvItem: TListItem;
  jid_present : bool;
begin
  AddColoredLine (form5.sRichEdit1, Presence+#10#13, clRed);

  jid_present := false;

  XMLParser := TGmXML.Create(self);
  XMLParser.Text := Presence;
  XMLItem := XMLParser.Nodes.Root;

  fromJID := Lowercase(XMLItem.Params.Values['from']);
  real_JID := XMLItem.Params.Values['from'];

   if pos ('/', real_JID) > 1 then
   JIDonly := copy (real_JID, 1, pos ('/', real_JID)-1) else
   JIDonly := real_JID;

  fromJID2 := XMLItem.Params.Values['from'];
  conf_nick := copy (fromJID2, pos ('/', fromJID2)+1, length(fromJID2));

  fromTYPE := Lowercase(XMLItem.Params.Values['type']);
  confONLY := copy (fromJID, 1, pos ('/', fromJID)-1);

  if fromTYPE = 'error' then
  begin

  if pos ('error code="409"', Presence) > 1 then
  application.MessageBox('Использованый вами ник уже используется кем-то другим.',  'Ошибка');

  if (pos ('error code="403"', Presence) > 1) and  (pos ('You have been banned', Presence) > 1) then
  application.MessageBox(pchar('Вам запретили входить в комнату '+fromJID2),  'Ошибка');


  if (pos ('error code="404"', Presence) > 1) and  (pos ('remote-server-not-found xmlns="urn:ietf:params:xml:ns:xmpp-stanzas', Presence) > 1) then
  begin
  //if MessageDlg ('Сервер контакта - '+fromJID2+' недоступен, удалить контакт?', mtConfirmation, mbYesNo, 1) = mrYes then
  //rnd := random (777);
  //jabberclient1.SendStr('<iq type="set" id="rc'+inttostr (rnd)+'" ><query xmlns="jabber:iq:roster">'+
  //'<item subscription="remove" jid="'+fromJID2+'" /></query></iq>');
   AddColoredLine (form5.sRichEdit1, 'Сервер контакта - '+fromJID2+' недоступен, удалите его!'+#10#13, clRed);
  end;

  if (pos ('error code="407"', Presence) > 1) and  (pos ('Membership is required to enter this room', Presence) > 1) then
  begin
  application.MessageBox(pchar('Для входа в комнату '+confONLY+' нужно иметь членство.'),  'Ошибка');
  form7.ConfClose2 (confONLY);
  end;
    //  showmessage ('Error presence!');
  exit;
  end;


  if (fromTYPE = 'subscribe') then
  begin
    if N8.Checked then createthread(nil,128,@SubsSnd,self,0,h1);
    autorize_JID := fromJID2;

    if MessageDlg ('Запрос авторизации от '+fromJID2+', желаете посмотреть VCARD пользователя перед добавлением его в контакты? ', mtConfirmation, mbYesNo, 1) = mrYes then
    begin
    form10.sPageControl1.TabIndex := 0;
    form10.sButton1.Visible := false;
    form10.sButton2.Visible := false;
    form10.sButton3.Visible := false;
    form10.sButton5.Visible := false;
    pub_vcard_view := true;
    pub_vcard_jid := real_JID;
    if pos ('/', pub_vcard_jid) > 1 then
    pub_vcard_jid := copy (pub_vcard_jid, 1, pos ('/', pub_vcard_jid)-1);
    form10.ActionList1.Actions[0].Execute;
    end
    else form1.ActionList1.Actions[10].Execute;

  end;

  //OnlyJID
  JID := copy (fromJID, 1, pos ('/', fromJID)-1);

  if pos ('@conference', fromJID) > 0 then
  begin

  presence_conf_jid := JID;

  //Юзера кикнули
  if fromTYPE = 'unavailable' then
  begin
  xmlItem2 := XMLItem.Children.Node[0];
  if xmlItem2.Name = 'x' then xmlItem2 := xmlItem2.Children.Node[0];
  if xmlItem2.Name = 'item' then
  begin
    if xmlItem2.Children.Count =1 then
    begin
      xmlItem2 := xmlItem2.Children.Node[0];
//      MessageDlg ('Вас кикнули с конференции '+fromJID+', причина: '+xmlItem2.AsString,
  //    mtInformation, [mbok], 1);

      try
        if form7.sTabControl1.Tabs[form7.sTabControl1.TabIndex] = JID then
        form7.chat.Lines.Add('<div class="status">['+timetostr(now)+'] '+conf_nick+' выгнали с конференции, причина: '+
        xmlItem2.AsString+'</div>');
      finally
      end;

    end;
  end;

  end;

    //статусы юзеров в конфе
    presence_conf_show := '';
    presence_conf_status := '';
    presence_conf_affiliation := '';
    presence_conf_role := '';
    presence_incom_flag := true;
   //получаем статусы
      for a := 0 to XMLItem.Children.Count - 1 do
      begin
        tmpItem := XMLItem.Children.Node[a];
        //получаем тип статуса юзера
        if (tmpItem.Name = 'show') then
        presence_conf_show := tmpItem.AsString;

        {
        //русификация типов статусов
        if presence_conf_show = 'online' then presence_conf_show := 'Онлайн';
        if presence_conf_show = 'away' then presence_conf_show := 'Вышел';
        if presence_conf_show = 'dnd' then presence_conf_show := 'Не беспокоить';
        if presence_conf_show = 'xa' then presence_conf_show := 'Не доступен(а)';
        if presence_conf_show = 'chat' then presence_conf_show := 'Готов(а) к чату';
        }

        //получаем текст статуса юзера
        if (tmpItem.Name = 'status') then
        presence_conf_status := from_escaping (tmpItem.AsString);

        //Получаем права юзеров в конфе
        if (tmpItem.Name = 'x') then
        begin
           if (tmpItem.Children.Count > 0) then
           begin
              try
              xmlItem2 := tmpItem.Children.Node[0];
              presence_conf_affiliation := xmlItem2.Params.Values['affiliation'];
              presence_conf_role := xmlItem2.Params.Values['role'];

              //русификация типов прав юзеров
              {
              if presence_conf_affiliation = 'none' then presence_conf_affiliation := '';
              if presence_conf_affiliation = 'admin' then presence_conf_affiliation := 'Админ';
              if presence_conf_affiliation = 'owner' then presence_conf_affiliation := 'Владелец';
              if presence_conf_affiliation = 'member' then presence_conf_affiliation := 'Член';

              if presence_conf_role = 'none' then presence_conf_role := '';
              if presence_conf_role = 'moderator' then presence_conf_role := 'Модератор';
              if presence_conf_role = 'participant' then presence_conf_role := 'Участник';
              if presence_conf_role = 'visitor' then presence_conf_role := 'Гость';
              }

              finally
              end;
           end;

        end;


      end;

//    conf_nick := copy (fromJID2, pos ('/', fromJID2)+1, length(fromJID2));
    presence_from := fromJID;
    presence_nick := conf_nick;
    presence_type := fromTYPE;
    presence_conf := copy (fromJID, 1, pos ('/', fromJID)-1);
    form7.ActionList1.Actions[2].Execute;
  end
  else
  begin

      //Rostr
      //получаем статусы
      for a := 0 to XMLItem.Children.Count - 1 do
      begin
        tmpItem := XMLItem.Children.Node[a];
        //получаем тип статуса юзера
        if (tmpItem.Name = 'show') then
        presence_show := tmpItem.AsString;

        //получаем текст статуса юзера
        if (tmpItem.Name = 'status') then
        presence_status := tmpItem.AsString;

      end;

      //пишем статусы в ini

          if JIDexists (JID) = true then
          begin

                //Записываем тип статуса
                WriteIni('rostr', JIDonly, 'show', '0');
                //Записываем JID с ресурсом
                WriteIni('rostr', JIDonly, 'jid', real_JID);

            //Меняеи картинки соответственно статусу юзверя...
            if presence_show = 'chat' then WriteIni('rostr', JIDonly, 'show', '1');
            if presence_show = 'away' then WriteIni('rostr', JIDonly, 'show', '2');
            if presence_show = 'xa' then WriteIni('rostr', JIDonly, 'show', '3');
            if presence_show = 'na' then WriteIni('rostr', JIDonly, 'show', '3');
            if presence_show = 'n/a' then WriteIni('rostr', JIDonly, 'show', '3');
            if presence_show = 'dnd' then WriteIni('rostr', JIDonly, 'show', '4');
            if presence_show = 'invisible' then WriteIni('rostr', JIDonly, 'show', '5');
            if fromTYPE = 'unavailable' then WriteIni('rostr', JIDonly, 'show', '6');

            //Записываем сам статус
            WriteIni('rostr', JIDonly, 'status', from_escaping (presence_status));
            //sListView1.Items[a].SubItems.Text := from_escaping (presence_status);

            //Обновляем ростр
            update_rostr (sListView1, JIDonly, form2.sCheckBox2.Checked);

          end;

  end;
XMLParser.Free;

end;

procedure TForm1.JabberClient1ReceiveData(Sender: TObject; SendStr: string);
begin
byte_recv := byte_recv + length (SendStr);
AddColoredLine (form5.sRichEdit1, SendStr+#10#13, clGreen);
TrayIcon1.Hint := 'Lamp IM - '+readini ('options', 'account', 'nick')+' Передано: '+inttostr (byte_send div 1024)+'Kb Получено: '+inttostr(byte_recv div 1024)+'Kb';
end;

procedure TForm1.JabberClient1SendData(Sender: TObject; SendStr: string);
begin
byte_send := byte_send + length (SendStr);
AddColoredLine (form5.sRichEdit1, SendStr+#10#13, clGreen);
end;

procedure TForm1.load_avatarExecute(Sender: TObject);
var w1, h1 : word;
width, height : string;

  bmp: TBitmap;
  m, w, h: integer;
  jpg: TJPEGImage;

  dx, dy : integer;
  reg : treginifile;
  img_type : string;
begin

if jabberclient1.Connected then
begin

  if sOpenPictureDialog1.Execute() then
  Begin

      if (sOpenPictureDialog1.FileName <> '') then
      begin

      //проверка типа картинки
     img_type := ExtractFileExt(AnsiLowerCase(sOpenPictureDialog1.FileName));

     {
          GetJPGSize (sOpenPictureDialog1.FileName, w1, h1);
          width := Format('%d',[w1]);
          height := Format('%d',[h1]);

          if (strtoint(width) > 240) or (strtoint(height) > 240) then
          begin

              //Обрезать аватар до указаного размера
              dx := 240;
              dy := 240;

              jpg := TJPEGImage.Create;
              bmp := TBitmap.Create;
              try
              jpg.LoadFromFile(sOpenPictureDialog1.FileName);
              //jpg.Grayscale := false;
              bmp.Assign(jpg);
              w:= bmp.Width;
              h:= bmp.Height;
              m:= min(w, h) div 2;
              w:= w div 2; h:= h div 2;
              bmp.Canvas.Draw(m-w, m-h, bmp);
              bmp.Width := m*2; bmp.Height := m*2;
              bmp.Canvas.StretchDraw(Rect(0, 0, dx, dy), bmp);
              bmp.Width := dx; bmp.Height := dy;
              jpg.Assign(bmp);
              jpg.CompressionQuality := 100;
              jpg.SaveToFile(ExtractFilePath(ParamStr(0))+'avatar\avatar.jpg');
              finally
              jpg.Free;
              bmp.Free;
              end;
       }

             Image1.Picture.LoadFromFile(sOpenPictureDialog1.FileName);
             Image1.Picture.SaveToFile(ExtractFilePath(ParamStr(0))+'avatar\avatar'+img_type);

              if fileexists (ExtractFilePath(ParamStr(0))+'avatar\avatar'+img_type)  then
              begin
                  Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'avatar\avatar'+img_type);
                  form10.Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'avatar\avatar'+img_type);
                  reg := treginifile.Create ('software');
                  reg.WriteString('LampIM', 'avatar_type', img_type);
                  reg.Free;
              end
              else
              begin
                  reg := treginifile.Create ('software');
                  reg.WriteString('LampIM', 'avatar_type', '');
                  reg.Free;
              end;


        end;
     end;
  end;
end;

procedure TForm1.N10Click(Sender: TObject);
var status_text : string;
begin
if client_online then
begin
if sLabel1.Caption <> '' then status_text := sLabel1.Caption else status_text := N10.Caption;
JabberClient1.SendStr('<presence><show>chat</show><status>'+toescaping (status_text)+'</status><priority>0</priority></presence>');
Image2.Picture := Image7.Picture;
current_show := 'chat';
writeini ('options', 'form', 'last_show',current_show);
sBitBtn1.Caption := N10.Caption;
ActionList1.Actions[9].Execute;
end
else ActionList1.Actions[6].Execute;
end;

procedure TForm1.N11Click(Sender: TObject);
var status_text : string;
begin
if client_online then
begin
if sLabel1.Caption <> '' then status_text := sLabel1.Caption else status_text := N11.Caption;
JabberClient1.SendStr('<presence><show>away</show><status>'+toescaping (status_text)+'</status><priority>0</priority></presence>');
Image2.Picture := Image4.Picture;
current_show := 'away';
writeini ('options', 'form', 'last_show',current_show);
sBitBtn1.Caption := N11.Caption;
ActionList1.Actions[9].Execute;
end
else ActionList1.Actions[6].Execute;

end;

procedure TForm1.N12Click(Sender: TObject);
var status_text : string;
begin
if client_online then
begin
if sLabel1.Caption <> '' then status_text := sLabel1.Caption else status_text := N12.Caption;
JabberClient1.SendStr('<presence><show>xa</show><status>'+toescaping (status_text)+'</status><priority>0</priority></presence>');
Image2.Picture := Image9.Picture;
current_show := 'xa';
writeini ('options', 'form', 'last_show',current_show);
sBitBtn1.Caption := N12.Caption;
ActionList1.Actions[9].Execute;
end
else ActionList1.Actions[6].Execute;

end;

procedure TForm1.N13Click(Sender: TObject);
var status_text : string;
begin
if client_online then
begin
if sLabel1.Caption <> '' then status_text := sLabel1.Caption else status_text := N13.Caption;
JabberClient1.SendStr('<presence><show>dnd</show><status>'+toescaping (status_text)+'</status><priority>0</priority></presence>');
Image2.Picture := Image6.Picture;
current_show := 'dnd';
writeini ('options', 'form', 'last_show',current_show);
sBitBtn1.Caption := N13.Caption;
ActionList1.Actions[9].Execute;
end
else ActionList1.Actions[6].Execute;
end;

procedure TForm1.N14Click(Sender: TObject);
var status_text : string;
begin
if client_online then
begin
if sLabel1.Caption <> '' then status_text := sLabel1.Caption else status_text := N14.Caption;
JabberClient1.SendStr('<presence><show>invisible</show><status>'+toescaping (status_text)+'</status><priority>0</priority></presence>');
Image2.Picture := Image8.Picture;
current_show := 'invisible';
writeini ('options', 'form', 'last_show',current_show);
sBitBtn1.Caption := N14.Caption;
ActionList1.Actions[9].Execute;
end
else ActionList1.Actions[6].Execute;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
JabberClient1.Disconnect;
current_show := 'unavaliable';
sBitBtn1.Caption := N15.Caption;
client_online := false;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
//form7.show;
end;

procedure TForm1.N19Click(Sender: TObject);
begin

if (sListView1.ItemIndex >= 0 ) then
begin
//form1.Caption := sListView2.Items[sListView1.ItemIndex].Caption;
ActionList1.Actions[1].Execute;
end;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  if (sListView1.ItemIndex >= 0 ) then
  begin
    sListView1.Selected.EditCaption;
  end;
end;

procedure TForm1.N21Click(Sender: TObject);
var i, z : integer;
j : string;
begin
if (sListView1.ItemIndex >= 0 ) then
begin
  if sListView1.Selected.Selected then
  begin
    randomize;
    i := random (777);
    j := nick2info (sListView1.Selected.Caption, 'jid');
    z := sListView1.Selected.Index;
    sListView1.Items.Delete(z);
    jabberclient1.SendStr('<iq type="set" id="rc'+inttostr (i)+'" ><query xmlns="jabber:iq:roster">'+
    '<item subscription="remove" jid="'+j+'" /></query></iq>');
  end;
end;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  if (sListView1.ItemIndex >= 0 ) then
  begin
    if (sListView1.selected.Selected) then
    begin
      ActionList1.Actions[4].Execute;
    end;
  end;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  if (sListView1.ItemIndex >= 0 ) then
  begin
    if (sListView1.selected.Selected) then
    begin
      ActionList1.Actions[5].Execute;
    end;
  end;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
  if (sListView1.ItemIndex >= 0 ) then
  begin
    if (sListView1.selected.Selected) then
    begin
      ActionList1.Actions[3].Execute;
    end;
  end;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
form11.show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.N30Click(Sender: TObject);
begin
N9.Click;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
N10.Click;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
N11.Click;
end;

procedure TForm1.N33Click(Sender: TObject);
begin
N12.Click;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
N13.Click;
end;

procedure TForm1.N35Click(Sender: TObject);
begin
N14.Click;
end;

procedure TForm1.N36Click(Sender: TObject);
begin
N15.Click;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
if JabberClient1.Connected then form8.show;
end;

procedure TForm1.N38Click(Sender: TObject);
begin
if JabberClient1.Connected then form7.show;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
JabberClient1.Disconnect;
application.Terminate;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
N26.Click;
end;

procedure TForm1.N41Click(Sender: TObject);
var i : integer;
j : string;
begin
if (sListView1.ItemIndex >= 0 ) then
begin
  if sListView1.Selected.Selected then
  begin
    randomize;
    i := random (777);
    j := nick2info (sListView1.Selected.Caption, 'jid');
    if jabberclient1.Connected then
    begin
      jabberclient1.SendStr('<iq type="get" from="'+jabberclient1.JID+'@'+jabberclient1.JabberServer+'/'+jabberclient1.Resources+'" to="'
      +j+'" id="'+inttostr (i)+'"><query xmlns="jabber:iq:version"/></iq>');
      get_version_flag := true;
    end;
  end;
end;
end;

procedure TForm1.N42Click(Sender: TObject);
begin
ActionList1.Actions[8].Execute;
end;

procedure TForm1.N43Click(Sender: TObject);
begin
winexec ('plugins\media.exe', sw_show);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
ActionList1.Actions[11].Execute;
N5.Visible := false;
end;

procedure TForm1.N7771Click(Sender: TObject);
var n : integer;
begin


end;

procedure TForm1.N7Click(Sender: TObject);
 var
    menuItem : TMenuItem;
    p : tpoint;
    group : string;
    i, n, gid : integer;
    LG1: TlistGroup;
    group_exist : bool;
begin
group_exist := false;
i := random (777);
iq_id := 'grp'+inttostr(i);
InputQuery('Добавление новой группы', 'Название группы: ', group);
if (group <> '') then
begin

        //Поиск существования группы
        for n := 0 to sListView1.Groups.Count - 1 do
        begin
         if sListView1.Groups.Items[n].Header = group_name then
           group_exist := true;
        end;

        if not group_exist then
        begin
            //Создаем группу
            gid := sListView1.Groups.Count+1;
            LG1 := sListView1.Groups.Add;
            LG1.Header := group;
            LG1.GroupID := gid;
        end;



  if (sListView1.ItemIndex <> -1 ) then
  begin
    if sListView1.Selected.Selected then
    begin
      if jabberclient1.Connected then
      begin
        group_id := 0;
        group_jid := remove_res(nick2info (sListView1.Selected.Caption, 'jid'));
        group_name := group;

        for n := 0 to sListView1.Groups.Count - 1 do
        begin
         if sListView1.Groups.Items[n].Header = group_name then
           begin
           group_id := sListView1.Groups.Items[n].GroupID;
           end;
        end;

        if group_id = 0 then
        begin
          jabberclient1.SendStr('<iq type="set" id="grp'+inttostr(i)+'" >'+
          '<query xmlns="jabber:iq:roster">'+
          '<item name="'+nick2info (sListView1.Selected.Caption, 'uname')+
          '" jid="'+group_jid+'" ></item></query></iq>');
          group_update_flag := true;
        end
        else
        begin
          jabberclient1.SendStr('<iq type="set" id="grp'+inttostr(i)+'" >'+
          '<query xmlns="jabber:iq:roster">'+
          '<item name="'+nick2info (sListView1.Selected.Caption, 'uname')+
          '" jid="'+group_jid+'" >'+
          '<group>'+group+'</group></item></query></iq>');
          group_update_flag := true;
        end;

      end;
    end;
end
else application.MessageBox('Создание группы отменено', 'Вы не указали название группы, создание отменено!', 0);

end;






end;

procedure TForm1.N8Click(Sender: TObject);
begin
if N8.Checked then
begin
  N8.Checked := false;
  writeini ('options', 'form', 'sound', '0');
  N8.Caption := 'Звук [выкл]';
end else
begin
 N8.Checked := true;
 N8.Caption := 'Звук [вкл]';
 writeini ('options', 'form', 'sound', '1');
end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
ActionList1.Actions[6].Execute;
  if client_online then
    begin
    Image2.Picture := Image3.Picture;
    current_show := 'avaliable';
    sBitBtn1.Caption := N9.Caption;
    ActionList1.Actions[9].Execute;
    writeini ('options', 'form', 'last_show',current_show);
    end;
end;

procedure TForm1.PCGames1Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar( 'http://games.zokran.co.cc' ), '', '', SW_SHOW);
end;

procedure TForm1.remove_autorizeExecute(Sender: TObject);
var jd : string;
begin
  //Удаляем авторизизацию юзера
  if sListView1.Selected.Selected then
  begin

  //берем JID
  jd := nick2info (sListView1.Selected.Caption, 'jid');
  //Отрезаем ресурс если есть
  if pos ('/', jd) > 1 then jd := copy (jd, 1, pos ('/', jd)-1);

    jabberclient1.SendStr('<presence type="unsubscribed" to="'+jd+'" />');
    jabberclient1.SendStr('<presence type="unsubscribe" to="'+jd+'" />');
    jabberclient1.SendStr('<iq from="'+jabberclient1.JID+'@'+jabberclient1.JabberServer+'" type="set" id="push777" to="'+
    jabberclient1.JID+'@'+jabberclient1.JabberServer+'/'+jabberclient1.Resources+'" >'+
    '<query xmlns="jabber:iq:roster"><item subscription="to" jid="'+jd+'" /></query></iq>');
  end;
end;

procedure TForm1.req_autorizationExecute(Sender: TObject);
var n, j : string;
begin

  //Отправляем запрос на авторизацию
  if sListView1.Selected.Selected then
  begin
  j := nick2info (sListView1.Selected.Caption, 'jid');
  if form3.Edit1.text = '' then
  n := jabberclient1.JID
  else n := form3.Edit1.text;
  jabberclient1.SendStr('<presence type="subscribe" to="'+j+'" >'+
  '<nick xmlns="http://jabber.org/protocol/nick">'+n+'</nick></presence>');
  end;

end;

procedure TForm1.roster_menuPopup(Sender: TObject);
var itm, itm2 : TmenuItem;
i : integer;
begin

//Закладки
roster_menu.Items[6].Clear;
itm := TmenuItem.Create(owner);
itm.Name := 'bookmarks';
itm.Visible := false;
roster_menu.Items[6].Insert(0,itm);

//Группы
roster_menu.Items[7].Items[1].Clear;
for I := 0 to sListView1.Groups.Count - 1 do
begin

//Проверка существования пункта меню  в памяти
if ExistMemoByName(owner, 'grp_'+md5(sListView1.Groups.Items[i].Header)) then
begin
GetMenuItemByName(owner, 'grp_'+md5(sListView1.Groups.Items[i].Header)).Destroy;
end;

itm2 := TmenuItem.Create(owner);
itm2.Name := 'grp_'+md5(sListView1.Groups.Items[i].Header);
itm2.Caption := sListView1.Groups.Items[i].Header;
itm2.OnClick := MoveToGroup;
roster_menu.Items[7].Items[1].Insert(0,itm2);

end;

invite_popup_flag := true;
end;

procedure TForm1.RSS1Click(Sender: TObject);
begin
winexec ('plugins\rss.exe', sw_show);
end;

procedure TForm1.sBitBtn1Click(Sender: TObject);
var v : integer;
begin
if form2.CheckBox1.Checked then v := 240 else v := 270;
StatusMenu1.Popup(form1.left+45,form1.top+form1.Height-v);
end;

procedure TForm1.sButton1Click(Sender: TObject);
var bmp: TBitmap;
begin
StatusMenu1.Popup(form1.left+51,form1.top+form1.Height-370);
end;

procedure TForm1.showmainExecute(Sender: TObject);
begin
Timer1.Enabled := false;
ShowWindow(Application.Handle, sw_show);
form1.Show;
form1.FormStyle := fsStayOnTop;
form1.FormStyle := fsNormal;
end;

procedure TForm1.sLabel1Click(Sender: TObject);
var status : string;
begin
status := InputBox ('Статус', 'Введите Ваш статус', sLabel1.Caption);
        if JabberClient1.Connected then
        begin
          sLabel1.Caption := status;
          JabberClient1.SendStr('<presence><show>'+current_show+'</show><status>'+toescaping (status)+'</status><priority>0</priority></presence>');
          writeini ('options', 'form', 'status', status);
          ActionList1.Actions[9].Execute;
         end;
end;

procedure TForm1.sListView1Click(Sender: TObject);
var hint : string;
begin
if (sListView1.ItemIndex >= 0 ) then
begin
if nick2info (sListView1.Items[sListView1.ItemIndex].Caption, 'status') <> '' then
begin
hint := 'JID: '+nick2info (sListView1.Items[sListView1.ItemIndex].Caption, 'jid')+
#10+'Статус: '+nick2info (sListView1.Items[sListView1.ItemIndex].Caption, 'status');
end
else
hint := 'JID: '+nick2info (sListView1.Items[sListView1.ItemIndex].Caption, 'jid');
sListView1.Hint := hint;
end;
end;

procedure TForm1.sListView1Compare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
compare := Item1.ImageIndex - Item2.ImageIndex;
end;

procedure TForm1.sListView1DblClick(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm1.sListView1Edited(Sender: TObject; Item: TListItem;
  var S: string);
  var rnd : integer;
  group : string;
begin
randomize;
rnd := random (777);

  if (sListView1.ItemIndex >= 0 ) then
  begin
      roster_rename :=true; //флаг переименования контакта

      //Проверка вхождения в группу
      if nick2info (sListView1.Selected.Caption, 'groupid') <> '0' then
      begin
        group := nick2info (sListView1.Selected.Caption, 'group');
        if group <> '' then group := '<group>'+group+'</group>';
      end;

      //переименование контакта
      if JabberClient1.Connected then
      JabberClient1.SendStr('<iq type="set" id="nz'+inttostr(rnd)+'" >'+
      '<query xmlns="jabber:iq:roster"><item name="'+s+'" jid="'+
      nick2info (sListView1.Selected.Caption, 'jid')+'" >'+group+
      '</item></query></iq>');
  end;

end;

procedure TForm1.sListView1MouseLeave(Sender: TObject);
begin
sListView1.Hint := '';
end;

procedure TForm1.sListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
sListView1.Hint := '';
end;

procedure TForm1.sort_contactsExecute(Sender: TObject);
var i : integer;
begin

end;

procedure TForm1.status_in_confsExecute(Sender: TObject);
var i,c : integer;
nick : string;
begin

//Смена статуса во всех конференциях
for i := 0 to form7.sTabControl1.Tabs.Count - 1 do
begin
    //Поиск конфы в многомерном массиве (извлечение ника в случае успеха)
    nick := '';
    for c := 0 to high (forclose_confs_arr) - 1 do
    begin
      if forclose_confs_arr[c, 0] = AnsiLowerCase(form7.sTabControl1.Tabs.Strings[i]) then
      begin
        nick := form1.forclose_confs_arr[c, 1];
      end;
    end;

    JabberClient1.SendStr('<presence to="'+form7.sTabControl1.Tabs.Strings[i]+'/'+nick+'" >'+
    '<show>'+current_show+'</show><status>'+toescaping(sLabel1.Caption)+'</status><priority>5</priority></presence>');
end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
ShowWindow(Application.Handle, sw_Hide);
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
ActionList1.Actions[11].Execute;
end;

procedure TForm1.Vcard1Click(Sender: TObject);
begin
if (sListView1.ItemIndex >= 0 ) then
begin
  if sListView1.Selected.Selected then
  begin
    form10.ActionList1.Actions[2].Execute;
    form10.sPageControl1.TabIndex := 0;
    form10.sButton1.Visible := false;
    form10.sButton2.Visible := false;
    form10.sButton3.Visible := false;
    form10.sButton5.Visible := false;
    pub_vcard_view := true;
    pub_vcard_jid := nick2info (sListView1.Selected.Caption, 'jid');

    if pos ('/', pub_vcard_jid) > 1 then
    pub_vcard_jid := copy (pub_vcard_jid, 1, pos ('/', pub_vcard_jid)-1);

    form10.ActionList1.Actions[0].Execute;
  end;
end;

end;

procedure TForm1.VCard2Click(Sender: TObject);
begin
form10.sPageControl1.TabIndex := 0;
form10.sButton1.Visible := true;
form10.sButton2.Visible := true;
form10.sButton3.Visible := true;
form10.sButton5.Visible := true;
form10.Image1.Enabled := true;
form10.Caption := 'Личная VCard';
form10.show;
form10.sButton5.Click;
end;

procedure TForm1.XML1Click(Sender: TObject);
begin
form5.show;
end;

end.
