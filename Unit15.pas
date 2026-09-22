unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls;

type
  TForm15 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm15.Timer1Timer(Sender: TObject);
begin
form1.Hide;
form15.Show;
Timer2.Enabled := true;
Timer1.Enabled := false;
end;

procedure TForm15.Timer2Timer(Sender: TObject);
begin
close;
Timer2.Enabled := false;
end;

end.
