unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sGroupBox, ExtCtrls, sPanel, sLabel, sEdit, sButton,
  ComCtrls, sRichEdit, Buttons, sSpeedButton, Spin;

type
  TForm5 = class(TForm)
    sPanel1: TsPanel;
    sGroupBox1: TsGroupBox;
    sLabel1: TsLabel;
    sRichEdit1: TsRichEdit;
    sButton1: TsButton;
    Memo1: TMemo;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    sSpeedButton1: TsSpeedButton;
    Timer1: TTimer;
    procedure sRichEdit1Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.FormResize(Sender: TObject);
begin
memo1.Width := form5.Width-150;
sButton1.Left := form5.Width-100;
end;

procedure TForm5.sButton1Click(Sender: TObject);
begin
    if form1.JabberClient1.Connected then
    begin
    form1.JabberClient1.SendStr(memo1.Text);
    Memo1.Clear;
    end;
end;

procedure TForm5.sRichEdit1Change(Sender: TObject);
begin
sRichEdit1.Perform(WM_VScroll, SB_BOTTOM, 0);
if sRichEdit1.Lines.Capacity > SpinEdit1.Value then timer1.Enabled := true;
end;

procedure TForm5.sSpeedButton1Click(Sender: TObject);
begin
sRichEdit1.Clear;
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
sSpeedButton1.Click;
timer1.Enabled := false;
end;

end.
