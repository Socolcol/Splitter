unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TlHelp32, ShellAPI,
  Vcl.ExtCtrls, IniFiles, Vcl.Menus, FileCtrl, IOUtils, IdHashCRC,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, Vcl.ComCtrls, Vcl.XPMan;

type
  TForm1 = class(TForm)
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
    N10: TMenuItem;
    language1: TMenuItem;
    N11: TMenuItem;
    English1: TMenuItem;
    RichEdit1: TRichEdit;
    N12: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    XPManifest1: TXPManifest;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure Timer1Timer(Sender: TObject);
    procedure show1Click(Sender: TObject);
    procedure close1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure TexturePars(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ReShade1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N10Click(Sender: TObject);
    procedure English1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N102Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gamer,patch1,TimerPath : integer;
  FileName: string = '';   //для лога
  DateTime1,DateTime2:TDateTime;
  AppData,UpdateURL,GameFolder,razr:string;
  H: THandle;

implementation

{$R *.dfm}

uses Unit2, Modemenu, Path, Unit3;
{$R DataRes.RES}

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

function KillProcess(ExeName: string): LongBool;
var
 B: Bool;
 ProcList: THandle;
 PE: TProcessEntry32;
begin
 Result := False;
 ProcList := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
 PE.dwSize := SizeOf(PE);
 B := Process32First(ProcList, PE);
 while B do begin
   if (UpperCase(PE.szExeFile) = UpperCase(ExtractFileName(ExeName))) then
     Result := TerminateProcess(OpenProcess($0001, False, PE.th32ProcessID), 0);
    B := Process32Next(ProcList, PE);
 end;
 CloseHandle(ProcList);
end;

procedure ExtractRes(ResType, ResName, ResNewName : String);
var
Res : TResourceStream;
Begin
Res:=TResourceStream.Create(Hinstance, Resname, Pchar(ResType));
Res.SavetoFile(ResNewName);
Res.Free;
end;

function ReTranslate(Lang: string): string;
var
IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
  if inifile.ReadString('Global','Lang', 'ru') = 'en' then begin
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\Lang.ini');
  form1.MainMenu1.Items[0].Caption:=inifile.ReadString('en','MainmN2', ' ');
  form1.MainMenu1.Items[1].Caption:=inifile.ReadString('en','MainmN8', ' ');
  form1.MainMenu1.Items[2].Caption:=inifile.ReadString('en','MainmN3', ' ');
  form1.MainMenu1.Items[2].Items[0].Caption:=inifile.ReadString('en','MainmN4', ' ');
  form1.MainMenu1.Items[2].Items[1].Caption:=inifile.ReadString('en','MainmN5', ' ');
  form1.MainMenu1.Items[2].Items[2].Caption:=inifile.ReadString('en','MainmN10', ' ');
  form1.MainMenu1.Items[3].Caption:=inifile.ReadString('en','MainmN6', ' ');
  form1.MainMenu1.Items[4].Caption:=inifile.ReadString('en','MainmN7', ' ');
  form1.MainMenu1.Items[5].Caption:=inifile.ReadString('en','MainmN9', ' ');
  form4.tabsheet1.Caption:=inifile.ReadString('en','tabsheet1', ' ');
  form4.tabsheet2.Caption:=inifile.ReadString('en','tabsheet2', ' ');
  form4.tabsheet3.Caption:=inifile.ReadString('en','tabsheet3', ' ');
  form4.tabsheet4.Caption:=inifile.ReadString('en','tabsheet4', ' ');
  form4.tabsheet5.Caption:=inifile.ReadString('en','tabsheet5', ' ');
  form4.label1.Caption:=inifile.ReadString('en','label1', ' ');
  form4.label3.Caption:=inifile.ReadString('en','label3', ' ');
  form4.label4.Caption:=inifile.ReadString('en','label4', ' ');
  form4.label5.Caption:=inifile.ReadString('en','label5', ' ');
  form4.label11.Caption:=inifile.ReadString('en','label11', ' ');
  form4.CheckBox1.Caption:=inifile.ReadString('en','CheckBox1', ' ');
  form4.CheckBox2.Caption:=inifile.ReadString('en','CheckBox2', ' ');
  form4.CheckBox3.Caption:=inifile.ReadString('en','CheckBox3', ' ');
  form4.CheckBox4.Caption:=inifile.ReadString('en','CheckBox4', ' ');
  form4.CheckBox5.Caption:=inifile.ReadString('en','CheckBox5', ' ');
  form4.CheckBox6.Caption:=inifile.ReadString('en','CheckBox6', ' ');
  form4.CheckBox7.Caption:=inifile.ReadString('en','CheckBox7', ' ');
  form4.CheckBox8.Caption:=inifile.ReadString('en','CheckBox8', ' ');
  form4.CheckBox9.Caption:=inifile.ReadString('en','CheckBox9', ' ');
  form4.CheckBox10.Caption:=inifile.ReadString('en','CheckBox10', ' ');
  form4.CheckBox11.Caption:=inifile.ReadString('en','CheckBox11', ' ');
  form4.CheckBox12.Caption:=inifile.ReadString('en','CheckBox12', ' ');
  form4.CheckBox13.Caption:=inifile.ReadString('en','CheckBox13', ' ');
  form4.CheckBox14.Caption:=inifile.ReadString('en','CheckBox14', ' ');
  form4.CheckBox15.Caption:=inifile.ReadString('en','CheckBox15', ' ');
  form4.CheckBox16.Caption:=inifile.ReadString('en','CheckBox16', ' ');
  form4.CheckBox17.Caption:=inifile.ReadString('en','CheckBox17', ' ');
  form4.CheckBox18.Caption:=inifile.ReadString('en','CheckBox18', ' ');
  form4.CheckBox19.Caption:=inifile.ReadString('en','CheckBox19', ' ');
  form4.CheckBox20.Caption:=inifile.ReadString('en','CheckBox20', ' ');
  form4.CheckBox21.Caption:=inifile.ReadString('en','CheckBox21', ' ');
  form4.CheckBox22.Caption:=inifile.ReadString('en','CheckBox22', ' ');
  form4.CheckBox23.Caption:=inifile.ReadString('en','CheckBox23', ' ');
  form4.CheckBox24.Caption:=inifile.ReadString('en','CheckBox24', ' ');
  form4.CheckBox25.Caption:=inifile.ReadString('en','CheckBox25', ' ');
  form4.CheckBox26.Caption:=inifile.ReadString('en','CheckBox26', ' ');
  form4.CheckBox27.Caption:=inifile.ReadString('en','CheckBox27', ' ');
  form4.CheckBox28.Caption:=inifile.ReadString('en','CheckBox28', ' ');
  form4.CheckBox29.Caption:=inifile.ReadString('en','CheckBox29', ' ');
  form4.CheckBox30.Caption:=inifile.ReadString('en','CheckBox30', ' ');
  form4.CheckBox32.Caption:=inifile.ReadString('en','CheckBox32', ' ');
  form4.GroupBox1.Caption:=inifile.ReadString('en','groupbox1', ' ');
  form4.GroupBox2.Caption:=inifile.ReadString('en','groupbox2', ' ');
  form4.GroupBox3.Caption:=inifile.ReadString('en','groupbox3', ' ');
  form4.GroupBox4.Caption:=inifile.ReadString('en','groupbox4', ' ');
  form4.GroupBox5.Caption:=inifile.ReadString('en','groupbox5', ' ');
  form4.GroupBox6.Caption:=inifile.ReadString('en','groupbox6', ' ');
  form4.GroupBox7.Caption:=inifile.ReadString('en','groupbox7', ' ');
  form4.GroupBox8.Caption:=inifile.ReadString('en','groupbox8', ' ');
  form4.GroupBox9.Caption:=inifile.ReadString('en','groupbox9', ' ');
  form4.GroupBox11.Caption:=inifile.ReadString('en','groupbox11', ' ');
  form4.GroupBox12.Caption:=inifile.ReadString('en','groupbox12', ' ');
  form4.Button2.Caption:=inifile.ReadString('en','button2', ' ');
  form4.nude8.Caption:=inifile.ReadString('en','nude8', ' ');
  form4.armor1.Caption:=inifile.ReadString('en','armor1', ' ');
  form4.armor2.Caption:=inifile.ReadString('en','armor2', ' ');
  form4.armor3.Caption:=inifile.ReadString('en','armor3', ' ');
  form4.armor4.Caption:=inifile.ReadString('en','armor4', ' ');
  form4.boots1.Caption:=inifile.ReadString('en','boots1', ' ');
  form4.boots2.Caption:=inifile.ReadString('en','boots2', ' ');
  form4.boots3.Caption:=inifile.ReadString('en','boots3', ' ');
  form4.glowers1.Caption:=inifile.ReadString('en','glowers1', ' ');
  form4.glowers2.Caption:=inifile.ReadString('en','glowers2', ' ');
  form4.glowers3.Caption:=inifile.ReadString('en','glowers3', ' ');
  form4.underwear1.Caption:=inifile.ReadString('en','underwear1', ' ');
  form4.underwear2.Caption:=inifile.ReadString('en','underwear2', ' ');
  form4.underwear3.Caption:=inifile.ReadString('en','underwear3', ' ');
  form4.sorkweap1.Caption:=inifile.ReadString('en','sorkweap1', ' ');
  form4.sorkweap2.Caption:=inifile.ReadString('en','sorkweap2', ' ');
  form4.sorkweap3.Caption:=inifile.ReadString('en','sorkweap3', ' ');
  form4.lowerbody1.Caption:=inifile.ReadString('en','lowerbody1', ' ');
  form4.lowerbody2.Caption:=inifile.ReadString('en','lowerbody2', ' ');
  form4.lowerbody3.Caption:=inifile.ReadString('en','lowerbody3', ' ');
  form4.hats1.Caption:=inifile.ReadString('en','hats1', ' ');
  form4.hats2.Caption:=inifile.ReadString('en','hats2', ' ');
  form4.hats3.Caption:=inifile.ReadString('en','hats3', ' ');
  form4.lifeskill1.Caption:=inifile.ReadString('en','lifeskill1', ' ');
  form4.lifeskill2.Caption:=inifile.ReadString('en','lifeskill2', ' ');
  end;
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
  if inifile.ReadString('Global','Lang', 'ru') = 'ru' then begin
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\Lang.ini');
  form1.MainMenu1.Items[0].Caption:=inifile.ReadString('ru','MainmN2', ' ');
  form1.MainMenu1.Items[1].Caption:=inifile.ReadString('ru','MainmN8', ' ');
  form1.MainMenu1.Items[2].Caption:=inifile.ReadString('ru','MainmN3', ' ');
  form1.MainMenu1.Items[2].Items[0].Caption:=inifile.ReadString('ru','MainmN4', ' ');
  form1.MainMenu1.Items[2].Items[1].Caption:=inifile.ReadString('ru','MainmN5', ' ');
  form1.MainMenu1.Items[2].Items[2].Caption:=inifile.ReadString('ru','MainmN10', ' ');
  form1.MainMenu1.Items[3].Caption:=inifile.ReadString('ru','MainmN6', ' ');
  form1.MainMenu1.Items[4].Caption:=inifile.ReadString('ru','MainmN7', ' ');
  form1.MainMenu1.Items[5].Caption:=inifile.ReadString('ru','MainmN9', ' ');
  form4.tabsheet1.Caption:=inifile.ReadString('ru','tabsheet1', ' ');
  form4.tabsheet2.Caption:=inifile.ReadString('ru','tabsheet2', ' ');
  form4.tabsheet3.Caption:=inifile.ReadString('ru','tabsheet3', ' ');
  form4.tabsheet4.Caption:=inifile.ReadString('ru','tabsheet4', ' ');
  form4.tabsheet5.Caption:=inifile.ReadString('ru','tabsheet5', ' ');
  form4.label1.Caption:=inifile.ReadString('ru','label1', ' ');
  form4.label3.Caption:=inifile.ReadString('ru','label3', ' ');
  form4.label4.Caption:=inifile.ReadString('ru','label4', ' ');
  form4.label5.Caption:=inifile.ReadString('ru','label5', ' ');
  form4.label11.Caption:=inifile.ReadString('ru','label11', ' ');
  form4.CheckBox1.Caption:=inifile.ReadString('ru','CheckBox1', ' ');
  form4.CheckBox2.Caption:=inifile.ReadString('ru','CheckBox2', ' ');
  form4.CheckBox3.Caption:=inifile.ReadString('ru','CheckBox3', ' ');
  form4.CheckBox4.Caption:=inifile.ReadString('ru','CheckBox4', ' ');
  form4.CheckBox5.Caption:=inifile.ReadString('ru','CheckBox5', ' ');
  form4.CheckBox6.Caption:=inifile.ReadString('ru','CheckBox6', ' ');
  form4.CheckBox7.Caption:=inifile.ReadString('ru','CheckBox7', ' ');
  form4.CheckBox8.Caption:=inifile.ReadString('ru','CheckBox8', ' ');
  form4.CheckBox9.Caption:=inifile.ReadString('ru','CheckBox9', ' ');
  form4.CheckBox10.Caption:=inifile.ReadString('ru','CheckBox10', ' ');
  form4.CheckBox11.Caption:=inifile.ReadString('ru','CheckBox11', ' ');
  form4.CheckBox12.Caption:=inifile.ReadString('ru','CheckBox12', ' ');
  form4.CheckBox13.Caption:=inifile.ReadString('ru','CheckBox13', ' ');
  form4.CheckBox14.Caption:=inifile.ReadString('ru','CheckBox14', ' ');
  form4.CheckBox15.Caption:=inifile.ReadString('ru','CheckBox15', ' ');
  form4.CheckBox16.Caption:=inifile.ReadString('ru','CheckBox16', ' ');
  form4.CheckBox17.Caption:=inifile.ReadString('ru','CheckBox17', ' ');
  form4.CheckBox18.Caption:=inifile.ReadString('ru','CheckBox18', ' ');
  form4.CheckBox19.Caption:=inifile.ReadString('ru','CheckBox19', ' ');
  form4.CheckBox20.Caption:=inifile.ReadString('ru','CheckBox20', ' ');
  form4.CheckBox21.Caption:=inifile.ReadString('ru','CheckBox21', ' ');
  form4.CheckBox22.Caption:=inifile.ReadString('ru','CheckBox22', ' ');
  form4.CheckBox23.Caption:=inifile.ReadString('ru','CheckBox23', ' ');
  form4.CheckBox24.Caption:=inifile.ReadString('ru','CheckBox24', ' ');
  form4.CheckBox25.Caption:=inifile.ReadString('ru','CheckBox25', ' ');
  form4.CheckBox26.Caption:=inifile.ReadString('ru','CheckBox26', ' ');
  form4.CheckBox27.Caption:=inifile.ReadString('ru','CheckBox27', ' ');
  form4.CheckBox28.Caption:=inifile.ReadString('ru','CheckBox28', ' ');
  form4.CheckBox29.Caption:=inifile.ReadString('ru','CheckBox29', ' ');
  form4.CheckBox30.Caption:=inifile.ReadString('ru','CheckBox30', ' ');
  form4.CheckBox32.Caption:=inifile.ReadString('ru','CheckBox32', ' ');
  form4.GroupBox1.Caption:=inifile.ReadString('ru','groupbox1', ' ');
  form4.GroupBox2.Caption:=inifile.ReadString('ru','groupbox2', ' ');
  form4.GroupBox3.Caption:=inifile.ReadString('ru','groupbox3', ' ');
  form4.GroupBox4.Caption:=inifile.ReadString('ru','groupbox4', ' ');
  form4.GroupBox5.Caption:=inifile.ReadString('ru','groupbox5', ' ');
  form4.GroupBox6.Caption:=inifile.ReadString('ru','groupbox6', ' ');
  form4.GroupBox7.Caption:=inifile.ReadString('ru','groupbox7', ' ');
  form4.GroupBox8.Caption:=inifile.ReadString('ru','groupbox8', ' ');
  form4.GroupBox9.Caption:=inifile.ReadString('ru','groupbox9', ' ');
  form4.GroupBox11.Caption:=inifile.ReadString('ru','groupbox11', ' ');
  form4.GroupBox12.Caption:=inifile.ReadString('ru','groupbox12', ' ');
  form4.Button2.Caption:=inifile.ReadString('ru','button2', ' ');
  form4.nude8.Caption:=inifile.ReadString('ru','nude8', ' ');
  form4.armor1.Caption:=inifile.ReadString('ru','armor1', ' ');
  form4.armor2.Caption:=inifile.ReadString('ru','armor2', ' ');
  form4.armor3.Caption:=inifile.ReadString('ru','armor3', ' ');
  form4.armor4.Caption:=inifile.ReadString('ru','armor4', ' ');
  form4.boots1.Caption:=inifile.ReadString('ru','boots1', ' ');
  form4.boots2.Caption:=inifile.ReadString('ru','boots2', ' ');
  form4.boots3.Caption:=inifile.ReadString('ru','boots3', ' ');
  form4.glowers1.Caption:=inifile.ReadString('ru','glowers1', ' ');
  form4.glowers2.Caption:=inifile.ReadString('ru','glowers2', ' ');
  form4.glowers3.Caption:=inifile.ReadString('ru','glowers3', ' ');
  form4.underwear1.Caption:=inifile.ReadString('ru','underwear1', ' ');
  form4.underwear2.Caption:=inifile.ReadString('ru','underwear2', ' ');
  form4.underwear3.Caption:=inifile.ReadString('ru','underwear3', ' ');
  form4.sorkweap1.Caption:=inifile.ReadString('ru','sorkweap1', ' ');
  form4.sorkweap2.Caption:=inifile.ReadString('ru','sorkweap2', ' ');
  form4.sorkweap3.Caption:=inifile.ReadString('ru','sorkweap3', ' ');
  form4.lowerbody1.Caption:=inifile.ReadString('ru','lowerbody1', ' ');
  form4.lowerbody2.Caption:=inifile.ReadString('ru','lowerbody2', ' ');
  form4.lowerbody3.Caption:=inifile.ReadString('ru','lowerbody3', ' ');
  form4.hats1.Caption:=inifile.ReadString('ru','hats1', ' ');
  form4.hats2.Caption:=inifile.ReadString('ru','hats2', ' ');
  form4.hats3.Caption:=inifile.ReadString('ru','hats3', ' ');
  form4.lifeskill1.Caption:=inifile.ReadString('ru','lifeskill1', ' ');
  form4.lifeskill2.Caption:=inifile.ReadString('ru','lifeskill2', ' ');
  end;
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
    if name = '' then RichEdit1.Lines.Add(SR.name+ ' -> небыло переименованно')
     else RichEdit1.Lines.Add(SR.name+ ' -> ' +name);
    form1.Repaint;
    name:='';
   until FindNext(SR) <> 0;
  FindClose(SR);
  memo2.Clear;
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
  RichEdit1.Lines.Add('патч удален!');
  PopupMenu1.Items[0].Caption:='игра закрыта';
  timer1.enabled:=false;
  form1.Show;
  end;
  CopyFile('Files\torrent.resume',PWideChar(WideString(AppData)),False);
  application.Terminate;
end;

procedure TForm1.English1Click(Sender: TObject);
var
IniFile : TIniFile;
begin
 IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
 inifile.WriteString('Global','Lang', 'en');
 ReTranslate('en');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
File_Rec: TSearchRec;
IniFile : TIniFile;
begin
ExtractRes('data', 'libeay',ExtractFilePath(Application.ExeName) +  '\libeay32.dll');
ExtractRes('data', 'ssleay',ExtractFilePath(Application.ExeName) +  '\ssleay32.dll');
SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW AND NOT WS_EX_APPWINDOW);
PopupMenu1.Items[0].Caption:='запуск...';
if DirectoryExists('Files') then RichEdit1.Lines.Add('загрузка файлов.')
else begin
RichEdit1.Lines.Add('создание папок.');
CreateDir('Files');
ExtractRes('data', 'lang',ExtractFilePath(Application.ExeName) +  '\Files\Lang.ini');
ForceDirectories(ExtractFilePath(Application.ExeName) + '\Patch\pac');
RichEdit1.lines[RichEdit1.lines.count-1] := RichEdit1.lines[RichEdit1.lines.count-1] + '.........ок';
end;

IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
inifile.WriteString('Global','Create', '1');
if inifile.ReadString('Global','AppData', '0') = '0' then begin
 AppData:=GetWin('%LocalAppData%')+ '\Vebanaul\GameNet\torrents\30000000000.resume';
 inifile.WriteString('Global','AppData', AppData);
end else AppData:=inifile.ReadString('Global','AppData', '0');

if inifile.ReadString('Global','GameFolder', '0') = '0' then begin
 SelectDirectory('укажите путь до папки BlackDesert'+#13#10+'select a folder BlackDesert', '',  GameFolder);
 GameFolder:=StringReplace(GameFolder, '\bin64', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\bin', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\Paz', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\Cache', '', [rfReplaceAll, rfIgnoreCase]);
 GameFolder:=StringReplace(GameFolder, '\live', '', [rfReplaceAll, rfIgnoreCase]);
 inifile.WriteString('Global','GameFolder', GameFolder);
end else GameFolder:=inifile.ReadString('Global','GameFolder', '0');

ForceDirectories(GameFolder +'\live\Paz\patcher_resources');
ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\texture');

if inifile.ReadString('Global','X', '0') = '0' then begin
 razr := GetEnvironmentVariable('ProgramFiles(x86)');
 if (razr = '') then razr:= '32'
 else razr:= '64';
 inifile.WriteString('Global','X', razr);
end else razr:=inifile.ReadString('Global','X', '64');

if inifile.ReadString('Global','Timer', '30000') <> '30000' then begin
  RichEdit1.SelAttributes.Color:=clgreen;
  TimerPath:= strtoint(inifile.ReadString('Global','Timer', '30000'));
  RichEdit1.Lines.Add('время таймера измененно, значение:'+Copy(inttostr(TimerPath), 0, inttostr(TimerPath).Length-3)+' сек');
end else begin
 TimerPath:=30000;
 inifile.WriteString('Global','Timer', '30000');
end;

if FileExists('files\pad00000.meta.ori') then
RichEdit1.Lines.Add('оригинальный файл найден!')
else
 begin
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('оригинальный файл не найден.');
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('приложение остановлено.');
 RichEdit1.Lines.Add('');
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('для продолжения работы нажмите кнопку патч!');
 PopupMenu1.Items[0].Caption:='ошибка!';
 exit;
 end;

if FileExists('files\pad00000.meta.bak') then
RichEdit1.Lines.Add('редактированный файл найден!')
else
 begin
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('редактированный файл не найден.');
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('приложение остановлено.');
 RichEdit1.Lines.Add('');
 RichEdit1.SelAttributes.Color:=clred;
 RichEdit1.Lines.Add('для продолжения работы нажмите кнопку патч!');
 PopupMenu1.Items[0].Caption:='ошибка!';
 exit;
 end;
try
RichEdit1.Lines.Add(GameFolder+ '\live\bin\GameNetX86.dll');
findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
DateTime1:=FileDateToDateTime(File_Rec.Time);
RichEdit1.Lines.Add('последний запуск: '+DateTimeTostr(DateTime1));
except
RichEdit1.SelAttributes.Color:=clred;
RichEdit1.Lines.Add('игра не найдена');
RichEdit1.SelAttributes.Color:=clred;
RichEdit1.Lines.Add('приложение остановлено.');
RichEdit1.Lines.Add('');
RichEdit1.SelAttributes.Color:=clred;
RichEdit1.Lines.Add('возможно игра была удалена. или путь до папки BlackDesert указан не верно');
PopupMenu1.Items[0].Caption:='ошибка!';
exit;
end;
RichEdit1.Lines.Add('ожидание запуска клиента...');
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
  RichEdit1.Lines.Add('где-то есть новая версия: '+pars('Ver:',HashString,':Ver'));
  N9.Visible:=true;
  UpdateURL:=pars('URL:',HashString,':URL');
  end;
  //else if pars('CRC32:',HashString,':CRC32') <> CRC32('Splitter.exe') then begin
  //memo1.Lines.Add('возможно Splitter.exe был поврежден');
  //timer1.Enabled:=false;
  //memo1.Lines.Add('приложение остановленно');
// end;
  if pars('MSG:',HashString,':MSG') > '' then RichEdit1.Lines.Add(pars('MSG:',HashString,':MSG'));
  try
  if pars('Meta:',HashString,':Meta') <> CRC32('Files\pad00000.meta.ori') then
  if pars('Meta:',HashString,':Meta') = CRC32(GameFolder+ '\live\Paz\pad00000.meta') then
   RichEdit1.Lines.Add('возможно клиент игры был обновлен. обновите патч');
  except
  RichEdit1.SelAttributes.Color:=clred;
  RichEdit1.Lines.Add('не удалось проверить мета файл');
  end;
  ReTranslate('ru');
  form1.Caption:= 'BDO file splitter  ' + form2.Label3.Caption;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=50 then form4.Show;
end;

procedure TForm1.N101Click(Sender: TObject);
var
IniFile : TIniFile;
begin
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');

if TimerPath=30000 then
 begin
 RichEdit1.SelAttributes.Color:=clgreen;
 RichEdit1.Lines.Add('выставлено минимальное значение : 30 сек');
 exit;
 end;
inifile.WriteString('Global','Timer', inttostr(TimerPath-10000));
TimerPath:= strtoint(inifile.ReadString('Global','Timer', '30000'));
RichEdit1.SelAttributes.Color:=clgreen;
RichEdit1.Lines.Add('время таймера измененно, значение:'+Copy(inttostr(TimerPath), 0, inttostr(TimerPath).Length-3)+' сек');
end;

procedure TForm1.N102Click(Sender: TObject);
var
IniFile : TIniFile;
begin
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');

inifile.WriteString('Global','Timer', inttostr(TimerPath+10000));
TimerPath:= strtoint(inifile.ReadString('Global','Timer', '30000'));
RichEdit1.SelAttributes.Color:=clgreen;
RichEdit1.Lines.Add('время таймера измененно, значение:'+Copy(inttostr(TimerPath), 0, inttostr(TimerPath).Length-3)+' сек');
end;

procedure TForm1.N10Click(Sender: TObject);
begin
KillProcess('BlackDesert'+razr+'.exe');
end;

procedure TForm1.N11Click(Sender: TObject);
var
IniFile : TIniFile;
begin
 IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
 inifile.WriteString('Global','Lang', 'ru');
 ReTranslate('ru');
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (IsRunning('BlackDesert'+razr+'.exe')) then begin
  RichEdit1.SelAttributes.Color:=clred;
  RichEdit1.Lines.Add('невозможно поставить патч при запущенной игре!');
  exit;
 end;
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
 memo2.Lines.Add('---->>директории игры>>');
 GetAllFiles(GameFolder);
 memo2.Lines.Add('---->>лог приложения>>');
 logpos:=0;
 while logpos<= RichEdit1.Lines.Count do begin
 Memo2.Lines.Add(RichEdit1.Lines[logpos]);
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
 RichEdit1.Lines.Add('лог создан');
 memo2.Clear;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
form1.Hide;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
 if (IsRunning('BlackDesert'+razr+'.exe')) then begin
  RichEdit1.SelAttributes.Color:=clred;
  RichEdit1.Lines.Add('невозможно поставить патч при запущенной игре!');
  exit;
 end;
 RichEdit1.Lines.Add('фастпатч запущен.');
 RichEdit1.Lines.Add('копирование мета файла');
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'pad00000.meta',False);
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'files\pad00000.meta.ori',False);
 RichEdit1.lines[RichEdit1.lines.count-1] := RichEdit1.lines[RichEdit1.lines.count-1] + '.........ок';
 RichEdit1.Lines.Add('запуск инжектора');
 Sleep(200);
 ShellExecute(Handle, 'open', 'injector.exe', nil, nil, SW_SHOW);
 Sleep(1000);
 while IsRunning('injector.exe') do begin end;
 RichEdit1.lines[RichEdit1.lines.count-1] := RichEdit1.lines[RichEdit1.lines.count-1] + '.........ок';
 RichEdit1.Lines.Add('копирование мета файла');
 CopyFile('pad00000.meta','files\pad00000.meta.bak',False);
 RichEdit1.lines[RichEdit1.lines.count-1] := RichEdit1.lines[RichEdit1.lines.count-1] + '.........ок';
 RichEdit1.Lines.Add('фастпатч завершен.');
end;

procedure TForm1.N9Click(Sender: TObject);
begin
ShellExecute(application.Handle,'Open',PWideChar(WideString(updateURL)),Nil,Nil,SW_SHOWDEFAULT);
end;

procedure TForm1.ReShade1Click(Sender: TObject);
begin
form3.Show;
end;

procedure TForm1.show1Click(Sender: TObject);
begin
form1.Show;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
File_Rec: TSearchRec;
begin
 if gamer=0 then
  begin
  findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
  DateTime2:=FileDateToDateTime(File_Rec.Time);
  if DateTime1<>DateTime2 then begin
   CopyFile(PWideChar(WideString(AppData)),'files\torrent.resume',False);
   gamer:=1;
   DateTime1:=DateTime2;
   if CRC32(GameFolder+ '\live\Paz\pad00000.meta') <> CRC32('Files\pad00000.meta.ori') then
   if CRC32(GameFolder+ '\live\Paz\pad00000.meta') <> CRC32('Files\pad00000.meta.bak') then begin
     RichEdit1.SelAttributes.Color:=clred;
     RichEdit1.Lines.Add('патч остановлен!');
     RichEdit1.Lines.Add('завершите игру и обновите пач.');
     exit;
   end;
   CopyFile('Files\pad00000.meta.bak',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   RichEdit1.Lines.Add('патч установлен!');
   RichEdit1.Lines.Add('ожидание запуска игры...');
   PopupMenu1.Items[0].Caption:='в игре...';
   timer1.Interval:=TimerPath;
   RichEdit1.Perform(EM_LINESCROLL,0,RichEdit1.Lines.Count-1);
   exit;
  end;
  end;
 if (IsRunning('BlackDesert'+razr+'.exe')) then
  begin
  if gamer=0 then begin
   gamer:=2;
//   pyFile('files\pad00000.meta.bak',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   RichEdit1.SelAttributes.Color:=clred;
   RichEdit1.Lines.Add('игра запущена не корректно!');
   PopupMenu1.Items[0].Caption:='ошибка!';
   timer1.Enabled:=false;
   RichEdit1.SelAttributes.Color:=clred;
   RichEdit1.Lines.Add('завершите игру, перезапустите сплиттер.');
   DateTime1:=DateTime2;
   exit;
  end
  else
  if gamer=1 then begin
   RichEdit1.Lines.Add('игра запущена.');
   gamer:=2;
   timer1.Interval:=5000;
   RichEdit1.Perform(EM_LINESCROLL,0,RichEdit1.Lines.Count-1);
   form1.Hide;
   exit
  end;
  end
 else
  if gamer=2 then
  begin
   gamer:=0;
   RichEdit1.Lines.Add('игра закрыта.');
   CopyFile('Files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   RichEdit1.Lines.Add('патч удален!');
   PopupMenu1.Items[0].Caption:='игра закрыта';
   timer1.Interval:=10;
   form1.Show;
   RichEdit1.Lines.Add('ожидание запуска клиента...');
   findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
   DateTime2:=FileDateToDateTime(File_Rec.Time);
   DateTime1:=DateTime2;
   RichEdit1.Perform(EM_LINESCROLL,0,RichEdit1.Lines.Count-1);
   CopyFile('files\torrent.resume',PWideChar(WideString(AppData)),False);
   exit
  end;
  if gamer=1 then
  begin
   gamer:=0;
   RichEdit1.SelAttributes.Color:=clred;
   RichEdit1.Lines.Add('истекло время ожидания игры');
   RichEdit1.Lines.Add('добавте время ожидания во вкладке дополнительно');
   CopyFile('Files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
   RichEdit1.Lines.Add('патч удален!');
   PopupMenu1.Items[0].Caption:='игра закрыта';
   timer1.Interval:=10;
   form1.Show;
   RichEdit1.Lines.Add('ожидание запуска клиента...');
   findFirst(GameFolder+ '\live\bin\GameNetX86.dll', 1, File_Rec);
   DateTime2:=FileDateToDateTime(File_Rec.Time);
   DateTime1:=DateTime2;
   RichEdit1.Perform(EM_LINESCROLL,0,RichEdit1.Lines.Count-1);
   CopyFile('File\torrent.resume',PWideChar(WideString(AppData)),False);
   exit
  end;
end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
form1.Show;
end;

end.
