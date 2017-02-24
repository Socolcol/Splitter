program Splitter;



{$R *.dres}

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Path in 'Path.pas' {Form4},
  Unit3 in 'Unit3.pas' {Form3};

var
  H: THandle;

{$R *.res}

begin
  H := CreateMutex(nil, True, 'SplitteLaunch');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
  showmessage('одна копия уже запущена!');
  Exit;
  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Splitter';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
