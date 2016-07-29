unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TlHelp32, ShellAPI,
  Vcl.ExtCtrls, IniFiles, Vcl.Menus, FileCtrl, IOUtils;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    show1: TMenuItem;
    close1: TMenuItem;
    state1: TMenuItem;
    N1: TMenuItem;
    Memo2: TMemo;
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure show1Click(Sender: TObject);
    procedure close1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TexturePars(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gamer : integer;
  FileName: string = '';   //для лога
  DateTime1,DateTime2:TDateTime;
  AppData,GameFolder,razr:string;

implementation

{$R *.dfm}

uses Unit2;
{$R data.RES}

function IsRunning(sName: string): boolean;
var
 han: THandle;
 ProcStruct: PROCESSENTRY32;
 sID: string;
begin
 Result:=false;
 han:=CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);
 try
  if han=0 then exit;
  ProcStruct.dwSize := sizeof(PROCESSENTRY32);
  if Process32First(han, ProcStruct) then
   begin
    repeat
     sID := ExtractFileName(ProcStruct.szExeFile);
     if uppercase(copy(sId, 1, length(sName))) = uppercase(sName) then
      begin
       Result := true;
       Break;
      end;
    until
     not Process32Next(han, ProcStruct);
   end;
 finally
  CloseHandle(han);
 end;
end;

function GetWin(Comand: string): string;
var
  buff: array [0 .. $FF] of char;
begin
  ExpandEnvironmentStrings(PChar(Comand), buff, SizeOf(buff));
  Result := buff;
end;

procedure GetAllFiles(Path: string);
var
sRec: TSearchRec;
isFound: boolean;
begin
isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
while isFound do
begin
if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
begin
if ( sRec.Attr and faDirectory ) = faDirectory then
GetAllFiles( Path + '\' + sRec.Name);
form1.Memo2.lines.Add(StringReplace(Path, ExtractFileDir(ParamStr(0)), '', [rfReplaceAll, rfIgnoreCase]) +'\'+ sRec.Name );
end;
Application.ProcessMessages;
isFound := FindNext( sRec ) = 0;
end;
FindClose( sRec );
end;

function Pars(T_, ForS, _T: string): string;
var
  a, b: integer;
begin
  Result := '';
  if (T_ = '') or (ForS = '') or (_T = '') then Exit;
  a := Pos(T_, ForS);
  if a = 0 then Exit
  else a := a + Length(T_);

  ForS := Copy(ForS, a, Length(ForS) - a + 1);
  b := Pos(_T, ForS);
  if b > 0 then Result := Copy(ForS, 1, b - 1);
end;

procedure ExtractRes(ResType, ResName, ResNewName : String);
var
Res : TResourceStream;
Begin
Res:=TResourceStream.Create(Hinstance, Resname, Pchar(ResType));
Res.SavetoFile(ResNewName);
Res.Free;
end;

function WriteLog(Line: string): string;
Var
 F: TextFile;
begin
 if FileName = '' then
   FileName := extractfilepath(application.exename)+'\Debug.log';
 AssignFile(F, FileName);
if fileexists(FileName) then
  append(f)
else
begin
  Rewrite(F);
end;
 WriteLn(F,'['+DateTimeToStr(Now) + '] ' + Line);
 CloseFile(F);
end;

procedure TForm1.TexturePars(Sender: TObject);
var
  SR: TSearchRec;
  pos1: integer;
  name :string;
begin
 memo2.Lines.LoadFromFile('patcher_resources\names.txt');

   if FindFirst('Patch\*.dds',faAnyFile,SR) = 0 then
  repeat
   pos1:=0;
   while pos1<= memo2.Lines.Count do
    begin
     if copy(memo2.Lines[pos1],1,pos(' ',memo2.Lines[pos1])-1)= SR.name then
      begin
       name:= memo2.Lines[pos1];
       name:= copy(name,pos('> ',name)+2,name.Length);
       CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString('Patch\'+name)),False);
       DeleteFile('Patch\'+SR.name);
       form1.Repaint;
      end;
      pos1:=pos1+1;
    end;
    pos1:=0;
    memo1.Lines.Add(SR.name+ ' -> ' +name);
    form1.Repaint;
    name:='';
   until FindNext(SR) <> 0;
  FindClose(SR);
  memo2.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Hide;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SR: TSearchRec;
begin
 memo1.Lines.Add('извлечение пакетов');
 ExtractRes('data', 'hashes',ExtractFilePath(Application.ExeName) +  '\patcher_resources\hashes.txt');
 ExtractRes('data', 'names',ExtractFilePath(Application.ExeName) +  '\patcher_resources\names.txt');
 ExtractRes('EXEFILE', 'injector',ExtractFilePath(Application.ExeName) +  '\injector.exe');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('удаление прошлых модов');
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\files_to_patch\', True);
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\texture');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('переименовка текстур');
 TexturePars(nil);
 memo1.Lines.Add('копирование текстур');
  if FindFirst('Patch\*.dds',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\texture\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
   until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование xml файлов');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование мета файла');
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'pad00000.meta',False);
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'files\pad00000.meta.ori',False);
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('запуск инжектора');
 Sleep(200);
 ShellExecute(Handle, 'open', 'injector.exe', nil, nil, SW_SHOW);
 Sleep(1000);
 while IsRunning('injector.exe') do begin end;
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('копирование мета файла');
 CopyFile('pad00000.meta','files\pad00000.meta.bak',False);
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('копирование текстур в папку игры');
 ForceDirectories(GameFolder + '\live\character\texture');
  if FindFirst('Patch\*.dds',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder +  '\live\character\texture\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  until FindNext(SR) <> 0;
  FindClose(SR);
 memo1.Lines.Add('копирование xml в папку игры');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder +   '\live\character\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  until FindNext(SR) <> 0;
  FindClose(SR);
 memo1.Lines.Add('патч завершен. перезапустите сплиттер.');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 CopyFile('files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
 CopyFile('Files\torrent.resume',PWideChar(WideString(AppData)),False);
end;

procedure TForm1.close1Click(Sender: TObject);
begin
if gamer=2 then begin
  gamer:=0;
  CopyFile('files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
  memo1.Lines.Add('патч удален!');
  PopupMenu1.Items[0].Caption:='игра закрыта';
  timer1.enabled:=false;
  form1.Show;
  end;
  CopyFile('Files\torrent.resume',PWideChar(WideString(AppData)),False);
  application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
File_Rec: TSearchRec;
IniFile : TIniFile;
begin
SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW AND NOT WS_EX_APPWINDOW);
PopupMenu1.Items[0].Caption:='запуск...';
if DirectoryExists('Files') then memo1.Lines.Add('загрузка файлов.')
else begin
memo1.Lines.Add('создание папок.');
CreateDir('Files');
CreateDir('Patch');
ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\texture');
CreateDir('patcher_resources');
memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
end;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
inifile.WriteString('Global','Create', '1');
if inifile.ReadString('Global','AppData', '0') = '0' then begin
 AppData:=GetWin('%LocalAppData%')+ '\Vebanaul\GameNet\torrents\30000000000.resume';
 inifile.WriteString('Global','AppData', AppData);
end else AppData:=inifile.ReadString('Global','AppData', '0');

if inifile.ReadString('Global','GameFolder', '0') = '0' then begin
 SelectDirectory('укажите путь до папки BlackDesert', '',  GameFolder);
 GameFolder:=StringReplace(GameFolder, '\bin64', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\bin', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\Paz', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\Cache', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\live', '', [rfReplaceAll, rfIgnoreCase]);
 inifile.WriteString('Global','GameFolder', GameFolder);
end else GameFolder:=inifile.ReadString('Global','GameFolder', '0');

if inifile.ReadString('Global','X', '0') = '0' then begin
 razr := GetEnvironmentVariable('ProgramFiles(x86)');
 if (razr = '') then razr:= '32'
 else razr:= '64';
 inifile.WriteString('Global','X', razr);
end else razr:=inifile.ReadString('Global','X', '64');

if FileExists('files\pad00000.meta.ori') then
memo1.Lines.Add('оригинальный файл найден!')
else begin memo1.Lines.Add('оригинальный файл не найден.');
  memo1.Lines.Add('для продолжения работы нажмите кнопку патч!');
  memo1.Lines.Add('');
  memo1.Lines.Add('приложение остановлено.');
  PopupMenu1.Items[0].Caption:='ошибка!';
  exit;
end;

if FileExists('files\pad00000.meta.bak') then
memo1.Lines.Add('редактированный файл найден!')
else begin memo1.Lines.Add('редактированный файл не найден.');
  memo1.Lines.Add('для продолжения работы нажмите кнопку патч!');
  memo1.Lines.Add('');
  memo1.Lines.Add('приложение остановлено.');
  PopupMenu1.Items[0].Caption:='ошибка!';
  exit;
end;
try
memo1.Lines.Add(GameFolder+ '\live\bin\GameNetX86.dll');
findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
DateTime1:=FileDateToDateTime(File_Rec.Time);
memo1.Lines.Add('последний запуск: '+DateTimeTostr(DateTime1));
except
memo1.Lines.Add('игра не найдена');
memo1.Lines.Add('приложение остановлено.');
PopupMenu1.Items[0].Caption:='ошибка!';
exit;
end;
memo1.Lines.Add('ожидание запуска клиента...');
timer1.Enabled:=true;
gamer:=0;
end;

procedure TForm1.N4Click(Sender: TObject);
var
 logpos: integer;
begin
 memo2.Clear;
 memo2.Lines.Add('<<запуск лога>>');
 memo2.Lines.Add('файл листинг:');
 GetAllFiles(ExtractFileDir(ParamStr(0)));
 memo2.Lines.Add('лог приложения:');
 logpos:=0;
 while logpos<= memo1.Lines.Count do begin
 Memo2.Lines.Add(Memo1.Lines[logpos]);
 logpos:=logpos+1;
 end;
 memo2.Lines.Add('прочие переменные:');
 memo2.Lines.Add('разрядность OC: x'+razr);
 memo2.Lines.Add('папка игры: '+GameFolder);
 memo2.Lines.Add('папка торрента: '+AppData);
 memo2.Lines.Add('состояние игры: '+inttostr(gamer));
 memo2.Lines.Add('сплиттер '+ form2.Label3.Caption);
 logpos:=0;
 while logpos<= memo2.Lines.Count do begin
 WriteLog(memo2.Lines[logpos]);
 logpos:=logpos+1;
 end;
 memo1.Lines.Add('лог создан');
 memo2.Clear;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.show1Click(Sender: TObject);
begin
form1.Show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
File_Rec: TSearchRec;
begin
 if gamer=0 then begin
  findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
  DateTime2:=FileDateToDateTime(File_Rec.Time);
  if DateTime1<>DateTime2 then begin
   CopyFile(PWideChar(WideString(AppData)),'files\torrent.resume',False);
   gamer:=1;
   DateTime1:=DateTime2;
   CopyFile('files\pad00000.meta.bak',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   memo1.Lines.Add('патч установлен!');
   memo1.Lines.Add('ожидание запуска игры...');
   PopupMenu1.Items[0].Caption:='в игре...';
   timer1.Interval:=30000;
   Memo1.Perform(EM_LINESCROLL,0,Memo1.Lines.Count-1);
   exit;
  end;
 end;
 if (IsRunning('BlackDesert'+razr+'.exe')) then begin
  if gamer=0 then begin
   gamer:=2;
   CopyFile('files\pad00000.meta.bak',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   memo1.Lines.Add('патч установлен! (почти..)');
   PopupMenu1.Items[0].Caption:='ошибка!';
   timer1.Interval:=9000;
   DateTime1:=DateTime2;
   exit;
  end
 else
  if gamer=1 then begin
   memo1.Lines.Add('игра запущена.');
   gamer:=2;
   timer1.Interval:=5000;
   Memo1.Perform(EM_LINESCROLL,0,Memo1.Lines.Count-1);
   form1.Hide;
   exit
  end;
 end
 else
  if gamer=2 then begin
   gamer:=0;
   memo1.Lines.Add('игра закрыта.');
   CopyFile('files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   memo1.Lines.Add('патч удален!');
   PopupMenu1.Items[0].Caption:='игра закрыта';
   timer1.Interval:=400;
   form1.Show;
   memo1.Lines.Add('ожидание запуска клиента...');
   findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
   DateTime2:=FileDateToDateTime(File_Rec.Time);
   DateTime1:=DateTime2;
   Memo1.Perform(EM_LINESCROLL,0,Memo1.Lines.Count-1);
   CopyFile('files\torrent.resume',PWideChar(WideString(AppData)),False);
   exit
  end;
  if gamer=1 then begin
   gamer:=0;
   memo1.Lines.Add('истекло время ожидания игры');
   CopyFile('files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   memo1.Lines.Add('патч удален!');
   PopupMenu1.Items[0].Caption:='игра закрыта';
   timer1.Interval:=400;
   form1.Show;
   memo1.Lines.Add('ожидание запуска клиента...');
   findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
   DateTime2:=FileDateToDateTime(File_Rec.Time);
   DateTime1:=DateTime2;
   Memo1.Perform(EM_LINESCROLL,0,Memo1.Lines.Count-1);
   CopyFile('file\torrent.resume',PWideChar(WideString(AppData)),False);
   exit
  end;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
form1.Show;
end;

end.
