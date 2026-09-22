unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TForm13 = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.FormShow(Sender: TObject);
begin
webbrowser1.Navigate('http://zokran.co.cc/lamp/media/index.php');
end;

end.
