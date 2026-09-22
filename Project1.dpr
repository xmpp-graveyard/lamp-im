program Project1;

uses
  Forms,
  windows,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Popup in 'Popup.pas',
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11},
  Unit15 in 'Unit15.pas' {Form15},
  Unit14 in 'Unit14.pas' {Form14},
  Unit16 in 'Unit16.pas' {Form16};

{$R *.res}

var ExtendedStyle : integer;

begin
    //Запрещение запуска 2 копии программы...
    CreateFileMapping(HWND($FFFFFFFF), nil, PAGE_READWRITE, 0, 1024, 'Lamp IM');
    if GetLastError <> ERROR_ALREADY_EXISTS then
      begin
  Application.Initialize;
//  ExtendedStyle:=GetWindowLong (application.Handle, GWL_EXSTYLE);
  //SetWindowLong(Application.Handle, GWL_EXSTYLE,
  //ExtendedStyle or WS_EX_TOOLWINDOW AND NOT WS_EX_APPWINDOW);
  //Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := false;
  Application.Title := 'Lamp IM';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm16, Form16);
  Application.Run;
      end
  else
      begin
         Application.MessageBox('Можно запустить только одну копию Lamp IM!', 'Внимание!');
         halt;
      end;
end.
