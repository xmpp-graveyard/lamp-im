unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, ComCtrls, sPageControl, ExtCtrls, sPanel, sButton,
  acProgressBar, ExtDlgs, ActnList, registry, Base64Unit;

type
  TForm10 = class(TForm)
    sPanel1: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    sTabSheet4: TsTabSheet;
    sTabSheet5: TsTabSheet;
    sPanel2: TsPanel;
    sButton1: TsButton;
    sButton2: TsButton;
    Image1: TImage;
    sButton3: TsButton;
    sButton4: TsButton;
    sButton5: TsButton;
    sProgressBar1: TsProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    ActionList1: TActionList;
    get_vcard: TAction;
    send_vcard: TAction;
    RichEdit1: TRichEdit;
    vk_clear: TAction;
    sButton6: TsButton;
    SaveDialog1: TSaveDialog;
    sButton7: TsButton;
    procedure FormResize(Sender: TObject);
    procedure get_vcardExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure send_vcardExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure vk_clearExecute(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  vcreg : treginifile;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm10.FormResize(Sender: TObject);
begin
Edit1.Width := form10.Width-145;
Edit2.Width := form10.Width-145;
Edit3.Width := form10.Width-145;
Edit4.Width := form10.Width-145;
Edit5.Width := form10.Width-145;
Edit6.Width := form10.Width-145;
Edit7.Width := form10.Width-145;
Edit8.Width := form10.Width-145;
Edit9.Width := form10.Width-145;
Edit10.Width := form10.Width-145;
Edit11.Width := form10.Width-145;
Edit12.Width := form10.Width-145;
Edit13.Width := form10.Width-145;
Edit14.Width := form10.Width-145;
Edit15.Width := form10.Width-145;
sButton3.Left := form10.Width-300;
sButton5.Left := form10.Width-200;
sButton4.Left := form10.Width-100;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
//ActionList1.Actions[0].Execute;
end;

procedure TForm10.get_vcardExecute(Sender: TObject);
var i : integer;
begin
//Запрос на получение VCard
if form1.JabberClient1.Connected then
begin
  form1.vcard_flag := true;
  randomize;
  i := random (777);

  if (form1.pub_vcard_view = true) and (form1.pub_vcard_jid <> '') then
  begin
    form1.JabberClient1.SendStr('<iq type="get" to="'+form1.pub_vcard_jid+'" id="code'+inttostr (i)+'" >'+
    '<vCard xmlns="vcard-temp" prodid="-//HandGen//NONSGML vGen v1.0//EN" version="2.0" /></iq>');
  end else
  begin
    form1.JabberClient1.SendStr('<iq type="get" to="'+form3.sEdit1.Text+'@'+form3.sEdit3.text+'" id="code'+inttostr (i)+'" >'+
    '<vCard xmlns="vcard-temp" prodid="-//HandGen//NONSGML vGen v1.0//EN" version="2.0" /></iq>');
  end;

  sProgressBar1.Visible := true;
  sProgressBar1.Position := 10;
end;
end;

procedure TForm10.Image1Click(Sender: TObject);
begin
form1.ActionList1.Actions[2].Execute;
end;

procedure TForm10.sButton1Click(Sender: TObject);
begin
form1.ActionList1.Actions[2].Execute;
end;

procedure TForm10.sButton2Click(Sender: TObject);
begin
Image1.Picture.Bitmap.FreeImage;
end;

procedure TForm10.sButton3Click(Sender: TObject);
begin
ActionList1.Actions[1].Execute;
end;

procedure TForm10.sButton4Click(Sender: TObject);
begin
close;
sButton7.Visible := false;
end;

procedure TForm10.sButton5Click(Sender: TObject);
begin
form1.pub_vcard_view := false;
form10.sButton3.Visible := true;
ActionList1.Actions[0].Execute;
end;

procedure TForm10.sButton6Click(Sender: TObject);
var i : integer;
begin
i := random (777);
SaveDialog1.FileName := 'vcard'+inttostr(i)+'.bmp';
if SaveDialog1.Execute then
Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm10.sButton7Click(Sender: TObject);
begin
 form1.ActionList1.Actions[10].Execute;
 close;
end;

procedure TForm10.send_vcardExecute(Sender: TObject);
Const
Base64MaxLength = 72;
var i, hFile : integer;
pic_type, fway, pic_buf, xml_str, base64String : string;
f: TextFile; // файл
Buf:Array[0..2] Of Byte;
Base64 : TBase64;
iqid : string;
begin
randomize;
i := random (777);

vcreg := treginifile.Create ('software');
pic_type := vcreg.readString('LampIM', 'avatar_type', '');
if pic_type <> '' then
begin
fway := ExtractFilePath(ParamStr(0))+'avatar\avatar'+pic_type;

   if FileExists(fway) then
   begin

    Application.ProcessMessages;
    base64String:='';
    hFile:=FileOpen(fway,fmOpenReadWrite);
    AssignFile(f,fway+'.b64');
    Rewrite(f);
    FillChar(Buf,SizeOf(Buf),#0);
      Repeat
      Base64.ByteCount:=FileRead(hFile,Buf,SizeOf(Buf));
      Move(Buf,Base64.ByteArr,SizeOf(Buf));
      base64String:=base64String+CodeBase64(Base64);
      If Length(base64String)=Base64MaxLength Then
        Begin {If Length}
//            Writeln(f,base64String);
            pic_buf := pic_buf + base64String;
            base64String:='';
        End;  {If Length}
      Until Base64.ByteCount < 3;
    pic_buf := pic_buf + base64String;
//    Writeln(f,pic_buf);
    CloseFile(f);
    FileClose(hFile);
    if fileexists (fway+'.b64') then deletefile (fway+'.b64');

  end;

   if length (pic_buf) > 0  then
   begin
     pic_type := copy (pic_type, 2, length (pic_type));
     xml_str := '<PHOTO><TYPE>image/'+pic_type+'</TYPE><BINVAL>'+pic_buf+'</BINVAL></PHOTO>';
   end;

end;
//Отправка вкард
form1.up_vcard_flag := true;
sProgressBar1.Visible := true;
iqid := 'vc'+inttostr (i);
form1.iq_id := iqid;
form1.JabberClient1.SendStr('<iq type="set" id="'+iqid+'" >'+
'<vCard xmlns="vcard-temp" prodid="-//HandGen//NONSGML vGen v1.0//EN" version="2.0" >'+
'<FN>'+Edit1.Text+'</FN><NICKNAME>'+Edit2.Text+'</NICKNAME>'+xml_str+
'<BDAY>'+Edit3.Text+'</BDAY><ADR><HOME/><STREET>'+Edit11.Text+'</STREET>'+
'<LOCALITY>'+Edit12.Text+'</LOCALITY><REGION>'+Edit13.Text+'</REGION><PCODE>'+Edit14.Text+'</PCODE>'+
'<CTRY>'+Edit15.Text+'</CTRY></ADR><TEL><HOME/><VOICE/><NUMBER>'+Edit4.Text+'</NUMBER>'+
'</TEL><EMAIL><INTERNET/><USERID>'+Edit6.Text+'</USERID></EMAIL>'+
'<TITLE>'+Edit9.Text+'</TITLE><ROLE>'+Edit10.Text+'</ROLE><ORG><ORGNAME>'+Edit7.Text+'</ORGNAME>'+
'<ORGUNIT>'+Edit8.Text+'</ORGUNIT></ORG><URL>'+Edit5.Text+'</URL>'+
'<DESC>'+RichEdit1.Text+'</DESC></vCard></iq>');
sProgressBar1.Position := 10;
Timer1.Enabled := true;
sButton5.Enabled := false;
sButton3.Enabled := false;
vcreg.Free;

end;

procedure TForm10.Timer1Timer(Sender: TObject);
begin
if sProgressBar1.Position > 95 then sProgressBar1.Position := 0;
sProgressBar1.Position := sProgressBar1.Position + 5;
end;

procedure TForm10.vk_clearExecute(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
edit7.Clear;
edit8.Clear;
edit9.Clear;
edit10.Clear;
edit12.Clear;
edit13.Clear;
edit14.Clear;
edit15.Clear;
RichEdit1.Clear;
Image1.Picture.Bitmap.FreeImage;
end;

end.
