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
    procedure Button2Click(Sender: TObject);
    procedure TexturePars(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
var
SR: TSearchRec;
IniFile : TIniFile;
count1,TexturesCount,count2,texturesall :integer;
Rawdata, state1,state2: string;
Http  : TidHttp;
URL,HashString : String;
begin
if patch1=0 then begin
Form4.Show;
exit;
end;

 memo1.Lines.Add('извлечение пакетов');
 ExtractRes('data', 'names',ExtractFilePath(Application.ExeName) +  '\patcher_resources\names.txt');
 ExtractRes('EXEFILE', 'injector',ExtractFilePath(Application.ExeName) +  '\injector.exe');
 ExtractRes('data', 'modlist',ExtractFilePath(Application.ExeName) +  '\Files\modlist.ini');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 if FileExists('patcher_resources\hashes.txt') then  memo1.Lines.Add('проверка хешей')
else  begin
 memo1.Lines.Add('загрузка хешей');
 memo1.Lines.Add('(может показатся что зависло но так задуманно)');
 Http := TIdHTTP.Create(nil);
 Http.HandleRedirects := true;
memo1.Lines.Add('загрузка хеша. 1\2');
 Http := TIdHTTP.Create(nil);
 Http.HandleRedirects := true;
 Http.Request.UserAgent :='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
 URL:= 'https://raw.githubusercontent.com/Socolcol/Splitter/master/HASH1.txt';
 HashString:=http.Get(URL);
memo2.Lines.Add(HashString);
memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....ок';
memo1.Lines.Add('загрузка хеша. 2\2');
 Http.Request.UserAgent :='Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
 URL:= 'https://raw.githubusercontent.com/Socolcol/Splitter/master/HASH2.txt';
 HashString:=http.Get(URL);
memo2.Lines.Add(HashString);
memo2.Lines.SaveToFile('patcher_resources\hashes.txt');
IdHTTP1.Free;
memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....ок';
end;

 memo1.Lines.Add('удаление прошлых модов');
 try
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\files_to_patch\', True);
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\Patch\pac\', True);
 finally
 memo1.Lines.Add('не удалено.');
 end;
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\texture');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pbw');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\phw');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pew');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pww');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pkww');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pvw');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\files_to_patch\character\pnw');
  ForceDirectories(ExtractFilePath(Application.ExeName) + '\Patch\pac');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('распаковка модов');
  if form4.nude1.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Follys');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex41',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex42',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex43',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude2.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Basebody');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex11',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex12',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex13',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude3.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Pufferfishs');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex71',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex72',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex73',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude4.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Jokus (бритая)');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex51',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex52',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex53',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex54',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude5.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Jokus');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pbw_00_nude_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pww_01_nude_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex61',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex62',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex63',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex64',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude6.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Eyenights (бритая)');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex21',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex22',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex23',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude7.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Eyenights');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex31',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex32',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex33',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude9.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Areola');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PEW_01_NUDE_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PHW_01_NUDE_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PWW_01_NUDE_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  // ExtractRes('data', 'tex31',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
  // ExtractRes('data', 'tex32',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
  // ExtractRes('data', 'tex33',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  // ExtractRes('data', 'tex14',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nudetamer.Checked=true then
   ExtractRes('data', 'tex81',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');

  memo1.Lines.Add('удаление частей брони');
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
  count1:=0;
  count2:=0;
  if form4.armor1.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorall','files', '1'));
  if form4.armor2.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorstarter','files', '1'));
  if form4.armor3.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorregular','files', '1'));
  if form4.underwear1.Checked=true then count1:=count1+strtoint(inifile.ReadString('underwearall','files', '1'));
  if form4.underwear2.Checked=true then count1:=count1+strtoint(inifile.ReadString('underwearstarter','files', '1'));
  if form4.boots1.Checked=true then count1:=count1+strtoint(inifile.ReadString('bootsall','files', '1'));
  if form4.boots2.Checked=true then count1:=count1+strtoint(inifile.ReadString('bootsstarter','files', '1'));
  if form4.glowers1.Checked=true then count1:=count1+strtoint(inifile.ReadString('glowersall','files', '1'));
  if form4.glowers2.Checked=true then count1:=count1+strtoint(inifile.ReadString('glowersstarter','files', '1'));
  if form4.lifeskill1.Checked=true then count1:=count1+strtoint(inifile.ReadString('lifeskill','files', '1'));
  if form4.sorkweap1.Checked=true then count1:=count1+strtoint(inifile.ReadString('sorkweapall','files', '1'));
  if form4.sorkweap2.Checked=true then count1:=count1+strtoint(inifile.ReadString('sorkwaepstarter','files', '1'));
  if form4.lowerbody1.Checked=true then count1:=count1+strtoint(inifile.ReadString('lowerbodyall','files', '1'));
  if form4.lowerbody2.Checked=true then count1:=count1+strtoint(inifile.ReadString('lowerbodystarter','files', '1'));
  if form4.hats1.Checked=true then count1:=count1+strtoint(inifile.ReadString('hatsall','files', '1'));
  TexturesCount:=1;
  if form4.armor1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('armorall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('armorall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('armorall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.armor2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('armorstarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('armorstarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('armorstarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.armor3.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('armorregular','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('armorregular','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('armorregular','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.underwear1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('underwearall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('underwearall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('underwearall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.underwear2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('underwearstarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('underwearstarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('underwearstarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.boots1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('bootsall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('bootsall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('bootsall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.boots2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('bootsstarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('bootsstarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('bootsstarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.glowers1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('glowersall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('glowersall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('glowersall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.glowers2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('glowersstarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('glowersstarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('glowersstarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.lifeskill1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('lifeskill','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('lifeskill','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('lifeskill','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.sorkweap1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('sorkweapall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('sorkweapall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('sorkweapall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.sorkweap2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('sorkwaepstarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('sorkwaepstarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('sorkwaepstarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.lowerbody1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('lowerbodyall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('lowerbodyall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('lowerbodyall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.lowerbody2.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('lowerbodystarter','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('lowerbodystarter','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('lowerbodystarter','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
  TexturesCount:=1;
  if form4.hats1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('hatsall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('hatsall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('hatsall','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  end;
 memo1.Lines.Add('переименовка текстур');
 TexturePars(nil);
 memo1.Lines.Add('установка пачта текстур');
 if form4.checkbox9.checked=true then begin
  TexturesCount:=1;
   texturesall:=strtoint(inifile.ReadString('ddspatch','files', '1'));
   while TexturesCount <= texturesall do begin
    if pos('dec.dds', inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1'))>0 then
    ExtractRes('data', 'texture1',ExtractFilePath(Application.ExeName) +  'Patch\'+inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1'))
    else if pos('ao.dds', inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1'))>0 then
    ExtractRes('data', 'texture2',ExtractFilePath(Application.ExeName) +  'Patch\'+inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1'))
    else ExtractRes('data', 'texture0',ExtractFilePath(Application.ExeName) +  'Patch\'+inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1'));
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 end else memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....отменена';

  if form4.checkbox1.checked=true then begin
   memo1.Lines.Add('установка мода на грудь сорки');
   ExtractRes('data', 'breast4',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_soc.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_soc.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_soc.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\sorcerer');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\sorcerer\customizationboneparamdesc_soc.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox2.checked=true then begin
   memo1.Lines.Add('установка мода на грудь Вальки');
   ExtractRes('data', 'breast5',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_val.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_val.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_val.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\valkyrie');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\valkyrie\customizationboneparamdesc_val.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox3.checked=true then begin
   memo1.Lines.Add('установка мода на грудь Пиу-пиу');
   ExtractRes('data', 'breast3',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_ran.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_ran.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_ran.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\ranger');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\ranger\customizationboneparamdesc_ran.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox4.checked=true then begin
   memo1.Lines.Add('установка мода на грудь Влшебницы');
   ExtractRes('data', 'breast6',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_wizw.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_wizw.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_wizw.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\wizardwoman');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\wizardwoman\customizationboneparamdesc_wizw.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox5.checked=true then begin
   memo1.Lines.Add('установка мода на грудь Куноити');
   ExtractRes('data', 'breast2',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_ninw.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_ninw.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_ninw.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\ninjawoman');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\ninjawoman\customizationboneparamdesc_ninw.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox6.checked=true then begin
   memo1.Lines.Add('установка мода на грудь маэвы');
   ExtractRes('data', 'breast1',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_bladewomentest.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_bladewomentest.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_bladewomentest.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\bladewomentest');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\bladewomentest\customizationboneparamdesc_bladewomentest.xml');
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
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

 memo1.Lines.Add('копирование pac файлов');
    if FindFirst('Patch\pac\*.pac',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    if pos('pbw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pbw\'+SR.name)),False)
   else if pos('phw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\phw\'+SR.name)),False)
   else if pos('pew', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pew\'+SR.name)),False)
   else if pos('pww', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pww\'+SR.name)),False)
   else if pos('pkww', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pkww\'+SR.name)),False)
   else if pos('pvw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pvw\'+SR.name)),False)
   else if pos('pnw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\pnw\'+SR.name)),False)
   else  CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\'+SR.name)),False);
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
 ForceDirectories(GameFolder + '\live\character\pbw');
 ForceDirectories(GameFolder + '\live\character\phw');
 ForceDirectories(GameFolder + '\live\character\pew');
 ForceDirectories(GameFolder + '\live\character\pww');
 ForceDirectories(GameFolder + '\live\character\pkww');
 ForceDirectories(GameFolder + '\live\character\pvw');
 ForceDirectories(GameFolder + '\live\character\pnw');
  if FindFirst('Patch\*.dds',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\texture\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  until FindNext(SR) <> 0;
  FindClose(SR);
 memo1.Lines.Add('копирование xml в папку игры');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  until FindNext(SR) <> 0;
  FindClose(SR);
   memo1.Lines.Add('копирование pac файлов в папку игры');
    if FindFirst('Patch\pac\*.pac',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    if pos('pbw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pbw\'+SR.name)),False)
   else if pos('phw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\phw\'+SR.name)),False)
   else if pos('pew', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pew\'+SR.name)),False)
   else if pos('pww', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pww\'+SR.name)),False)
   else if pos('pkww', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pkww\'+SR.name)),False)
   else if pos('pvw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pvw\'+SR.name)),False)
   else if pos('pnw', SR.Name)<>0 then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\pnw\'+SR.name)),False)
   else  CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\'+SR.name)),False);
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
