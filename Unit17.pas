unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, Buttons, ExtCtrls;

type
  TForm17 = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm17.FormShow(Sender: TObject);
begin
try
WebBrowser1.Navigate('http://zokran.co.cc/lamp/rss/index.php');
except
end;
end;

procedure TForm17.SpeedButton1Click(Sender: TObject);
begin
try
WebBrowser1.GoBack;
except
end;
end;

procedure TForm17.SpeedButton2Click(Sender: TObject);
begin
try
WebBrowser1.GoForward;
except
end;
end;

procedure TForm17.SpeedButton3Click(Sender: TObject);
begin
try
WebBrowser1.Stop;
except
end;
end;

procedure TForm17.SpeedButton4Click(Sender: TObject);
begin
try
WebBrowser1.Navigate('http://zokran.co.cc/lamp/rss/index.php');
except
end;
end;

end.
