unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TlHelp32, ShellAPI,
  Vcl.ExtCtrls, IniFiles, Vcl.Menus, FileCtrl, IOUtils, IdHashCRC,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdAntiFreezeBase, Vcl.IdAntiFreeze;

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
    IdHTTP1: TIdHTTP;
    N9: TMenuItem;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure show1Click(Sender: TObject);
    procedure close1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure TexturePars(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gamer,patch1 : integer;
  FileName: string = '';   //для лога
  DateTime1,DateTime2:TDateTime;
  AppData,UpdateURL,GameFolder,razr:string;

implementation

{$R *.dfm}

uses Unit2, Modemenu, Path;
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

function CRC32(const path: string): string;
var
 f: tfilestream;
 value: dword;
 IdHashCRC32: TIdHashCRC32;
begin
 IdHashCRC32:=nil;
 f:=nil;
 try
  IdHashCRC32:=TIdHashCRC32.create;
  f:=TFileStream.create(path, fmOpenRead or fmShareDenyWrite);
  value:=IdHashCRC32.HashValue(f);
  result:=IntToHex(value, 8);
 finally
  f.free;
  IdHashCRC32.free;
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

procedure DownloadFile(URL,FileName: String);
var
  HTTP: TIdHTTP;
  Stream: TMemoryStream;
begin
  HTTP := TIdHTTP.Create(nil);
  Stream := TMemoryStream.Create;
  Http.HandleRedirects := true;
  Http.Request.UserAgent :='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
  try
    HTTP.Get(Url, Stream);
    Stream.SaveToFile(FileName);
  finally
    Stream.Free;
    HTTP.Free;
  end;
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
    if name = '' then memo1.Lines.Add(SR.name+ ' -> небыло переименованно')
     else memo1.Lines.Add(SR.name+ ' -> ' +name);
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
ForceDirectories(ExtractFilePath(Application.ExeName) + '\Patch\pac');
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

procedure TForm1.FormShow(Sender: TObject);
var
 Http  : TidHttp;
 URL,HashString : String;
begin
 Http := TIdHTTP.Create(nil);
 Http.HandleRedirects := true;

 Http.Request.UserAgent :='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
 URL:= 'https://raw.githubusercontent.com/Socolcol/Splitter/master/README.md';
 HashString:=http.Get(URL);
  if pars('Ver:',HashString,':Ver') <> form2.Label3.Caption then begin
  memo1.Lines.Add('где-то есть новая версия: '+pars('Ver:',HashString,':Ver'));
  N9.Visible:=true;
  UpdateURL:=pars('URL:',HashString,':URL');
  end
  else if pars('CRC32:',HashString,':CRC32') <> CRC32('Splitter.exe') then begin
  memo1.Lines.Add('возможно Splitter.exe был поврежден');
  timer1.Enabled:=false;
  memo1.Lines.Add('приложение остановленно');
  end;
  if pars('MSG:',HashString,':MSG') > '' then memo1.Lines.Add(pars('MSG:',HashString,':MSG'));
end;

procedure TForm1.N2Click(Sender: TObject);
begin
form4.Show;
end;

procedure TForm1.N4Click(Sender: TObject);
var
 logpos: integer;
begin
 memo2.Clear;
 memo2.Lines.Add('---->>запуск лога>>');
 memo2.Lines.Add('---->>хеш файлов>>');
 memo2.Lines.Add('Ori sha256 '+ CRC32('files\pad00000.meta.ori'));
 memo2.Lines.Add('Bak aha256 '+ CRC32('files\pad00000.meta.bak'));
 memo2.Lines.Add('---->>директории>>');
 GetAllFiles(ExtractFileDir(ParamStr(0)));
 memo2.Lines.Add('---->>лог приложения>>');
 logpos:=0;
 while logpos<= memo1.Lines.Count do begin
 Memo2.Lines.Add(Memo1.Lines[logpos]);
 logpos:=logpos+1;
 end;
 memo2.Lines.Add('---->>состояние конфига>>');
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

procedure TForm1.N9Click(Sender: TObject);
begin
ShellExecute(application.Handle,'Open',PWideChar(WideString(updateURL)),Nil,Nil,SW_SHOWDEFAULT);
end;

procedure TForm1.show1Click(Sender: TObject);
begin
form1.Show;
end;

procedure TForm1.test1Click(Sender: TObject);
begin
Form3.Show;
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
