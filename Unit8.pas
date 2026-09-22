unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sButton, sComboBox, sGroupBox, md5hash2, ComCtrls,
  acProgressBar, inifiles;

type
  TForm8 = class(TForm)
    sGroupBox1: TsGroupBox;
    sComboBox1: TsComboBox;
    sGroupBox2: TsGroupBox;
    sButton1: TsButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sComboBox3: TsComboBox;
    sButton3: TsButton;
    sLabel4: TsLabel;
    sButton4: TsButton;
    ListView1: TListView;
    sProgressBar1: TsProgressBar;
    procedure sButton4Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  conf_id : integer=0;

implementation

uses Unit7, Unit1, Unit3;

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

procedure TForm8.FormCreate(Sender: TObject);
begin
sComboBox1.Text := readini ('options', 'conf_form', 'last_conf');
sComboBox3.Text := readini ('options', 'conf_form', 'last_nick');
end;

procedure TForm8.FormShow(Sender: TObject);
begin
if sComboBox3.Text = '' then sComboBox3.Text := form3.Edit1.text;
end;

procedure TForm8.ListView1Click(Sender: TObject);
begin

if ListView1.ItemIndex >= 0 then
begin
  sComboBox1.Text := ListView1.Selected.Caption;
end;

end;

procedure TForm8.ListView1DblClick(Sender: TObject);
begin
  if (ListView1.ItemIndex >= 0) and (sComboBox3.Text <> '') then
  begin
    sComboBox1.Text := ListView1.Selected.Caption;
    sButton3.Click;
  end;
end;

procedure TForm8.sButton1Click(Sender: TObject);
var i : integer;
serv : string;
begin
if form1.JabberClient1.Connected then
begin
ListView1.Clear;
randomize;
i := random (777);
form1.conference_list_flag := true;
form1.conference_list_id := 'cl'+inttostr (i);
form1.JabberClient1.SendStr('<iq type="get" to="conference.'+form1.JabberClient1.JabberServer+
'" id="cl'+inttostr (i)+'" ><query xmlns="http://jabber.org/protocol/disco#items"/></iq>');
sButton1.Enabled := false;
end;
end;

procedure TForm8.sButton3Click(Sender: TObject);
var i : integer;
not_found_flag : bool;
begin
//Флаг поиска
not_found_flag := true;

form7.show;
form7.ActionList1.Actions[0].Execute;
sComboBox1.Items.Add(sComboBox1.Text);
close;

  //Поиск конфы в многомерном массиве (замена ника в случае успеха)
  for i := 0 to high (form1.forclose_confs_arr) - 1 do
  begin
    if form1.forclose_confs_arr[i, 0] = AnsiLowerCase(sComboBox1.Text) then
    begin
      not_found_flag := false;
      form1.forclose_confs_arr[i, 1] := sComboBox3.Text;
      exit;
    end;
  end;

//Помещение новой конфы и ника в массив
if not_found_flag then
begin
form1.forclose_confs_arr[conf_id, 0] := AnsiLowerCase(sComboBox1.Text);
form1.forclose_confs_arr[conf_id, 1] := sComboBox3.Text;
conf_id := conf_id +1;
if conf_id > 195 then conf_id := 0;
end;

end;

procedure TForm8.sButton4Click(Sender: TObject);
begin
close;
end;

procedure TForm8.sComboBox1Change(Sender: TObject);
begin
writeini ('options', 'conf_form', 'last_conf', sComboBox1.Text);
end;

procedure TForm8.sComboBox3Change(Sender: TObject);
begin
writeini ('options', 'conf_form', 'last_nick', sComboBox3.Text);
end;

end.
