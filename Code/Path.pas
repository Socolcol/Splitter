unit Path;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, IniFiles, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, TlHelp32, ShellAPI,
  IdBaseComponent, IdComponent, FileCtrl, IOUtils, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    CheckBox9: TCheckBox;
    GroupBox1: TGroupBox;
    armor1: TRadioButton;
    armor2: TRadioButton;
    RadioButton3: TRadioButton;
    armor3: TRadioButton;
    GroupBox4: TGroupBox;
    boots1: TRadioButton;
    boots2: TRadioButton;
    RadioButton12: TRadioButton;
    GroupBox3: TGroupBox;
    glowers1: TRadioButton;
    glowers2: TRadioButton;
    RadioButton9: TRadioButton;
    GroupBox2: TGroupBox;
    underwear1: TRadioButton;
    underwear2: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox6: TGroupBox;
    sorkweap1: TRadioButton;
    sorkweap2: TRadioButton;
    RadioButton17: TRadioButton;
    GroupBox5: TGroupBox;
    lifeskill1: TRadioButton;
    RadioButton15: TRadioButton;
    GroupBox8: TGroupBox;
    lowerbody1: TRadioButton;
    lowerbody2: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox9: TGroupBox;
    hats1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox10: TGroupBox;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    GroupBox7: TGroupBox;
    nude1: TRadioButton;
    nude2: TRadioButton;
    nude6: TRadioButton;
    nude3: TRadioButton;
    nude4: TRadioButton;
    nudetamer: TCheckBox;
    nude5: TRadioButton;
    nude7: TRadioButton;
    nude8: TRadioButton;
    nude9: TRadioButton;
    TabSheet4: TTabSheet;
    Label2: TLabel;
    Memo1: TMemo;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    Memo2: TMemo;
    Label3: TLabel;
    TrackBar2: TTrackBar;
    Label4: TLabel;
    TrackBar3: TTrackBar;
    Label5: TLabel;
    TrackBar4: TTrackBar;
    CheckBox8: TCheckBox;
    CheckBox10: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    HD1: TRadioButton;
    HD2: TRadioButton;
    HD4: TRadioButton;
    HD7: TRadioButton;
    HD5: TRadioButton;
    HD8: TRadioButton;
    HD3: TRadioButton;
    HD6: TRadioButton;
    HD9: TRadioButton;
    ImageList1: TImageList;
    Image1: TImage;
    SD1: TRadioButton;
    SD2: TRadioButton;
    SD3: TRadioButton;
    SD4: TRadioButton;
    SD5: TRadioButton;
    SD6: TRadioButton;
    SD7: TRadioButton;
    SD8: TRadioButton;
    SD9: TRadioButton;
    procedure TrackBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TexturePars(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure HD1Click(Sender: TObject);
    procedure HD2Click(Sender: TObject);
    procedure HD3Click(Sender: TObject);
    procedure HD4Click(Sender: TObject);
    procedure HD5Click(Sender: TObject);
    procedure HD6Click(Sender: TObject);
    procedure HD7Click(Sender: TObject);
    procedure HD8Click(Sender: TObject);
    procedure HD9Click(Sender: TObject);
    procedure nude1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
{$R data.RES}

uses Unit1;

procedure ExtractRes(ResType, ResName, ResNewName : String);
var
Res : TResourceStream;
Begin
Res:=TResourceStream.Create(Hinstance, Resname, Pchar(ResType));
Res.SavetoFile(ResNewName);
Res.Free;
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

procedure TForm4.nude1Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(7, Image1.Picture.Bitmap);
end;

procedure TForm4.HD7Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(6, Image1.Picture.Bitmap);
end;

procedure TForm4.HD5Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(3, Image1.Picture.Bitmap);
end;

procedure TForm4.HD8Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(8, Image1.Picture.Bitmap);
end;

procedure TForm4.HD3Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(2, Image1.Picture.Bitmap);
end;

procedure TForm4.HD6Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(5, Image1.Picture.Bitmap);
end;

procedure TForm4.HD9Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(9, Image1.Picture.Bitmap);
end;

procedure TForm4.HD1Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(0, Image1.Picture.Bitmap);
end;

procedure TForm4.HD2Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(1, Image1.Picture.Bitmap);
end;

procedure TForm4.HD4Click(Sender: TObject);
begin
Image1.Picture:= nil;
Imagelist1.GetBitmap(4, Image1.Picture.Bitmap);
end;

procedure TForm4.TexturePars(Sender: TObject);
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
     Application.ProcessMessages;
    form1.Repaint;
    name:='';
   until FindNext(SR) <> 0;
  FindClose(SR);
  memo2.Clear;
end;

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

procedure TForm4.Button2Click(Sender: TObject);
var
SR: TSearchRec;
IniFile : TIniFile;
count1,TexturesCount,count2,texturesall :integer;
Rawdata, state1,state2: string;
Http  : TidHttp;
URL,HashString : String;
begin

 memo1.Lines.Add('извлечение пакетов');
 ExtractRes('data', 'names',ExtractFilePath(Application.ExeName) +  '\patcher_resources\names.txt');
 ExtractRes('EXEFILE', 'injector',ExtractFilePath(Application.ExeName) +  '\injector.exe');
 ExtractRes('data', 'modlist',ExtractFilePath(Application.ExeName) +  '\Files\modlist.ini');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 if FileExists('patcher_resources\hashes.txt') then  memo1.Lines.Add('проверка хешей')
else  begin
 memo1.Lines.Add('загрузка хешей');
 memo1.Lines.Add('(может показатся что зависло, но так задуманно)');
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

 if checkbox8.Checked=false then begin
 memo1.Lines.Add('удаление прошлых модов');
 try
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\files_to_patch\', True);
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\Patch\', True);
 finally
 memo1.Lines.Add('файлы удалены.');
 end;
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
   if CheckBox10.Checked=true then begin
   memo1.Lines.Add('установка текстур Орен');
   memo1.Lines.Add('загрузка текстур. 1\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/pew_00_ub_0034_01_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_01_hair.dds');
   memo1.Lines.Add('загрузка текстур. 2\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/pew_00_ub_0034_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_hair.dds');
  end;
  if form4.nude1.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Follys');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/follys/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude2.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Basebody');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude3.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Pufferfishs');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Pufferfish/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude4.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Jokus (бритая)');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude5.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Jokus');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pbw_00_nude_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/joku/JokuV5bALLNEW/pww_01_nude_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude6.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Eyenights (бритая)');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/NoPubicHair/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude7.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Eyenights');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Eyenights/ThinPubicHair/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nude9.Checked=true then begin
   memo1.Lines.Add('установка текстур тел Areola');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Basebody/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PEW_01_NUDE_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PHW_01_NUDE_0001.DDS',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/areola/PWW_01_NUDE_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if HD1.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD full bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/full_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/full_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/full_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/full_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if HD2.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD medium bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
   if HD3.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD medium bush 2');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush2/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush2/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush2/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush2/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if HD4.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD small bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if HD5.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD small bush 2');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush_2/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush_2/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush_2/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush_2/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if HD6.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD thin landing strip');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/thin_landing_strip/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/thin_landing_strip/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/thin_landing_strip/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/thin_landing_strip/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if HD7.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD trimmed');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/trimmed/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/trimmed/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/trimmed/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/trimmed/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if HD8.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD wide landing strip');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wide_landing_strip/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wide_landing_strip/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wide_landing_strip/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wide_landing_strip/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if HD9.Checked=true then begin
   memo1.Lines.Add('установка текстур тел HD wider trimmed');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wider_trimmed/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wider_trimmed/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wider_trimmed/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wider_trimmed/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD1.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD full bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/full_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/full_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/full_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/full_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if SD2.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD medium bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
   if SD3.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD medium bush 2');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush2/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush2/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush2/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/medium_bush2/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if SD4.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD small bush');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD5.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD small bush 2');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush_2/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush_2/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush_2/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/small_bush_2/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD6.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD thin landing strip');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/thin_landing_strip/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/thin_landing_strip/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/thin_landing_strip/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/thin_landing_strip/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD7.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD trimmed');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/trimmed/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/trimmed/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/trimmed/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/trimmed/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD8.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD wide landing strip');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wide_landing_strip/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wide_landing_strip/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wide_landing_strip/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wide_landing_strip/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
    if SD9.Checked=true then begin
   memo1.Lines.Add('установка текстур тел SD wider trimmed');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wider_trimmed/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wider_trimmed/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wider_trimmed/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/SD/wider_trimmed/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
  if form4.nudetamer.Checked=true then
   ExtractRes('data', 'tex81',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');

  memo1.Lines.Add('удаление частей брони');
  IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
  count1:=0;
  count2:=0;
  if armor1.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorall','files', '1'));
  if armor2.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorstarter','files', '1'));
  if armor3.Checked=true then count1:=count1+strtoint(inifile.ReadString('armorregular','files', '1'));
  if underwear1.Checked=true then count1:=count1+strtoint(inifile.ReadString('underwearall','files', '1'));
  if underwear2.Checked=true then count1:=count1+strtoint(inifile.ReadString('underwearstarter','files', '1'));
  if boots1.Checked=true then count1:=count1+strtoint(inifile.ReadString('bootsall','files', '1'));
  if boots2.Checked=true then count1:=count1+strtoint(inifile.ReadString('bootsstarter','files', '1'));
  if glowers1.Checked=true then count1:=count1+strtoint(inifile.ReadString('glowersall','files', '1'));
  if glowers2.Checked=true then count1:=count1+strtoint(inifile.ReadString('glowersstarter','files', '1'));
  if lifeskill1.Checked=true then count1:=count1+strtoint(inifile.ReadString('lifeskill','files', '1'));
  if sorkweap1.Checked=true then count1:=count1+strtoint(inifile.ReadString('sorkweapall','files', '1'));
  if sorkweap2.Checked=true then count1:=count1+strtoint(inifile.ReadString('sorkwaepstarter','files', '1'));
  if lowerbody1.Checked=true then count1:=count1+strtoint(inifile.ReadString('lowerbodyall','files', '1'));
  if lowerbody2.Checked=true then count1:=count1+strtoint(inifile.ReadString('lowerbodystarter','files', '1'));
  if hats1.Checked=true then count1:=count1+strtoint(inifile.ReadString('hatsall','files', '1'));
  if CheckBox9.Checked=true then count1:=count1+strtoint(inifile.ReadString('ddspatch','files', '1'));
  TexturesCount:=1;
  if form4.armor1.Checked=true then begin
   texturesall:=strtoint(inifile.ReadString('armorall','files', '1'));
   while TexturesCount <= texturesall do begin
    ExtractRes('data', 'alpha',ExtractFilePath(Application.ExeName) +  'Patch\pac\'+inifile.ReadString('armorall','file'+inttostr(TexturesCount), '1')+'.pac');
    TexturesCount:=TexturesCount+1;
    count2:=count2+1;
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
    memo1.Lines.Add('('+inttostr(count2)+'\'+inttostr(count1)+') '+inifile.ReadString('ddspatch','file'+inttostr(TexturesCount), '1')+'.pac');
  end;
  memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 end else memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....отменена';

  if form4.checkbox1.checked=true then begin
   memo1.Lines.Add('установка мода на грудь сорки');
   ExtractRes('data', 'breast4',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_soc.xml');
    state1:='	<ParamDesc Index="143" Min="0.70 0.70 0.70" Max="';
    state1:=state1+label2.caption+' '+label2.caption+' '+label2.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Breast" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    state2:='	<ParamDesc Index="144" Min="0.70 0.70 0.70" Max="';
    state2:=state2+label2.caption+' '+label2.caption+' '+label2.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Breast" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="X" WeightAxis02="Y" WeightAxis03="Z"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_soc.xml');
    Memo2.Lines[161]:=state1;
    Memo2.Lines[162]:=state2;
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    state1:='	<ParamDesc Index="132" Min="0.90 0.88 0.88" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.88 0.88" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[150]:=state1;
    Memo2.Lines[151]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[155]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[159]:=state1;
    Memo2.Lines[160]:=state2;
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
    Application.ProcessMessages;
   until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование xml файлов');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( 'files_to_patch\character\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
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
    Application.ProcessMessages;
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
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);
 memo1.Lines.Add('копирование xml в папку игры');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder +'\live\character\'+SR.name)),False);
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
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
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);
 memo1.Lines.Add('патч завершен. перезапустите сплиттер.');
end;

procedure TForm4.TrackBar1Change(Sender: TObject);
var a:real;
begin
a:=trackbar1.Position/100;
label1.Caption:='грудь : '+floattostr(a);
label2.Caption:=StringReplace(floattostr(a), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar2Change(Sender: TObject);
var a:real;
begin
a:=trackbar2.Position/100;
label3.Caption:='бедра : '+floattostr(a);
label6.Caption:=StringReplace(floattostr(a), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar3Change(Sender: TObject);
var a:real;
begin
a:=trackbar3.Position/100;
label4.Caption:='таз : '+floattostr(a);
label7.Caption:=StringReplace(floattostr(a), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar4Change(Sender: TObject);
var a:real;
begin
a:=trackbar4.Position/100;
label5.Caption:='попка : '+floattostr(a);
label8.Caption:=StringReplace(floattostr(a), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

end.
