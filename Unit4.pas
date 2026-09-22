unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, ComCtrls, acPNG, ExtCtrls,shellapi;

type
  TForm4 = class(TForm)
    sButton1: TsButton;
    RichEdit1: TRichEdit;
    Image1: TImage;
    Bevel1: TBevel;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    procedure sButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sLabelFX1Click(Sender: TObject);
    procedure sLabelFX2Click(Sender: TObject);
    procedure sLabelFX3Click(Sender: TObject);
    procedure sLabelFX1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sLabelFX1MouseLeave(Sender: TObject);
    procedure sLabelFX2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sLabelFX2MouseLeave(Sender: TObject);
    procedure sLabelFX3MouseLeave(Sender: TObject);
    procedure sLabelFX3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit16, Unit15;

{$R *.dfm}

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Image1.Picture.Bitmap.FreeImage;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
Image1.Picture := form15.Image1.Picture;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
form16.show;
sleep (100);
form16.hide;
form16.show;
sleep (50);
form16.hide;
end;

procedure TForm4.sButton1Click(Sender: TObject);
begin
close;
end;

procedure TForm4.sLabel2Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar( 'http://coolbot.narkoz.com.ua' ), '', '', SW_SHOW);
end;

procedure TForm4.sLabelFX1Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar( 'http://lamp-im.narkoz.com.ua' ), '', '', SW_SHOW);
end;

procedure TForm4.sLabelFX1MouseLeave(Sender: TObject);
begin
sLabelFX1.Font.Style := [];
sLabelFX1.Left := 45;
end;

procedure TForm4.sLabelFX1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
sLabelFX1.Font.Style := [fsBold];
sLabelFX1.Left := 42;
end;

procedure TForm4.sLabelFX2Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar( 'http://narkoz.com.ua' ), '', '', SW_SHOW);
end;

procedure TForm4.sLabelFX2MouseLeave(Sender: TObject);
begin
sLabelFX2.Font.Style := [];
sLabelFX2.Left := 55;
end;

procedure TForm4.sLabelFX2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
sLabelFX2.Font.Style := [fsBold];
sLabelFX2.Left := 52;
end;

procedure TForm4.sLabelFX3Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar( 'http://coolbot.narkoz.com.ua' ), '', '', SW_SHOW);
end;

procedure TForm4.sLabelFX3MouseLeave(Sender: TObject);
begin
sLabelFX3.Font.Style := [];
sLabelFX3.Left := 44;
end;

procedure TForm4.sLabelFX3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
sLabelFX3.Font.Style := [fsBold];
sLabelFX3.Left := 41;
end;

end.
