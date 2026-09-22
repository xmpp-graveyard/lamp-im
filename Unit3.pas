unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sEdit, sLabel, sGroupBox, ExtCtrls, inifiles,
  sCheckBox;

type
  TForm3 = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    sLabel3: TsLabel;
    sEdit2: TsEdit;
    sButton1: TsButton;
    sButton2: TsButton;
    Label1: TLabel;
    Edit1: TEdit;
    sButton3: TsButton;
    Timer1: TTimer;
    sEdit3: TsEdit;
    sLabel2: TsLabel;
    sGroupBox2: TsGroupBox;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sEdit4: TsEdit;
    sEdit5: TsEdit;
    sCheckBox1: TsCheckBox;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
    procedure sEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sEdit3Change(Sender: TObject);
    procedure sEdit5Change(Sender: TObject);
    procedure sEdit4Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

  const
  C1 = 52845;
  C2 = 22719;

implementation

uses Unit1, Unit6, Unit2;

{$R *.dfm}

function Decode(const S: AnsiString): AnsiString;
const
  Map: array[ansiChar] of Byte = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 0, 0, 63, 52, 53,
    54, 55, 56, 57, 58, 59, 60, 61, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2,
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 0, 0, 0, 0, 0, 0, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
    46, 47, 48, 49, 50, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0);
var
  I: LongInt;
begin
  case Length(S) of
    2:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6);
        SetLength(Result, 1);
        Move(I, Result[1], Length(Result))
      end;
    3:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12);
        SetLength(Result, 2);
        Move(I, Result[1], Length(Result))
      end;
    4:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12) +
          (Map[S[4]] shl 18);
        SetLength(Result, 3);
        Move(I, Result[1], Length(Result))
      end
  end
end;

function PreProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Decode(Copy(SS, 1, 4));
    Delete(SS, 1, 4)
  end
end;

function InternalDecrypt(const S: AnsiString; Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(S[I]) + Seed) * Word(C1) + Word(C2)
  end
end;

function Decrypt(const S: AnsiString; Key: Word): AnsiString;
begin
  Result := InternalDecrypt(PreProcess(S), Key)
end;

function Encode(const S: AnsiString): AnsiString;
const
  Map: array[0..63] of Char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
    'abcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I: LongInt;
begin
  I := 0;
  Move(S[1], I, Length(S));
  case Length(S) of
    1:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64];
    2:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] +
        Map[(I shr 12) mod 64];
    3:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] +
        Map[(I shr 12) mod 64] + Map[(I shr 18) mod 64]
  end
end;

function PostProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Encode(Copy(SS, 1, 3));
    Delete(SS, 1, 3)
  end
end;

function InternalEncrypt(const S: AnsiString; Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := ansiChar(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(Result[I]) + Seed) * Word(C1) + Word(C2)
  end
end;

function Encrypt(const S: AnsiString; Key: Word): AnsiString;
begin
  Result := PostProcess(InternalEncrypt(S, Key))
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


procedure TForm3.Edit1Change(Sender: TObject);
begin
  writeini ('options', 'account', 'nick', edit1.Text);
end;

procedure TForm3.FormCreate(Sender: TObject);
const
 my_key = 33189;

begin
sedit2.Text := decrypt (readini ('options', 'account', 'pass'), my_key);
sedit1.Text := readini ('options', 'account', 'jid');
sedit3.Text := readini ('options', 'account', 'server');
sedit4.Text := readini ('options', 'account', 'host');
sedit5.Text := readini ('options', 'account', 'port');
edit1.Text := readini ('options', 'account', 'nick');

  if (readini ('options', 'account', 'UseHost') = '1')then
  begin
  form1.JabberClient1.JabberHOST := sEdit4.Text;
try
  form1.JabberClient1.JabberPort := strtoint (sedit5.Text);
except
end;
  sCheckBox1.Checked := true;
  end;

end;

procedure TForm3.sButton1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (sEdit1.Text <> '') and (sEdit3.Text <> '')  then
  begin
    form1.JabberClient1.JID := sEdit1.Text;
    form1.JabberClient1.Password := sEdit2.Text;
    form1.JabberClient1.JabberServer := sEdit3.Text;
try
    form1.JabberClient1.JabberPort := strtoint(sedit5.Text);
except

end;
    close;
      if readini ('options', 'account', 'nick') <> '' then
      form1.caption := 'Lamp IM - '+readini ('options', 'account', 'nick');
  end
  else form6.SwowPopupWnd ('Не все поля заполнены!');
end;

procedure TForm3.sButton2Click(Sender: TObject);
begin
close;
end;

procedure TForm3.sButton3Click(Sender: TObject);
begin
 if (sEdit2.Text <> '') and (sEdit3.Text <> '') and (sEdit1.Text <> '') then
  begin
    form1.jabberclient1.reg_user :=sEdit1.Text;
    form1.jabberclient1.reg_pass :=sEdit2.Text;
    form1.jabberclient1.reg_serv :=sEdit3.Text;
    form1.jabberclient1.JabberServer := sEdit3.Text;
    form1.jabberclient1.ac_flag := true;
    form1.jabberclient1.Connect(1);
    timer1.Enabled := true;
  end
  else form6.SwowPopupWnd ('Не все поля заполнены!');
end;

procedure TForm3.sCheckBox1Click(Sender: TObject);
begin

if sCheckBox1.Checked then
begin
  writeini ('options', 'account', 'UseHost', '1');
  form1.JabberClient1.UseHost := true;
  form1.JabberClient1.JabberHOST := sEdit4.Text;
end
else
begin
  writeini ('options', 'account', 'UseHost', '0');
  form1.JabberClient1.UseHost := false;
  form1.JabberClient1.JabberHOST := sEdit4.Text;
end;

end;

procedure TForm3.sEdit1Change(Sender: TObject);
begin
  writeini ('options', 'account', 'jid', sedit1.Text);
end;

procedure TForm3.sEdit2Change(Sender: TObject);
const
 my_key = 33189;
begin
  writeini ('options', 'account', 'pass', Encrypt(sedit2.Text, my_key));
end;

procedure TForm3.sEdit3Change(Sender: TObject);
begin
  writeini ('options', 'account', 'server', sedit3.Text);
end;

procedure TForm3.sEdit4Change(Sender: TObject);
begin
  writeini ('options', 'account', 'host', sedit4.Text);
  form1.JabberClient1.JabberHOST := sEdit4.Text;
end;

procedure TForm3.sEdit5Change(Sender: TObject);
begin
  writeini ('options', 'account', 'port', sedit5.Text);
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if form1.JabberClient1.ac_flag = false then
  begin
    form1.JabberClient1.Disconnect;
    //if form1.JabberClient1.reg_ok_flag then form1.JabberClient1.Connect(1);
    timer1.Enabled := false;
  end;
end;

end.
