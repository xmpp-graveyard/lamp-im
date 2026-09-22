unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm16 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm16.FormCreate(Sender: TObject);
begin
//Автоконнект
if form2.sCheckBox1.Checked then form1.N9.Click;
end;

end.
