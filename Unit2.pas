unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, ComCtrls, sPageControl, ExtCtrls, sPanel,
  FileCtrl, inifiles, sCheckBox, sLabel;

type
  TForm2 = class(TForm)
    sPanel1: TsPanel;
    sButton1: TsButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CheckBox1: TCheckBox;
    FileListBox1: TFileListBox;
    TabSheet2: TTabSheet;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    TabSheet3: TTabSheet;
    sLabel1: TsLabel;
    FileListBox2: TFileListBox;
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure FileListBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

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

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if not CheckBox1.Checked then
begin
  writeini ('options', 'form', 'skin', '0');
  form1.sSkinManager1.Active := false;
end else
begin
  writeini ('options', 'form', 'skin', '1');
  form1.sSkinManager1.Active := true;
end;

end;

procedure TForm2.FileListBox1Click(Sender: TObject);
var skn_name : string;
begin
  skn_name := copy (extractfilename (FileListBox1.FileName), 0, length (extractfilename (FileListBox1.FileName))-4);
  if skn_name <> '' then
  begin
    form1.sSkinManager1.SkinName := skn_name;
    writeini ('options', 'form', 'skin_name', skn_name);
  end;

end;

procedure TForm2.FileListBox2Change(Sender: TObject);
var
dirname : string;
begin
if FileListBox2.ItemIndex <> -1 then
begin
dirname := FileListBox2.Items.Strings[FileListBox2.ItemIndex];
dirname := stringreplace (dirname, '[', '', [rfReplaceAll, rfIgnoreCase]);
dirname := stringreplace (dirname, ']', '', [rfReplaceAll, rfIgnoreCase]);
writeini ('options', 'system', 'sounds', dirname);
end;

end;

procedure TForm2.FormCreate(Sender: TObject);
var snd_dir : string;
itms : integer;
begin
//Указываем папку звуковых схем
FileListBox2.Directory := ExtractFilePath(ParamStr(0))+'\sounds\';
//Удаляем лишние папки
FileListBox2.Items.Delete(0);
FileListBox2.Items.Delete(0);

//Проверка выбрана ли звуковая схема
snd_dir := readini ('options', 'system', 'sounds');
if snd_dir = '' then snd_dir := 'lamp';

//Установка выбраной схемы
for itms := 0 to FileListBox2.Items.Count - 1 do
begin
if FileListBox2.Items.Strings[itms] = '['+snd_dir+']' then
FileListBox2.ItemIndex := itms;
end;

//Указываем папку скинов
FileListBox1.Directory := ExtractFilePath(ParamStr(0))+'\skins';
form1.sSkinManager1.SkinName := readini ('options', 'form', 'skin_name');
FileListBox1.filename := readini ('options', 'form', 'skin_name')+'.asz';
if readini ('options', 'form', 'skin') = '1' then CheckBox1.Checked := true
else CheckBox1.Checked := false;

if readini ('options', 'system', 'autoconnect') = '1' then
begin
sCheckBox1.Checked := true;
end
else sCheckBox1.Checked := false;

if readini ('options', 'system', 'show_offline') = '1' then
begin
sCheckBox2.Checked := true;
end
else sCheckBox2.Checked := false;

if readini ('options', 'system', 'chek_update') = '1' then
begin
sCheckBox3.Checked := true;
end
else sCheckBox3.Checked := false;

end;

procedure TForm2.sButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm2.sButton2Click(Sender: TObject);
begin
//form1.sSkinManager1.SkinName
end;

procedure TForm2.sCheckBox1Click(Sender: TObject);
begin

if sCheckBox1.Checked then
begin
  writeini ('options', 'system', 'autoconnect', '1');
end
else
begin
  writeini ('options', 'system', 'autoconnect', '0');
end;


end;

procedure TForm2.sCheckBox2Click(Sender: TObject);
begin

if sCheckBox2.Checked then
begin
  writeini ('options', 'system', 'show_offline', '1');
end
else
begin
  writeini ('options', 'system', 'show_offline', '0');
end;

end;

procedure TForm2.sCheckBox3Click(Sender: TObject);
begin

if sCheckBox3.Checked then
begin
  writeini ('options', 'system', 'chek_update', '1');
end
else
begin
  writeini ('options', 'system', 'chek_update', '0');
end;

end;

end.
