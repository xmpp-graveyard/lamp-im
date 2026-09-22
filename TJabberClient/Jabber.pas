unit Jabber;

interface

uses
  SysUtils, Classes, JabberSock, WinSock, IdHashMessageDigest, IdCoderMime, iDhasH, Dialogs, Controls, jbconst, GmXML, Windows;

type


  //  TOnRecveive = procedure (Sender: TObject; Socket: TSocket; Buffer: Pointer; BufLen: LongWord);
  //

  TMechanisms = (mecDIGEST_MD5, mecPLAIN, mecNONE);


  TSend = record
    ID: String;
  end;
  PSend = ^TSend;


// Описание событий
  TOnConnect = procedure(Sender: TObject) of object;
  TOnJabberOnline = procedure(Sender: TObject) of object;
  TOnDisconnect = procedure(Sender: TObject) of object;
  TOnConnectError = procedure(Sender: TObject) of object;
  TOnGetRoster = procedure(Sender: TObject; RosterList: String) of object;
  TOnGetBookMarks = procedure(Sender: TObject; BookMarks: String) of object;
  TOnMessage = procedure(Sender: TObject; XMLMessage: String) of object;
  TOnIQ = procedure(Sender: TObject; XMLMessage: String) of object;
  TOnPresence = procedure(Sender: TObject; Presence: String) of object;
  TOnLoginEror = procedure(Sender: TObject; Error: String) of object;
  TOnSendData = procedure(Sender: TObject; SendStr: String) of object;
  TOnReceiveData = procedure(Sender: TObject; SendStr: String) of object;
  //  TOnAdvPktParse = procedure(Sender: TObject; Buffer: Pointer; BufLen: LongWord; Incoming: Boolean) of object;


  TJabberClient = class(TComponent)
  private
    FUserName: String;          // имя до @
    FUserServer: String;          // имя после @
    FUnicalID: String;
    FJabberServer: String;          // Имя Jabber сервера
    FJabberHOST: String;

    FJabberPort: Word;              // порт для подключения
    FJID: String;              // Имя пользователя
    FPassword: String;              // Пароль на подключение
    FSocket: TMySocket;             // Сокет
    FConnected: Boolean;            // Подсоединен ли?
    FJabberOnLine: Boolean;         // Залогинен ли Jabber
    FResource: String;              // Название ресурса
    FUserStatus: Byte;
    FOnConnect: TOnConnect;
    FOnJabberOnline: TOnJabberOnline;
    FOnDisconnect: TOnDisconnect;
    FOnConnectError: TOnConnectError;
    FOnSendData: TOnSendData;
    FOnReceiveData: TOnReceiveData;
    FOnGetRoster: TOnGetRoster;
    FOnGetBookMarks: TOnGetBookMarks;
    FOnMessage: TOnMessage;
    FOnIQ: TOnIQ;
    FOnPresence: TOnPresence;
    FOnPktParseA: TOnAdvPktParse;
    FOnLoginError: TOnLoginEror;

    procedure _OnConnect(Sender: TObject);
    procedure _OnJabberOnline(Sender: TObject);
    procedure _OnDisconnect(Sender: TObject);
    procedure _OnConnectError(Sender: TObject);
    procedure _OnGetRoster(Sender: TObject; RosterList: String);
    procedure _OnGetBookMarks(Sender: TObject; BookMarks: String);
    procedure _OnReceive(Sender: TObject; Socket: TSocket; Buffer: Pointer; BufLen: LongWord);
    procedure _OnSend(Sender: TObject; StrData: String);
    procedure _OnMessage(Sender: TObject; XMLMessage: String);
    procedure _OnPresence(Sender: TObject; Presence: String);
    procedure _OnPktParseA(Sender: TObject; Buffer: Pointer; BufLen: LongWord; Incoming: Boolean);
    procedure _OnLoginError(Sender: TObject; Error: String);
    procedure _OnIQ(Sender: TObject; XMLMessage: String);
    procedure FreeSocket;
    procedure ParseReceive(Buffer: Pointer; BufLen: LongWord);
    // ----- Процедуры для работы с сервером ------
    procedure SendAuth_1;
    procedure SendPassword;
    procedure SetPresence;
    procedure SaveMsg(Value: String);
  protected
    { Protected declarations }
    XMLStr: String;
    function GetDigest:String;
    function GetUniqueID: String;
    function ReFactStr(Value: String): String;
    procedure parseNameValues(list: TStringlist; str: String);
//    CheckedStr := StringReplace(CheckedStr, '''', '"', [rfReplaceAll]);
    function WideStringReplace(Value: String; const OldPattern: String; const NewPattern: String; Flags: TReplaceFlags): String;
    function GetMechainsms(XMLItem: TGmXmlNode): TMechanisms;
    function GetSASLResponse(AStr: string): string;
    procedure SendAuthType(AuthType: TMechanisms);
    procedure SendBind(ABind: String);
  public
///
    ac_flag: bool;              // флаг регистрации нового акка
    reg_ok_flag: bool;              // флаг регистрации нового акка
    reg_user: string;              // логин нового акка
    reg_pass: string;              // пароль нового акка
    reg_serv: string;             //сервер для регистрации
    UseHost: bool;          // флаг конекта через другой хост

    function StrForParsing(var Value: String): String;
///
    constructor Create(AOwner: TComponent); override;
    procedure Connect(MyStatus: Byte);
    procedure Disconnect;
    procedure SendStr(Str: String);
    procedure GetRoster;
    procedure GetBookMarks;
    property Connected: Boolean read FConnected;
    property JabberOnline: Boolean read FJabberOnLine;
    property UserName: String read FUserName;
    property UserServer: String read FUserServer;
    procedure SendMessage(strTo: String; strType: String; strBody: String);
    function DeleteBadSymbols(Value: String): String;
  published
    property OnConnect: TOnConnect read FOnConnect write FOnConnect;
    property OnDisconnect: TOnDisconnect read FOnDisconnect write FOnDisconnect;
    property OnConnectError: TOnConnectError read FOnConnectError write FOnConnectError;
    property OnReceiveData: TOnReceiveData read FOnReceiveData write FOnReceiveData;
    property OnSendData: TOnSendData read FOnSendData write FOnSendData;
    property OnJabberOnline: TOnJabberOnline read FOnJabberOnline write FOnJabberOnline;
    property OnGetRoster: TOnGetRoster read FOnGetRoster write FOnGetRoster;
    property OnGetBookMarks: TOnGetBookMarks read FOnGetBookMarks write FOnGetBookMarks;
    property OnMessage: TOnMessage read FOnMessage write FOnMessage;
    property OnPresence: TOnPresence read FOnPresence write FOnPresence;
    property OnIQ: TOnIQ read FOnIQ write FOnIQ;
    property OnPktParseA: TOnAdvPktParse read FOnPktParseA write FOnPktParseA;
    property OnLoginError: TOnLoginEror read FOnLoginError write FOnLoginError;
    property JabberServer: String read FJabberServer write FJabberServer;
    property JabberHOST: String read FJabberHOST write FJabberHOST;
    property JabberPort: Word read FJabberPort write FJabberPort;
    property JID: String read FJID write FJID;
    property Password: String read FPassword write FPassword;
    property Resources: String read FResource write FResource;
  end;

procedure Register;

implementation

uses Math;

{$R Jabber.dcr}

procedure Register;
begin
  RegisterComponents('Jabber', [TJabberClient]);
end;

{ TJabberClient }

procedure TJabberClient.Connect(MyStatus: Byte);
begin
  // в потоке надо создать
  FUserStatus := MyStatus;
  if not Connected then begin
    FSocket := TMySocket.Create;
    if UseHost then
       FSocket.Host := JabberHOST
       else FSocket.Host := JabberServer;
    FSocket.Port := JabberPort;
    FSocket.OnConnectError := _OnConnectError;
    FSocket.OnConnectProc := _OnConnect;
    FSocket.OnDisconnect := _OnDisconnect;
    FSocket.OnReceiveProc := _OnReceive;
    Fsocket.OnPktParseA := _OnPktParseA;
    FSocket.Connect;
    FUserName := JID;
    FUserServer := JabberServer;
  end else
    SetPresence;

//  FSocket.
end;

constructor TJabberClient.Create(AOwner: TComponent);
begin
//
  inherited;
  JabberServer := '';
  JabberPort := 5222;
  Resources := 'LampIM';
  FSocket := nil;
end;

procedure TJabberClient._OnConnect(Sender: TObject);
begin
  FConnected := True;

  //register acc
  if ac_flag then
  begin
      SendStr('<?xml version="1.0"?><stream:stream xmlns:stream="http://etherx.jabber.org/streams" xmlns="jabber:client" to="'+reg_serv+'" >');
      if Assigned(OnConnect) then FOnConnect(Self);
  end
  else
  begin
     //  SendStr('<?xml version="1.0"?> <stream:stream xmlns:stream="http://etherx.jabber.org/streams" xmlns="jabber:client" to="' + FUserServer + '">');
     // при подключении к серверу сразу отправляем ему строку подключения.
     { TODO : Здесь необходимо правильно настроить язык }
     SendStr('<?xml version="1.0"?> <stream:stream xmlns:stream="http://etherx.jabber.org/streams" version="1.0" xmlns="jabber:client" to="' + FUserServer + '" xml:lang="en" xmlns:xml="http://www.w3.org/XML/1998/namespace">');
     if Assigned(OnConnect) then FOnConnect(Self);
  end;

end;

procedure TJabberClient._OnDisconnect(Sender: TObject);
begin
  FConnected := False;
  FJabberOnLine := False;
  if Assigned(OnDisconnect) then
    FOnDisconnect(Self);
end;

procedure TJabberClient._OnConnectError(Sender: TObject);
begin
  if Assigned(OnConnectError) then
    FOnConnectError(Self);
end;

function TJabberClient.DeleteBadSymbols(Value: String): String;
var
  i: DWORD;
begin
//
  Result := Value;
  for i := 0 to Length(Value) do begin
    if (Result[i + 1] < #$20) and (Result[i + 1] <> #$0D) and (Result[i + 1] <> #$0A) then
      Result[i + 1] := '?';
  end;
end;

procedure TJabberClient.Disconnect;
begin
  if FConnected then begin
    FreeSocket;
    _OnDisconnect(Self);
  end;
end;

procedure TJabberClient.FreeSocket;
begin
  if (FSocket <> nil) then
    FreeAndNil(FSocket);
end;

procedure TJabberClient.SendStr(Str: String);
var
  bufSize: DWord;
  MyStr: UTF8String;
  AParseString: String;
begin
//  MySocket.SendData(10, Length(Memo1.Text));
  AParseString := DeleteBadSymbols(Str);

  MyStr :=UTF8Encode (AParseString);
  bufSize := Length(MyStr);
  if bufSize > 65534 then
    Raise Exception.Create(MSG_BigDataForSend);

//  For i := 0 to Length(MyStr) do
//    buf[i] := ord(Mystr[i]);
  FSocket.SendData((@MyStr[1])^, bufSize);
  {Добавляем обработчик отправлений}
  _OnSend(Self, Str);
end;

procedure TJabberClient._OnReceive(Sender: TObject; Socket: TSocket;
  Buffer: Pointer; BufLen: LongWord);
begin
//
{ TODO : Обработчик пришедшего }
  ParseReceive(Buffer, BufLen);

//  if Assigned(OnReceive) then
//    FOnReceive(Self, Buffer, BufLen);
//  ShowMessage('RCV');*)
end;




procedure TJabberClient._OnSend(Sender: TObject; StrData: String);
begin
//
  if Assigned(OnSendData) then
    FOnSendData(Sender, StrData);

end;

procedure TJabberClient.ParseReceive(Buffer: Pointer; BufLen: LongWord);
var

  buf: array[0..CNetPktLen - 1] of Byte;
  j: LongWord;
  StrEnd: AnsiString;
  i: Integer;
  bPEnd: Boolean;
  CheckedStr: String;
  XMLParser: TGmXML;
  XMLItem, tmpItem: TGmXmlNode;
  RcvStanza, xml_data: String;
  id: String;
  tmpStr: String;
  AuthType: TMechanisms;
{
  StrStream: TMemoryStream;
  idIndex: Integer;
  FileStr: TFileStream;
  strCompare: WideString;
  MyStr: TStringList;
  teststr: WideString;
  tmpPrivate: WideString;
  pBuff: PWideChar;
}
begin
  j := 0;
  strEnd := '';

  // получили пришедший буфер
  for i:= 0 To BufLen - 1 do begin
    Buf[j] := PByte(LongWord(Buffer) + i)^;
    Inc(j);
    StrEnd := StrEnd + AnsiChar(buf[i]);
  end;

  bPEnd := true;

  // Все что пришло добавили в XMLSTR
//  StrEnd := UTF8ToWideString(StrEnd);
//  StrEnd := UTF8ToString(StrEnd);
  XMLStr := XMLStr + UTF8ToString(StrEnd);

  // теперь пока не кончатся пришедшие XML данные крутимся
  while bPEnd do begin

    //  Сопоставляем полная строка или нет если пусто то выходим
    if XMLStr = '' then
      exit;

//    if CheckedStr[Length(CheckedStr) - 1] = '<' then ;



    // в CheckStr вытаскиваем завершенные XML данные для дальнейшего разбора
    // в XMLStr остается продолжение если оно есть
    CheckedStr := StrForParsing(XMLStr);

//    SaveMsg(UTF8ToWideString(XMLStr));
    // если Строка для обработки пустая то выходим
    if CheckedStr = '' then
      exit;

    // имеем полную строку преобразуем ее в UNICODE
//    CheckedStr := UTF8ToString(CheckedStr);

    // заменяем символы ' на "
    CheckedStr := WideStringReplace(CheckedStr, '''', '"', [rfReplaceAll]);

     // генерируем событие что пришли данные
    if Assigned(OnReceiveData) then
      FOnReceiveData(Self, CheckedStr);


    //ответ регистрации акка
if ac_flag then
begin
      XMLParser := TGmXML.Create(self);
      XMLParser.Text := CheckedStr;
      XMLItem := XMLParser.Nodes.Root;
      xml_data := XMLItem.Name;

      if (xml_data = 'stream:stream') then
      sendstr ('<iq type="set" to="'+reg_serv+'" id="'+XMLItem.Params.Values['id']+
      '" ><query xmlns="jabber:iq:register"><username>'+reg_user+'</username>'+
      '<password>'+reg_pass+'</password></query></iq>');

      if xml_data = 'iq' then
      begin

          if XMLItem.Params.Values['type'] = 'error' then
          begin
             if pos ('conflict', CheckedStr) > 1 then
               showmessage ('Ошибка: данное имя пользователя уже зарегистрировано!')
             else if pos ('forbidden', CheckedStr) > 1 then
               showmessage ('Ошибка: запрещено!')
             else
                showmessage ('Ошибка регистрации!'+CheckedStr);

            ac_flag := false;
          end;

          if XMLItem.Params.Values['type'] = 'result' then
          begin
            showmessage ('Пользователь '+reg_user+'@'+reg_serv+' успешно зарегестрирован!');
            reg_ok_flag := true;
            ac_flag := false;
          end;
      end;

end
else
begin

     // заходим в защищенную секцию и начинаем разбор пришедешего XML
    // ?
    try
      //  Загружаем полученное от сервера в парсер
      XMLParser := TGmXML.Create(self);

      // Имеем юникодную строку необходимо теперь ее в парсер загрузить
      XMLParser.Text := CheckedStr;

      // теперь в XMLParser имеем прешидший XML поток в Unicode
      // выделяем узел
      XMLItem := XMLParser.Nodes.Root;

      // Получаем имя пришедшего элемента MESSAGE, IQ, PRESENCE etc
      RcvStanza := XMLItem.Name;

      CheckedStr := '';

      // получаем идентификатор потока

      if RcvStanza = 'stream:stream' then begin
        FUnicalID := XMLItem.Params.Values['id'];
        // Делаем запрос на аутентификацию
//        SendAuth_1;
      end;

      if RcvStanza = 'stream:error' then begin
        Raise Exception.Create(MSG_StreamError);
      end;

      if RcvStanza = 'failure' then begin
        _OnLoginError(Self, XMLParser.Text);
        Raise Exception.Create(MSG_Failure);
      end;

      // Получаем список механизмов регистрации
      if RcvStanza = 'stream:features' then begin
        // если секция механизм аутентификации MECHANISM
        tmpItem := XMLItem.Children.NodeByName['mechanisms'];
        if tmpItem <> nil then begin
          AuthType := mecNONE;
          if tmpItem.Params.Values['xmlns'] = XMLNS_XMPP_SASL then
            AuthType := mecDIGEST_MD5;
          // Отправляем на сервер механизм аутентификации
          if AuthType <> mecNONE then
            SendAuthType(AuthType)
          else
            Raise Exception.Create(MSG_StreamError);
        end;
        // если секция BIND
        tmpItem := XMLItem.Children.NodeByName['bind'];
        if tmpItem <> nil then begin
          if tmpItem.Params.Values['xmlns'] = XMLNS_XMPP_BIND then
            SendBind(Resources);
        end;

      end;

      // Получили <challenge
      if RcvStanza = 'challenge' then begin
        // отвечаем серверу на его сообщение кодированное
        tmpStr := GetSASLResponse(XMLItem.AsString);
        if tmpStr <> '' then
          SendStr('<response xmlns="urn:ietf:params:xml:ns:xmpp-sasl">' + tmpStr + '</response>')
        else
          SendStr('<response xmlns="urn:ietf:params:xml:ns:xmpp-sasl"/>');
      end;

      // Получили <success
      if RcvStanza = 'success' then begin
        if XMLItem.Params.Values['xmlns'] = XMLNS_XMPP_SASL then
          SendStr('<?xml version="1.0"?> <stream:stream xmlns:stream="http://etherx.jabber.org/streams" version="1.0" xmlns="jabber:client" to="' + FUserServer + '" xml:lang="en" xmlns:xml="http://www.w3.org/XML/1998/namespace">');

      end;



      // ----------------------------------------- получили IQ идет обработка IQ
      if RcvStanza = 'iq' then begin
//        FJabberOnLine := True;
        _OnIQ(Self, XMLParser.Text);

        id := XMLItem.Params.Values['id'];

        // получили bind
        if id = 'bind_1' then begin
          SendStr('<iq type="set" id="' + GetUniqueID + '" ><session xmlns="' + XMLNS_XMPP_SESSION + '"/></iq>');
        end;

        if XMLItem.Params.Values['type'] = 'result' then begin
          // все мы в ONLINE
          if XMLItem.Children.NodeByName['session'] <> nil then
            if XMLItem.Children.NodeByName['session'].Params.Values['xmlns'] = XMLNS_XMPP_SESSION then
              if not FJabberOnLine then begin

                //получаем ростр
                GetRoster;

                //устанавливаем состояние
              //  SetPresence;
              //  FJabberOnLine := True;
              //  _OnJabberOnline(Self);

              end;
        end;




        // если запрос пароля то отправляем пароль
        if id = 'auth_1' then begin
          tmpStr := XMLItem.Params.Values['type'];
          if tmpStr = 'error' then begin
            _OnLoginError(Self, XMLParser.Text);
            FJabberOnLine := False;
            FConnected := False;
          end else
            SendPassword;
        end;

        // ответ на правильный пароль
        if id = 'auth_2' then begin
          tmpStr := XMLItem.Params.Values['type'];
          if tmpStr = 'result' then begin
            // Запрашиваем ростер
            GetRoster;
            // Запрашиваем BookMarks
            GetBookMarks;
          end;
          if tmpStr = 'error' then begin
            _OnLoginError(Self, XMLParser.Text);
            FJabberOnLine := False;
            FConnected := False;
          end;
        end;

        tmpstr := '';
        if XMLItem.Children.NodeByName['query'] <> nil then
          tmpStr := XMLItem.Children.NodeByName['query'].Params.Values['xmlns'];


        //tmpStr := XMLItem.Params.
        // если ростер
        if tmpStr = XMLNS_ROSTER then
        begin
            _OnGetRoster(Self, XMLParser.Text);
          //SetPresence;
          if not FJabberOnLine then
          begin
            FJabberOnLine := True;
            _OnJabberOnline(Self);
          end;

        end;

      end;
      // --------------------- окончание IQ -----------------------------

      // --------------------- Начало обработки MESSAGE ----------------------
      if RcvStanza = 'message' then begin
        _OnMessage(self, XMLParser.Text);
      end;
      // --------------------- окончание MESSAGE -----------------------------

      // --------------------- Начало обработки PRESENCE
      if RcvStanza = 'presence' then begin
        _OnPresence(self, XMLParser.Text);
      end;
      // --------------------- окончание PRESENCE -----------------------------

    except
      on E: Exception do begin
 //       Showmessage('Exception - в модуле обработки команд сервера'#13 + XMLItem.AsString );
//        SaveMsg('~~~~==== START ERROR'#13 + E.Message + XMLItem.AsString+#13+'END ERROR ====~~~~');

        Exit;
      end
    end;
    FreeAndNil(XMLParser);
  end;

 end;
end;

function TJabberClient.ReFactStr(Value: String): String;
var
  EndStr: String;
  i,j: Integer;
begin
//
  j := 0;
  EndStr := '';
  for i := 1 to Length(Value) do begin
    if Value[i] = #13 then
      j := 0;
    EndStr := EndStr + Value[i];
    if j > 250 then begin
      EndStr := EndStr + #13#10;
      j := 0;
    end;
    inc(j);
  end;
  Result := EndStr;
end;

// отправка на сервер типа аутентификации
procedure TJabberClient.SendBind(ABind: String);
var
  BindStr: String;
begin
//
  BindStr := '<iq type="set" id="bind_1" ><bind xmlns="urn:ietf:params:xml:ns:xmpp-bind"><resource>' + Resources + '</resource></bind></iq>';
  SendStr(BindStr);
end;

procedure TJabberClient.SendAuthType(AuthType: TMechanisms);
var
  Mec: string;
begin
  case AuthType of
    mecDIGEST_MD5: Mec := 'DIGEST-MD5';
    mecPLAIN: Mec := 'PLAIN';
  end;
  SendStr('<auth xmlns="urn:ietf:params:xml:ns:xmpp-sasl" mechanism="' + Mec +  '"/>');
end;

procedure TJabberClient.SendAuth_1;
var
  XMLParser: TGmXML;
  XMLItem: TGmXmlNode;
  str: String;
begin
  XMLParser := TGmXML.Create(self);
  XMLItem := XMLParser.Nodes.AddOpenTag('iq');
  XMLItem.Params.Values['type'] := 'get';
  XMLItem.Params.Values['id'] := 'auth_1';
//  XMLItem.Params.Values['to'] := JabberServer;
  XMLItem.Params.Values['to'] := FUserServer;

  XMLItem := XMLItem.Children.AddOpenTag('query');
  XMLItem.Params.Values['xmlns'] := 'jabber:iq:auth';
  XMLItem := XMLItem.Children.AddOpenTag('username');
//  XMLItem.AsString := JID;
  XMLItem.AsString := FUserName;
  str := XMLParser.Text;
  SendStr(str);
  FreeAndNil(XMLParser);
end;

procedure TJabberClient.SendPassword;
var
  XMLParser: TGmXML;
  XmlItem: TGmXmlNode;
begin
{ TODO : Отправляем на сервер запрос GET должны поместить в очередь на сверку с пришедшим. }
  XMLParser := TGmXML.Create(self);
  XMLItem := XMLParser.Nodes.AddOpenTag('iq');
  XmlItem.Params.Values['type'] := 'set';
  XmlItem.Params.Values['id'] := 'auth_2';
  XmlItem.Params.Values['to'] := FUserServer;

  XmlItem := XmlItem.Children.AddOpenTag('query');
  XmlItem.Params.Values['xmlns'] := 'jabber:iq:auth';
  XmlItem := XmlItem.Children.AddOpenTag('username');
  XmlItem.AsString := FUserName;
  XmlItem.Children.AddCloseTag;

  XmlItem := XmlItem.Children.AddOpenTag('digest');
  XmlItem.AsString := GetDigest;
  XmlItem.Children.AddCloseTag;

  XmlItem := XmlItem.Children.AddOpenTag('resource');
  XmlItem.AsString := Resources;
  XmlItem.Children.AddCloseTag;
{  with XmlItem do begin
    Children.AddOpenTag('username');
    AsString := JID;
    ShowMessage(AsString);
    AddCloseTag;
    Children.AddOpenTag('digest');
    AsString := GetDigest;
    Children.AddCloseTag;
    Children.AddOpenTag('resource');
    AsString := Resources;
    Children.AddCloseTag;
  end;
{  XmlItem.AsString := JID;
  XmlItem := XmlQuery.Children.AddOpenTag('digest');
  XmlItem.AsString := GetDigest;
  XmlItem := XmlQuery.Children.AddOpenTag('resource');
  XmlItem.AsString := Resources;}
  SendStr(XMLParser.Text);
  FreeAndNil(XMLParser);
end;

function ShaHASH(Fkey: String): String;
var
  fdig, fdigest: string;
  _hasher: TIdHashMessageDigest5;
begin
  fkey := Trim(fkey);
  _hasher := TIdHashMessageDigest5.Create;

//  fdigest := THash_SHA1.CalcString(fkey, nil, fmtCOPY);
  fdigest := _hasher.HashStringAsHex(Fkey);
  FreeAndNil(_hasher);
  fdig := Lowercase(fdigest);
  Result := fdig;
end;

procedure TJabberClient.GetBookMarks;
var
  XMLParser: TGmXML;
  XmlItem: TGmXmlNode;
begin
  XMLParser := TGmXML.Create(self);
  
  XMLItem := XMLParser.Nodes.AddOpenTag('iq');
  XmlItem.Params.Values['type'] := 'get';
  XmlItem.Params.Values['id'] := GetUniqueID;
  XmlItem := XmlItem.Children.AddOpenTag('query');
  XmlItem.Params.Values['xmlns'] := 'jabber:iq:private';
  XmlItem := XmlItem.Children.AddOpenTag('storage');
  XmlItem.Params.Values['xmlns'] := 'storage:bookmarks';
//  FJabberSend.Add(MySet);
  SendStr(XMLParser.Text);
  FreeAndNil(XMLParser);
end;

function TJabberClient.GetDigest: String;
var
  DigKey: String;
begin
  DigKey := ShaHash(Trim(FUnicalID) + Trim(Password));
  Result := DigKey;
end;

// определяем механизм регистрации пока знаем только 2
// DIGEST-MD5
// PLAIN
function TJabberClient.GetMechainsms(XMLItem: TGmXmlNode): TMechanisms;
var
  Mec: TGmXmlNode;
  i: Integer;
  Child: TGmXmlNode;
  Str: TStringList;
begin
  Result := mecNONE;
  Mec := XMLItem.Children.NodeByName['mechanisms'];

  str := TStringList.Create;
  for I := 0 to Mec.Children.Count - 1 do begin
    Child := Mec.Children.Node[i];
    if Child.Name = 'mechanism' then
      Str.Add(Child.AsString);
  end;
  // имеем список типов авторизации
  // приоритет отдаем сначала DIGESt-MD5 потом PLAIN и так далее
  if Str.Find('DIGEST-MD5', i) then
    Result := mecDIGEST_MD5
  else
    if Str.Find('PLAIN', i) then
      Result := mecPLAIN;
    
  FreeAndNil(Str);

end;

{ TODO : Переписать способ установки статуса }
procedure TJabberClient.SetPresence;
var
  XMLParser: TGmXML;
  XmlItem: TGmXmlNode;
  UserStatus: String;
begin
  if FUserStatus <> S_ONLINE then begin
    UserStatus := 'show';
    if FUserStatus = S_FFC then
      UserStatus := 'chat';
    if FUserStatus = S_AWAY then
      UserStatus := 'away';
    if FUserStatus = S_NA then
      UserStatus := 'xa';
  end;
  XMLParser := TGmXML.Create(self);
  XmlItem := XMLParser.Nodes.AddOpenTag('presence');
  XmlItem := XmlItem.Children.AddOpenTag('priority');
  XmlItem.AsInteger := 5;
  SendStr(XMLParser.Text);
  FreeAndNil(XMLParser);
//             }
end;

procedure TJabberClient._OnJabberOnline(Sender: TObject);
begin
  if Assigned(OnJabberOnLine) then
    FOnJabberOnline(Self);
end;

// Отправка запроса на сервер на получение Ростера
procedure TJabberClient.GetRoster;
var
  XMLParser: TGmXML;
  XMLItem: TGmXmlNode;
begin
  XMLParser := TGmXML.Create(self);
  XMLItem := XMLParser.Nodes.AddOpenTag('iq');
  XmlItem.Params.Values['type'] := 'get';
  XMLItem.Params.Values['id'] := GetUniqueID;
  XMLItem := XMLItem.Children.AddOpenTag('iq');
  XMLItem.Params.Values['xmlns'] := 'jabber:iq:roster';
  SendStr(XMLParser.Text);
  FreeAndNil(XMLParser);
end;

function TJabberClient.GetSASLResponse(AStr: string): string;
var
  _hasher: TIdHashMessageDigest5;
  _decoder: TIdDecoderMime;
  _encoder: TIdEncoderMime;
  _nc: integer;
  _realm: string;
  _nonce: string;
  _cnonce: string;
  // -------
  azjid: Widestring;
  resp, pass, serv, uname, uri, az, dig, a2, p1, p2, e, c: string;
  a1: AnsiString;
  pairs: TStringlist;
  a1s: TMemoryStream;
  tmpstr: string;
  tmp: TBytes;
begin
  uname := UserName;
  serv := UserServer;
  pass := Password;

  _decoder := TIdDecoderMIME.Create(nil);
  c := _decoder.DecodeString(AStr);
  freeandnil(_decoder);

  pairs := TStringlist.Create();
  parseNameValues(pairs, c);
  _nc := 1;
  _realm := pairs.Values['realm'];
  _nonce := pairs.Values['nonce'];
  tmpstr := copy(c, 1, 7);
  if tmpstr = 'rspauth' then begin
    Result := '';
    Exit
  end;

  _realm := serv;
  // Start the insanity.............
  e := '1234567890123456789012345678930';
  _encoder := TIdEncoderMIME.Create(nil);
  e := _encoder.Encode(e);
  _hasher := TIdHashMessageDigest5.Create;
  _cnonce := Lowercase(_hasher.HashStringAsHex(e));

  azjid := uname + '@' + serv;
  uri := 'xmpp/' + serv;

  resp := 'username="' + uname + '",';
  resp := resp + 'realm="' + _realm + '",';
  resp := resp + 'nonce="' + _nonce + '",';
  resp := resp + 'cnonce="' + _cnonce + '",';
  resp := resp + 'nc=' + Format('%8.8d', [_nc]) + ',';
  resp := resp + 'qop=auth,';
  resp := resp + 'digest-uri="' + uri + '",';
  resp := resp + 'charset=utf-8,';

  // actually calc the response...
  e := uname + ':' + _realm + ':' + pass;

  tmp := _hasher.HashString(e);
  // NB: H(A1) is just 16 bytes, not HEX(H(A1))
  a1s := TMemoryStream.Create();
  a1s.Write(tmp[0], 16);

  if (az <> '') then
      a1 := ':' + _nonce + ':' + _cnonce + ':' + az
  else
      a1 := ':' + _nonce + ':' + _cnonce;
//  a1 := tmp + a1;
  a1s.Write(Pointer(a1)^, Length(a1));
  a1s.Seek(0, soFromBeginning);
//  ha1 := _hasher.HashValue(a1s);

  a2 := 'AUTHENTICATE:' + uri;
  p1 := Lowercase(_hasher.HashStreamAsHex(a1s));
  FreeAndNil(a1s);
  p2 := Lowercase(_hasher.HashStringAsHex(a2));

  e := p1 + ':' + _nonce + ':' + Format('%8.8d', [_nc]) + ':' + _cnonce + ':auth:' +
       p2;
  dig := Lowercase(_hasher.HashStringAsHex(e));

  if (az <> '') then
      resp := resp + 'authzid="' + az + '",';
  resp := resp + 'response=' + dig;

  Result := _encoder.Encode(resp);
  FreeAndNil(_encoder);
  FreeAndNil(_hasher);
end;

function TJabberClient.GetUniqueID: String;
var
  IntTime: Double;
  StrHex: String;
begin
//
  IntTime := Double(Now) + Random(1000);;
  StrHex := (FloatToStr(IntTime));
  StrHex := ShaHASH(StrHex);
  StrHex := copy(strhex, 1, 10);
  Result := StrHex;
end;

procedure TJabberClient.parseNameValues(list: TStringlist; str: String);
var
    i: integer;
    q: boolean;
    n,v: String;
    ns, vs: integer;
begin
    // Parse a list of:
    // foo="bar",thud="baz"
    // 12345678901234567890

    // foo=bar,
    // 12345678

    // ns = 1
    // vs = 5
    // i = 9
    ns := 1;
    vs := 1;
    q := false;
    for i := 0 to Length(str) - 1 do begin
        if (not q) then begin
            if (str[i] = ',') then begin
                // end of name-value pair
                if (v = '') then
                    v := Copy(str, vs, i - vs);
                list.Add(n);
                list.Values[n] := v;
                ns := i + 1;
                n := '';
                v := '';
            end
            else if (str[i] = '"') then begin
                // if we are quoting... start here
                q := true;
                vs := i + 1;
            end
            else if (str[i] = '=') then begin
                // end of name, start of value
                n := Copy(str, ns, i - ns);
                vs := i + 1;
            end;
        end
        else if (str[i] = '"') then begin
            v := Copy(str, vs, i - vs);
            q := false;
        end;
    end;
end;

procedure TJabberClient._OnGetBookMarks(Sender: TObject; BookMarks: String);
begin
 if Assigned(OnGetBookMarks) then
    FOnGetBookMarks(Sender, BookMarks);
end;

// Событие получаем ROSTER
procedure TJabberClient._OnGetRoster(Sender: TObject;
  RosterList: String);
begin
 if Assigned(OnGetRoster) then
    FOnGetRoster(Sender, RosterList);
end;

procedure TJabberClient._OnIQ(Sender: TObject; XMLMessage: String);
begin
//
 if Assigned(OnIQ) then
    FOnIQ(Self, XMLMessage);
end;


procedure TJabberClient._OnMessage(Sender: TObject; XMLMessage: String);
begin
 if Assigned(OnMessage) then
    FOnMessage(Self, XMLMessage);
end;

// strTo кто получатель strType -- ??? strBody - текст сообщения
procedure TJabberClient.SendMessage(strTo, strType, strBody: String);
var
  XMLParser: TGmXML;
  XMLItem: TGmXmlNode;
begin
{ TODO : Отправляем на сервер запрос GET должны поместить в очередь на сверку с пришедшим. }
  XMLParser := TGmXML.Create(self);
  XMLItem := XMLParser.Nodes.AddOpenTag('message');

  XMLItem.Params.Values['from'] := FUserName + '@' + FUserServer;
  XMLItem.Params.Values['to'] := strTo;
  XMLItem.Params.Values['type'] := strType;
  XMLItem.Params.Values['id'] := GetUniqueID;

  XmlItem := XmlItem.Children.AddOpenTag('body');
  XMLItem.AsDisplayString := strBody;
//  ShowMessage(XMLParser.Root.AsString);
  SendStr(XMLParser.Text);
  FreeAndNil(XMLParser);
end;

procedure TJabberClient._OnPresence(Sender: TObject; Presence: String);
begin
 if Assigned(OnPresence) then
    FOnPresence(Self, Presence);
end;

procedure TJabberClient.SaveMsg(Value: String);
var
  buf: array [0..65535] of byte;
  i: word;
  tmpStr: String;
begin
//
//  tmpstr := copy(Value, 1, 30);
//  tmpStr := tmpStr + '......................';
//  tmpStr := tmpstr + copy(Value, length(Value) - 30, 31);
  tmpStr := Value;
  if tmpstr = '' then
    Exit;
  For i := 0 to Length(tmpstr) do begin
    buf[i] := byte(tmpstr[i+1]);
  end;

//  FileStr := TFileStream.Create('c:\j.log', fmOpenWrite);
//  FileStr.Seek(FileStr.Size, soFromBeginning);
//  FileStr.Write(buf, length(tmpstr));

//  Filestr.Write(#10'-----------------'#10#10, 20);
//  FileStr.Free;



end;

procedure TJabberClient._OnPktParseA(Sender: TObject; Buffer: Pointer;
  BufLen: LongWord; Incoming: Boolean);
begin
//
 if Assigned(OnPktParseA) then
    FOnPktParseA(Self, Buffer, BufLen, Incoming);
end;

function TJabberClient.StrForParsing(var Value: String): String;
var
  i: Word;
  strResult: String;
  strLast: String;
  j: Integer;
  inStr: Boolean;
  ch1, ch2: String;
  FullStr: String;
  ALength: Integer;
begin
  Value := Trim(Value);
  ALength := Length(Value);
  j := 0;
  inStr := False;

  // проверяем на тэг XML если это тэг идентифицирующй XML то вырезаем его.
  if copy(Value, 1, 5) = '<?xml' then begin
    strResult := copy(Value, pos('>',Value) + 1, ALength);
    strLast := '';
    // теперь не закрыьую строку stream:stream закрываем, чтоб проще было работать
    if pos('<stream:stream', strResult) <> 0 then
      strResult := WideStringReplace(strResult, '>', '/>', []);
    Value := strResult;
  end;


  FullStr := Value;

  if Length(Value) > 0 then
    if Value[Length(Value) - 1] = '<' then begin
      Value := FullStr;
      Result := '';
      Exit;
    end;

  for i := 0 to ALength - 1 do begin
    if (Value[i + 1] = '''') or (Value[i + 1] = '"') then
      inStr := not Instr;
    if not InStr then begin

      ch1 := Value[i + 1];
      ch2 := Value[i + 2];
      if (ch1 = '<') and (ch2 <> '/') then
        Inc(j);
      if ((ch1 = '<') and (ch2 = '/')) or
         ((ch1 = '/') and (ch2 = '>'))then
        dec(j);
    end;

    if j = 0 then begin
      strResult := copy(Value, 1, i);
      Value := copy(Value, i + 1, ALength);
      j := 1;
      if Length(Value) = 0 then begin
        Value := FullStr;
        Result := '';
        Exit;
      end;
    try
      while Value[j] <> '>' do begin
        if (Value[j] <> '>') then
          strResult := strResult + Value[j];
        Value := copy(Value, 2, Length(Value));
        if Value = '' then begin
          Value := FullStr;
          Result := '';
          Exit;
        end;
    end;
    except
      on E: exception do begin
        ShowMessage('Системная ошибка: '#13#13 + Value + intToStr(j) + strResult + #13#13#13 + FullStr + #13#13#13 + ' ' + #13 + E.Message);
        Value := FullStr;
        Result := '';
        Exit;
      end;

    end;
      strResult := strResult + '>';
      Value := copy(Value, 2, Length(Value));
      Result := strResult;
      Exit;
    end;
  end;
  Value := FullStr;
  Result := '';
end;

function TJabberClient.WideStringReplace(Value: String; const OldPattern,
  NewPattern: String; Flags: TReplaceFlags): String;
var
  SearchStr, Patt, NewStr: String;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := WideUpperCase(Value);
    Patt := WideUpperCase(OldPattern);
  end else
  begin
    SearchStr := Value;
    Patt := OldPattern;
  end;
  NewStr := Value;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;

//
end;

procedure TJabberClient._OnLoginError(Sender: TObject; Error: String);
begin
  if Assigned(OnLoginError) then
    FOnLoginError(Self, Error);
  Disconnect;
end;



end.
