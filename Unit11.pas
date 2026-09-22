unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, sGroupBox;

type
  TForm11 = class(TForm)
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    sButton1: TsButton;
    sButton2: TsButton;
    procedure sButton2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm11.sButton1Click(Sender: TObject);
var i : integer;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (pos ('@', Edit2.Text) > 0) then
  begin
    randomize;
    i := random (777);
    form1.iq_id := 'nc'+inttostr(i);
    form1.new_contact_flag := true;
    form1.new_contact_jid := edit2.Text;
    form1.new_contact_nick := edit1.Text;
    form1.JabberClient1.SendStr('<iq type="set" id="nc'+inttostr(i)+'" >'+
    '<query xmlns="jabber:iq:roster">'+
    '<item name="'+Edit1.Text+'" jid="'+Edit2.Text+'" />'+
    '</query></iq>');
    close;
    edit1.Text := '';
    edit2.Text := '';
  end
  else showmessage ('Поля заполнены неверно!');
end;

procedure TForm11.sButton2Click(Sender: TObject);
begin
close;
end;

end.
