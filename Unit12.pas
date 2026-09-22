unit Unit12;

interface

uses
  Classes;

type
  lampsnd = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses unit6;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure lampsnd.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ lampsnd }

procedure lampsnd.Execute;
begin
form6.Caption := 'asdasd';
end;

end.
