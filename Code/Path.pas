unit Path;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, IniFiles, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, TlHelp32, ShellAPI,
  IdBaseComponent, IdComponent, FileCtrl, IOUtils, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.OleCtrls, SHDocVw,
  IdAntiFreezeBase, Vcl.IdAntiFreeze;

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
    armor4: TRadioButton;
    armor3: TRadioButton;
    GroupBox4: TGroupBox;
    boots1: TRadioButton;
    boots2: TRadioButton;
    boots3: TRadioButton;
    GroupBox3: TGroupBox;
    glowers1: TRadioButton;
    glowers2: TRadioButton;
    glowers3: TRadioButton;
    GroupBox2: TGroupBox;
    underwear1: TRadioButton;
    underwear2: TRadioButton;
    underwear3: TRadioButton;
    GroupBox6: TGroupBox;
    sorkweap1: TRadioButton;
    sorkweap2: TRadioButton;
    sorkweap3: TRadioButton;
    GroupBox5: TGroupBox;
    lifeskill1: TRadioButton;
    lifeskill2: TRadioButton;
    GroupBox8: TGroupBox;
    lowerbody1: TRadioButton;
    lowerbody2: TRadioButton;
    lowerbody3: TRadioButton;
    GroupBox9: TGroupBox;
    hats1: TRadioButton;
    hats2: TRadioButton;
    hats3: TRadioButton;
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
    nude5: TRadioButton;
    nude7: TRadioButton;
    nude8: TRadioButton;
    nude9: TRadioButton;
    TabSheet4: TTabSheet;
    Label2: TLabel;
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
    SD1: TRadioButton;
    SD2: TRadioButton;
    SD3: TRadioButton;
    SD4: TRadioButton;
    SD5: TRadioButton;
    SD6: TRadioButton;
    SD7: TRadioButton;
    SD8: TRadioButton;
    SD9: TRadioButton;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    WebBrowser1: TWebBrowser;
    GroupBox11: TGroupBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    GroupBox12: TGroupBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    TabSheet5: TTabSheet;
    CheckBox27: TCheckBox;
    WebBrowser2: TWebBrowser;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    Label11: TLabel;
    CheckBox31: TCheckBox;
    memo1: TRichEdit;
    CheckBox32: TCheckBox;
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
    procedure nude8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure CheckBox27Click(Sender: TObject);
    procedure CheckBox28Click(Sender: TObject);
    procedure CheckBox29Click(Sender: TObject);
    procedure CheckBox30Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
{$R DataRes.RES}

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
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.nude8Click(Sender: TObject);
begin
checkbox8.Checked:=true;
end;

procedure TForm4.HD7Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/trimmed/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD5Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush_2/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD8Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wide_landing_strip/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD3Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush2/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD6Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/thin_landing_strip/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD9Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/wider_trimmed/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.CheckBox27Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
 WebBrowser2.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/1/Vlada1.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.CheckBox28Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
 WebBrowser2.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/2/Vlada2.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.CheckBox29Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
 WebBrowser2.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/4/Vlada4.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.CheckBox30Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
 WebBrowser2.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/3/Vlada3.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
var
IniFile : TIniFile;
begin
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
 if armor1.Checked=true then inifile.WriteString('settings','armor1', '1')
  else inifile.WriteString('settings','armor1', '0');
 if armor2.Checked=true then inifile.WriteString('settings','armor2', '1')
  else inifile.WriteString('settings','armor2', '0');
 if armor3.Checked=true then inifile.WriteString('settings','armor3', '1')
  else inifile.WriteString('settings','armor3', '0');
 if armor4.Checked=true then inifile.WriteString('settings','armor4', '1')
  else inifile.WriteString('settings','armor4', '0');
 if boots1.Checked=true then inifile.WriteString('settings','boots1', '1')
  else inifile.WriteString('settings','boots1', '0');
 if boots2.Checked=true then inifile.WriteString('settings','boots2', '1')
  else inifile.WriteString('settings','boots2', '0');
 if boots3.Checked=true then inifile.WriteString('settings','boots3', '1')
  else inifile.WriteString('settings','boots3', '0');
 if glowers1.Checked=true then inifile.WriteString('settings','glowers1', '1')
  else inifile.WriteString('settings','glowers1', '0');
 if glowers2.Checked=true then inifile.WriteString('settings','glowers2', '1')
  else inifile.WriteString('settings','glowers2', '0');
 if glowers3.Checked=true then inifile.WriteString('settings','glowers3', '1')
  else inifile.WriteString('settings','glowers3', '0');
 if underwear1.Checked=true then inifile.WriteString('settings','underwear1', '1')
  else inifile.WriteString('settings','underwear1', '0');
 if underwear2.Checked=true then inifile.WriteString('settings','underwear2', '1')
  else inifile.WriteString('settings','underwear2', '0');
 if underwear3.Checked=true then inifile.WriteString('settings','underwear3', '1')
  else inifile.WriteString('settings','underwear3', '0');
 if sorkweap1.Checked=true then inifile.WriteString('settings','sorkweap1', '1')
  else inifile.WriteString('settings','sorkweap1', '0');
 if sorkweap2.Checked=true then inifile.WriteString('settings','sorkweap2', '1')
  else inifile.WriteString('settings','sorkweap2', '0');
 if sorkweap3.Checked=true then inifile.WriteString('settings','sorkweap3', '1')
  else inifile.WriteString('settings','sorkweap3', '0');
 if lifeskill1.Checked=true then inifile.WriteString('settings','lifeskill1', '1')
  else inifile.WriteString('settings','lifeskill1', '0');
 if lifeskill2.Checked=true then inifile.WriteString('settings','lifeskill2', '1')
  else inifile.WriteString('settings','lifeskill2', '0');
 if lowerbody1.Checked=true then inifile.WriteString('settings','lowerbody1', '1')
  else inifile.WriteString('settings','lowerbody1', '0');
 if lowerbody2.Checked=true then inifile.WriteString('settings','lowerbody2', '1')
  else inifile.WriteString('settings','lowerbody2', '0');
 if lowerbody3.Checked=true then inifile.WriteString('settings','lowerbody3', '1')
  else inifile.WriteString('settings','lowerbody3', '0');
 if hats1.Checked=true then inifile.WriteString('settings','hats1', '1')
  else inifile.WriteString('settings','hats1', '0');
 if hats2.Checked=true then inifile.WriteString('settings','hats2', '1')
  else inifile.WriteString('settings','hats2', '0');
 if hats3.Checked=true then inifile.WriteString('settings','hats3', '1')
  else inifile.WriteString('settings','hats3', '0');

 if CheckBox1.Checked=true then inifile.WriteString('settings','CheckBox1', '1')
  else inifile.WriteString('settings','CheckBox1', '0');
 if CheckBox2.Checked=true then inifile.WriteString('settings','CheckBox2', '1')
  else inifile.WriteString('settings','CheckBox2', '0');
 if CheckBox3.Checked=true then inifile.WriteString('settings','CheckBox3', '1')
  else inifile.WriteString('settings','CheckBox3', '0');
 if CheckBox4.Checked=true then inifile.WriteString('settings','CheckBox4', '1')
  else inifile.WriteString('settings','CheckBox4', '0');
 if CheckBox5.Checked=true then inifile.WriteString('settings','CheckBox5', '1')
  else inifile.WriteString('settings','CheckBox5', '0');
 if CheckBox6.Checked=true then inifile.WriteString('settings','CheckBox6', '1')
  else inifile.WriteString('settings','CheckBox6', '0') ;
 if CheckBox7.Checked=true then inifile.WriteString('settings','CheckBox7', '1')
  else inifile.WriteString('settings','CheckBox7', '0');
 if CheckBox8.Checked=true then inifile.WriteString('settings','CheckBox8', '1')
  else inifile.WriteString('settings','CheckBox8', '0');
 if CheckBox9.Checked=true then inifile.WriteString('settings','CheckBox9', '1')
  else inifile.WriteString('settings','CheckBox9', '0');
 if CheckBox10.Checked=true then inifile.WriteString('settings','CheckBox10', '1')
  else inifile.WriteString('settings','CheckBox10', '0');
 if CheckBox11.Checked=true then inifile.WriteString('settings','CheckBox11', '1')
  else inifile.WriteString('settings','CheckBox11', '0');
 if CheckBox12.Checked=true then inifile.WriteString('settings','CheckBox12', '1')
  else inifile.WriteString('settings','CheckBox12', '0');
 if CheckBox13.Checked=true then inifile.WriteString('settings','CheckBox13', '1')
  else inifile.WriteString('settings','CheckBox13', '0');
 if CheckBox14.Checked=true then inifile.WriteString('settings','CheckBox14', '1')
  else inifile.WriteString('settings','CheckBox14', '0');
  if CheckBox15.Checked=true then inifile.WriteString('settings','CheckBox15', '1')
  else inifile.WriteString('settings','CheckBox15', '0');
  if CheckBox16.Checked=true then inifile.WriteString('settings','CheckBox16', '1')
  else inifile.WriteString('settings','CheckBox16', '0');
  if CheckBox17.Checked=true then inifile.WriteString('settings','CheckBox17', '1')
  else inifile.WriteString('settings','CheckBox17', '0');
  if CheckBox18.Checked=true then inifile.WriteString('settings','CheckBox18', '1')
  else inifile.WriteString('settings','CheckBox18', '0');
  if CheckBox19.Checked=true then inifile.WriteString('settings','CheckBox19', '1')
  else inifile.WriteString('settings','CheckBox19', '0');
  if CheckBox20.Checked=true then inifile.WriteString('settings','CheckBox20', '1')
  else inifile.WriteString('settings','CheckBox20', '0');
  if CheckBox21.Checked=true then inifile.WriteString('settings','CheckBox21', '1')
  else inifile.WriteString('settings','CheckBox21', '0');
  if CheckBox22.Checked=true then inifile.WriteString('settings','CheckBox22', '1')
  else inifile.WriteString('settings','CheckBox22', '0');
  if CheckBox23.Checked=true then inifile.WriteString('settings','CheckBox23', '1')
  else inifile.WriteString('settings','CheckBox23', '0');
  if CheckBox24.Checked=true then inifile.WriteString('settings','CheckBox24', '1')
  else inifile.WriteString('settings','CheckBox24', '0');
  if CheckBox25.Checked=true then inifile.WriteString('settings','CheckBox25', '1')
  else inifile.WriteString('settings','CheckBox25', '0');
  if CheckBox26.Checked=true then inifile.WriteString('settings','CheckBox26', '1')
  else inifile.WriteString('settings','CheckBox26', '0');
  if CheckBox27.Checked=true then inifile.WriteString('settings','CheckBox27', '1')
  else inifile.WriteString('settings','CheckBox27', '0');
  if CheckBox28.Checked=true then inifile.WriteString('settings','CheckBox28', '1')
  else inifile.WriteString('settings','CheckBox28', '0');
  if CheckBox29.Checked=true then inifile.WriteString('settings','CheckBox29', '1')
  else inifile.WriteString('settings','CheckBox29', '0');
  if CheckBox30.Checked=true then inifile.WriteString('settings','CheckBox30', '1')
  else inifile.WriteString('settings','CheckBox30', '0');
  inifile.WriteString('settings','track1', inttostr(TrackBar1.Position));
  inifile.WriteString('settings','track2', inttostr(TrackBar2.Position));
  inifile.WriteString('settings','track3', inttostr(TrackBar3.Position));
  inifile.WriteString('settings','track4', inttostr(TrackBar4.Position));

 if HD1.Checked=true then inifile.WriteString('settings','HDtex', '1')else
 if HD2.Checked=true then inifile.WriteString('settings','HDtex', '2')else
 if HD3.Checked=true then inifile.WriteString('settings','HDtex', '3')else
 if HD4.Checked=true then inifile.WriteString('settings','HDtex', '4')else
 if HD5.Checked=true then inifile.WriteString('settings','HDtex', '5')else
 if HD6.Checked=true then inifile.WriteString('settings','HDtex', '6')else
 if HD7.Checked=true then inifile.WriteString('settings','HDtex', '7')else
 if HD8.Checked=true then inifile.WriteString('settings','HDtex', '8')else
 if HD9.Checked=true then inifile.WriteString('settings','HDtex', '9')else
 inifile.WriteString('settings','HDtex', '0');

 if SD1.Checked=true then inifile.WriteString('settings','SDtex', '1')else
 if SD2.Checked=true then inifile.WriteString('settings','SDtex', '2')else
 if SD3.Checked=true then inifile.WriteString('settings','SDtex', '3')else
 if SD4.Checked=true then inifile.WriteString('settings','SDtex', '4')else
 if SD5.Checked=true then inifile.WriteString('settings','SDtex', '5')else
 if SD6.Checked=true then inifile.WriteString('settings','SDtex', '6')else
 if SD7.Checked=true then inifile.WriteString('settings','SDtex', '7')else
 if SD8.Checked=true then inifile.WriteString('settings','SDtex', '8')else
 if SD9.Checked=true then inifile.WriteString('settings','SDtex', '9')else
 inifile.WriteString('settings','SDtex', '0');

 if nude1.Checked=true then inifile.WriteString('settings','nude', '1')else
 if nude2.Checked=true then inifile.WriteString('settings','nude', '2')else
 if nude3.Checked=true then inifile.WriteString('settings','nude', '3')else
 if nude4.Checked=true then inifile.WriteString('settings','nude', '4')else
 if nude5.Checked=true then inifile.WriteString('settings','nude', '5')else
 if nude6.Checked=true then inifile.WriteString('settings','nude', '6')else
 if nude7.Checked=true then inifile.WriteString('settings','nude', '7')else
 if nude8.Checked=true then inifile.WriteString('settings','nude', '8')else
  inifile.WriteString('settings','nude', '0');

end;

procedure TForm4.FormShow(Sender: TObject);
var
IniFile : TIniFile;
begin
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\settings.ini');
 if inifile.ReadString('settings','armor1', '0')='1' then armor1.Checked:=true;
 if inifile.ReadString('settings','armor2', '0')='1' then armor2.Checked:=true;
 if inifile.ReadString('settings','armor3', '0')='1' then armor3.Checked:=true;
 if inifile.ReadString('settings','armor4', '0')='1' then armor4.Checked:=true;
 if inifile.ReadString('settings','boots1', '0')='1' then boots1.Checked:=true;
 if inifile.ReadString('settings','boots2', '0')='1' then boots2.Checked:=true;
 if inifile.ReadString('settings','boots3', '0')='1' then boots3.Checked:=true;
 if inifile.ReadString('settings','glowers1', '0')='1' then glowers1.Checked:=true;
 if inifile.ReadString('settings','glowers2', '0')='1' then glowers2.Checked:=true;
 if inifile.ReadString('settings','glowers3', '0')='1' then glowers3.Checked:=true;
 if inifile.ReadString('settings','underwear1', '0')='1' then underwear1.Checked:=true;
 if inifile.ReadString('settings','underwear2', '0')='1' then underwear2.Checked:=true;
 if inifile.ReadString('settings','underwear3', '0')='1' then underwear3.Checked:=true;
 if inifile.ReadString('settings','sorkweap1', '0')='1' then sorkweap1.Checked:=true;
 if inifile.ReadString('settings','sorkweap2', '0')='1' then sorkweap2.Checked:=true;
 if inifile.ReadString('settings','sorkweap3', '0')='1' then sorkweap3.Checked:=true;
 if inifile.ReadString('settings','lifeskill2', '0')='1' then lifeskill2.Checked:=true;
 if inifile.ReadString('settings','lifeskill1', '0')='1' then lifeskill1.Checked:=true;
 if inifile.ReadString('settings','lowerbody1', '0')='1' then lowerbody1.Checked:=true;
 if inifile.ReadString('settings','lowerbody2', '0')='1' then lowerbody2.Checked:=true;
 if inifile.ReadString('settings','lowerbody3', '0')='1' then lowerbody3.Checked:=true;
 if inifile.ReadString('settings','hats1', '0')='1' then hats1.Checked:=true;
 if inifile.ReadString('settings','hats2', '0')='1' then hats2.Checked:=true;
 if inifile.ReadString('settings','hats3', '0')='1' then hats3.Checked:=true;
  if inifile.ReadString('settings','CheckBox1', '0')='1' then CheckBox1.Checked:=true;
  if inifile.ReadString('settings','CheckBox2', '0')='1' then CheckBox2.Checked:=true;
  if inifile.ReadString('settings','CheckBox3', '0')='1' then CheckBox3.Checked:=true;
  if inifile.ReadString('settings','CheckBox4', '0')='1' then CheckBox4.Checked:=true;
  if inifile.ReadString('settings','CheckBox5', '0')='1' then CheckBox5.Checked:=true;
  if inifile.ReadString('settings','CheckBox6', '0')='1' then CheckBox6.Checked:=true;
  if inifile.ReadString('settings','CheckBox7', '0')='1' then CheckBox7.Checked:=true;
  if inifile.ReadString('settings','CheckBox8', '0')='1' then CheckBox8.Checked:=true;
  if inifile.ReadString('settings','CheckBox9', '0')='1' then CheckBox9.Checked:=true;
  if inifile.ReadString('settings','CheckBox10', '0')='1' then CheckBox10.Checked:=true;
  if inifile.ReadString('settings','CheckBox11', '0')='1' then CheckBox11.Checked:=true;
  if inifile.ReadString('settings','CheckBox12', '0')='1' then CheckBox12.Checked:=true;
  if inifile.ReadString('settings','CheckBox13', '0')='1' then CheckBox13.Checked:=true;
  if inifile.ReadString('settings','CheckBox14', '0')='1' then CheckBox14.Checked:=true;
  if inifile.ReadString('settings','CheckBox15', '0')='1' then CheckBox15.Checked:=true;
  if inifile.ReadString('settings','CheckBox16', '0')='1' then CheckBox16.Checked:=true;
  if inifile.ReadString('settings','CheckBox17', '0')='1' then CheckBox17.Checked:=true;
  if inifile.ReadString('settings','CheckBox18', '0')='1' then CheckBox18.Checked:=true;
  if inifile.ReadString('settings','CheckBox19', '0')='1' then CheckBox19.Checked:=true;
  if inifile.ReadString('settings','CheckBox20', '0')='1' then CheckBox20.Checked:=true;
  if inifile.ReadString('settings','CheckBox21', '0')='1' then CheckBox21.Checked:=true;
  if inifile.ReadString('settings','CheckBox22', '0')='1' then CheckBox22.Checked:=true;
  if inifile.ReadString('settings','CheckBox23', '0')='1' then CheckBox23.Checked:=true;
  if inifile.ReadString('settings','CheckBox24', '0')='1' then CheckBox24.Checked:=true;
  if inifile.ReadString('settings','CheckBox25', '0')='1' then CheckBox25.Checked:=true;
  if inifile.ReadString('settings','CheckBox26', '0')='1' then CheckBox26.Checked:=true;
  if inifile.ReadString('settings','CheckBox27', '0')='1' then CheckBox27.Checked:=true;
  if inifile.ReadString('settings','CheckBox28', '0')='1' then CheckBox28.Checked:=true;
  if inifile.ReadString('settings','CheckBox29', '0')='1' then CheckBox29.Checked:=true;
  if inifile.ReadString('settings','CheckBox30', '0')='1' then CheckBox30.Checked:=true;
  TrackBar1.Position:=strtoint(inifile.ReadString('settings','track1', '125'));
  TrackBar2.Position:=strtoint(inifile.ReadString('settings','track2', '135'));
  TrackBar3.Position:=strtoint(inifile.ReadString('settings','track3', '90'));
  TrackBar4.Position:=strtoint(inifile.ReadString('settings','track4', '100'));
 case strtoint(inifile.ReadString('settings','HDtex', '0')) of
  1: HD1.Checked:=true;
  2: HD2.Checked:=true;
  3: HD3.Checked:=true;
  4: HD4.Checked:=true;
  5: HD5.Checked:=true;
  6: HD6.Checked:=true;
  7: HD7.Checked:=true;
  8: HD8.Checked:=true;
  9: HD9.Checked:=true;
 end;
 case strtoint(inifile.ReadString('settings','SDtex', '0')) of
  1: SD1.Checked:=true;
  2: SD2.Checked:=true;
  3: SD3.Checked:=true;
  4: SD4.Checked:=true;
  5: SD5.Checked:=true;
  6: SD6.Checked:=true;
  7: SD7.Checked:=true;
  8: SD8.Checked:=true;
  9: SD9.Checked:=true;
 end;
 case strtoint(inifile.ReadString('settings','nude', '0')) of
  1: nude1.Checked:=true;
  2: nude2.Checked:=true;
  3: nude3.Checked:=true;
  4: nude4.Checked:=true;
  5: nude5.Checked:=true;
  6: nude6.Checked:=true;
  7: nude7.Checked:=true;
  8: begin nude7.Checked:=true; checkbox8.Checked:=true; end;
 end;
end;

procedure TForm4.HD1Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/full_bush/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);

end;

procedure TForm4.HD2Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/medium_bush/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.HD4Click(Sender: TObject);
var
  Flags, TargetFrameName, PostData, Headers: OleVariant;
begin
  WebBrowser1.Navigate('https://github.com/Socolcol/Splitter/raw/master/texture/publichair/HD/small_bush/preview.jpg', Flags,
    TargetFrameName, PostData, Headers);
end;

procedure TForm4.TexturePars(Sender: TObject);
var
  SR: TSearchRec;
  pos1: integer;
  name :string;
begin
 memo2.Lines.LoadFromFile('Files\names.txt');

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
 button2.Hide;
 Memo1.SetFocus;
 pagecontrol1.Pages[0].Enabled:=false;
 pagecontrol1.Pages[1].Enabled:=false;
 pagecontrol1.Pages[2].Enabled:=false;
 pagecontrol1.Pages[3].Enabled:=false;
 memo1.Lines.Add('извлечение пакетов');
 ExtractRes('data', 'names',ExtractFilePath(Application.ExeName) +  '\Files\names.txt');
 ExtractRes('data', 'missing',GameFolder +'\live\Paz\patcher_resources\names.txt');
 ExtractRes('EXEFILE', 'injector',GameFolder +'\live\Paz\injector.exe');
 ExtractRes('data', 'modlist',ExtractFilePath(Application.ExeName) +  '\Files\modlist.ini');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';

 if checkbox8.Checked=false then begin
 memo1.Lines.Add('удаление прошлых модов');
 try
 ForceDirectories(GameFolder +'\live\gamecommondata\');   memo1.Lines.Add('2');
 ForceDirectories(GameFolder +'\live\character\');    memo1.Lines.Add('2');
 TDirectory.Delete(GameFolder +'\live\Paz\files_to_patch\', True);  memo1.Lines.Add('2');
 TDirectory.Delete(ExtractFilePath(Application.ExeName) + '\Patch\', True);   memo1.Lines.Add('2');
  TDirectory.Delete(GameFolder + '\live\character\', True);  memo1.Lines.Add('2');
  TDirectory.Delete(GameFolder + '\live\gamecommondata\', True);   memo1.Lines.Add('2');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\Patch\pac');   memo1.Lines.Add('2');
 finally
 memo1.SelAttributes.Color:=clgreen;
 memo1.Lines.Add('файлы удалены.');
 end;
 end;
 CreateDir('Patch');
 ForceDirectories(GameFolder +'\live\gamecommondata\');
 ForceDirectories(GameFolder +'\live\character\');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\texture');     memo1.Lines.Add('3');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\stringtable\ru'); memo1.Lines.Add('4');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pbw');  memo1.Lines.Add('5');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\phw');  memo1.Lines.Add('6');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pew');   memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pww');   memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pkww');  memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pvw');   memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pnw');   memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\phm');    memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pgm');    memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pkm');   memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pwm');    memo1.Lines.Add('файлы удалены.');
 ForceDirectories(GameFolder +'\live\Paz\files_to_patch\character\pnm');    memo1.Lines.Add('файлы удалены.');
 ForceDirectories(ExtractFilePath(Application.ExeName) + '\Patch\pac');
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('распаковка модов');
   if CheckBox10.Checked=true then begin
   memo1.Lines.Add('установка текстур Орен');
   memo1.Lines.Add('загрузка текстур. 1\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/pew_00_ub_0034_01_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_01_hair.dds');
   memo1.Lines.Add('загрузка текстур. 2\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/pew_00_ub_0034_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_hair.dds');
   CopyFile('Patch\pew_00_ub_0034_01_hair.dds','Patch\pew_00_ub_0034_01_dm_hair.dds',False);
   CopyFile('Patch\pew_00_ub_0034_hair.dds','Patch\pew_00_ub_0034_dm_hair.dds',False);
  end;
   if CheckBox11.Checked=true then begin
   memo1.Lines.Add('установка текстур Орен');
   memo1.Lines.Add('загрузка текстур. 1\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/More/pew_00_ub_0034_01_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_01_hair.dds');
   memo1.Lines.Add('загрузка текстур. 2\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/More/pew_00_ub_0034_hair.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034_hair.dds');
   CopyFile('Patch\pew_00_ub_0034_01_hair.dds','Patch\pew_00_ub_0034_01_dm_hair.dds',False);
   CopyFile('Patch\pew_00_ub_0034_hair.dds','Patch\pew_00_ub_0034_dm_hair.dds',False);
  end;
   if CheckBox12.Checked=true then begin
   memo1.Lines.Add('установка текстур Орен Крылья');
   memo1.Lines.Add('загрузка текстур. 1\2');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/Kibelius/pew_00_ub_0034.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_00_ub_0034.dds');
   memo1.Lines.Add('загрузка текстур. 2\2');
   ExtractRes('data', 'texture1',ExtractFilePath(Application.ExeName) +  'Patch\pvw_00_cloak_0034_hair.dds');
  end;
   if CheckBox13.Checked=true then begin
   memo1.Lines.Add('установка текстур Орен Крылья');
   memo1.Lines.Add('загрузка текстур. 1\2');
   ExtractRes('data', 'texture1',ExtractFilePath(Application.ExeName) +  'Patch\pew_00_ub_0034.dds');
   memo1.Lines.Add('загрузка текстур. 2\2');
   ExtractRes('data', 'texture1',ExtractFilePath(Application.ExeName) +  'Patch\pew_00_ub_0034_hair.dds');
   ExtractRes('data', 'texture1',ExtractFilePath(Application.ExeName) +  'Patch\pew_00_ub_0034_01_hair.dds');
   CopyFile('Patch\pew_00_ub_0034_01_hair.dds','Patch\pew_00_ub_0034_01_dm_hair.dds',False);
   CopyFile('Patch\pew_00_ub_0034_hair.dds','Patch\pew_00_ub_0034_dm_hair.dds',False);
  end;
  if CheckBox14.Checked=true then begin
   memo1.Lines.Add('установка патч partcutdesc.xml');
   memo1.Lines.Add('загрузка. 1\2');
   ExtractRes('data', 'part',ExtractFilePath(Application.ExeName) +  'Patch\partcutdesc.xml');
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
   if CheckBox27.Checked=true then begin
   memo1.Lines.Add('установка текстур VladaGeims mod 1');
   memo1.Lines.Add('загрузка текстур. 1\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/1/pbw_00_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pbw_00_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 2\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/1/pew_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pew_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 3\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/1/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
   memo1.Lines.Add('загрузка текстур. 4\4');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/1/pww_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\pww_01_nude_0001.dds');
  end;
   if CheckBox28.Checked=true then begin
   memo1.Lines.Add('установка текстур VladaGeims mod 2');
   memo1.Lines.Add('загрузка текстур. 1\1');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/2/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  end;
   if CheckBox29.Checked=true then begin
   memo1.Lines.Add('установка текстур VladaGeims mod 3');
   memo1.Lines.Add('загрузка текстур. 1\1');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/4/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  end;
   if CheckBox30.Checked=true then begin
   memo1.Lines.Add('установка текстур VladaGeims mod 4');
   memo1.Lines.Add('загрузка текстур. 1\1');
   DownloadFile('https://github.com/Socolcol/Splitter/raw/master/texture/VladaGeims/3/phw_01_nude_0001.dds',ExtractFilePath(Application.ExeName) +  '\Patch\phw_01_nude_0001.dds');
  end;

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
   ExtractRes('data', 'texture0',ExtractFilePath(Application.ExeName) +  'Patch\pvw_00_uw_0001_03_dec.dds');
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
   ExtractRes('data', 'texture0',ExtractFilePath(Application.ExeName) +  'Patch\pvw_00_uw_0001_03_dec.dds');
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
 if form4.checkbox31.checked=true then TexturePars(nil);
  memo1.Lines.Add('установка пачта текстур 1');
 if form4.underwear1.checked=true then begin
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
  memo1.SelAttributes.Color:=clgreen;
  memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 end else memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....отменена';

 memo1.Lines.Add('установка пачта текстур 2');
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
  memo1.SelAttributes.Color:=clgreen;
  memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 end else memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '....отменена';

    if form4.checkbox32.checked=true then begin
   memo1.Lines.Add('установка Английского языкового пакета');
   ExtractRes('data', 'Eng1',ExtractFilePath(Application.ExeName) +  'Patch\stringtable_cutscene_ru.xlsm');
   ExtractRes('data', 'Eng2',ExtractFilePath(Application.ExeName) +  'Patch\stringtable_ru.xlsm');
   ExtractRes('data', 'Eng3',ExtractFilePath(Application.ExeName) +  'Patch\symbolnostringtable_ru.xlsm');
    end;


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
    memo1.SelAttributes.Color:=clgreen;
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
    memo1.SelAttributes.Color:=clgreen;
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
    memo1.SelAttributes.Color:=clgreen;
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
    memo1.SelAttributes.Color:=clgreen;
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
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  if form4.checkbox6.checked=true then begin
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
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
   if form4.checkbox6.checked=true then begin
   memo1.Lines.Add('установка мода на грудь маэвы');
   ExtractRes('data', 'breast7',ExtractFilePath(Application.ExeName) +  'Patch\customizationboneparamdesc_blawomen.xml');
    state1:='	<ParamDesc Index="197" Min="0.62 0.62 0.62" Max="';
    state1:=state1+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state1:=state1+'" Default="0.82 0.73 0.73" BoneName="Bip01 L Breast" PartName="base_basebody" Component="S"/>';
    state2:='	<ParamDesc Index="198" Min="0.62 0.62 0.62" Max="';
    state2:=state2+form4.label2.caption+' '+form4.label2.caption+' '+form4.label2.caption;
    state2:=state2+'" Default="0.82 0.73 0.73" BoneName="Bip01 R Breast" PartName="base_basebody" Component="S"/>';
    Memo2.Lines.Clear;
    Memo2.Lines.LoadFromFile('Patch\customizationboneparamdesc_blawomen.xml');
    Memo2.Lines[213]:=state1;
    Memo2.Lines[214]:=state2;
    state1:='	<ParamDesc Index="132" Min="0.90 0.68 0.68" Max="';
    state1:=state1+label6.caption+' '+label6.caption+' '+label6.caption;
    state1:=state1+'" Default="0.97 0.90 0.90" BoneName="Bip01 L Thigh" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    state2:='	<ParamDesc Index="133" Min="0.90 0.68 0.68" Max="';
    state2:=state2+label6.caption+' '+label6.caption+' '+label6.caption;
    state2:=state2+'" Default="0.97 0.90 0.90" BoneName="Bip01 R Thigh" PartName="base_basebody" ';
    state2:=state2+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[148]:=state1;
    Memo2.Lines[149]:=state2;
    state1:='	<ParamDesc Index="137" Min="0.90 0.90 0.85" Max="';
    state1:=state1+label7.caption+' '+label7.caption+' '+label7.caption;
    state1:=state1+'" Default="0.98 0.95 0.90" BoneName="Bip01 Pelvis" PartName="base_basebody" ';
    state1:=state1+'Component="S" HeightAxis="X" WeightAxis01="Y" WeightAxis02="Z"/>';
    Memo2.Lines[153]:=state1;
    state1:='	<ParamDesc Index="141" Min="0.90 0.90 0.90" Max="';
    state1:=state1+label8.caption+' '+label8.caption+' '+label8.caption;
    state1:=state1+'" Default="1.00 1.00 1.00" BoneName="Bip01 L Hip" PartName="base_basebody" ';
    state1:=state1+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    state2:='	<ParamDesc Index="142" Min="0.90 0.90 0.90" Max="';
    state2:=state2+label8.caption+' '+label8.caption+' '+label8.caption;
    state2:=state2+'" Default="1.00 1.00 1.00" BoneName="Bip01 R Hip" PartName="base_basebody" ';
    state2:=state2+'Component="S" WeightAxis01="Y" WeightAxis02="Z" WeightAxis03="X"/>';
    Memo2.Lines[157]:=state1;
    Memo2.Lines[158]:=state2;
    Memo2.Lines.SaveToFile('Patch\customizationboneparamdesc_blawomen.xml');
    ForceDirectories(GameFolder +'\live\gamecommondata\customization\bladewomen');
    Memo2.Lines.SaveToFile(GameFolder +'\live\gamecommondata\customization\bladewomen\customizationboneparamdesc_blawomen.xml');
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
  end;
  memo1.Lines.Add('копирование текстур');
  if FindFirst('Patch\*.dds',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\texture\'+SR.name)),False);
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
   until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование xml файлов');
    if FindFirst('Patch\*.xml',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\'+SR.name)),False);
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование xlsm файлов');
    if FindFirst('Patch\*.xlsm',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\stringtable\ru\'+SR.name)),False);
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование pac файлов');
    if FindFirst('Patch\pac\*.pac',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    if (pos('pbw', SR.Name)<>0) and (Checkbox17.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pbw\'+SR.name)),False)
   else if (pos('phw', SR.Name)<>0) and (Checkbox16.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\phw\'+SR.name)),False)
   else if (pos('pew', SR.Name)<>0) and (Checkbox15.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pew\'+SR.name)),False)
   else if (pos('pww', SR.Name)<>0) and (Checkbox20.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pww\'+SR.name)),False)
   else if (pos('pkww', SR.Name)<>0) and (Checkbox18.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pkww\'+SR.name)),False)
   else if (pos('pvw', SR.Name)<>0) and (Checkbox19.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pvw\'+SR.name)),False)
   else if (pos('pnw', SR.Name)<>0) and (Checkbox21.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pnw\'+SR.name)),False)
   else if (pos('phm', SR.Name)<>0) and (Checkbox22.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\phm\'+SR.name)),False)
   else if (pos('pgm', SR.Name)<>0) and (Checkbox23.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pgm\'+SR.name)),False)
   else if (pos('pkm', SR.Name)<>0) and (Checkbox24.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pkm\'+SR.name)),False)
   else if (pos('pwm', SR.Name)<>0) and (Checkbox25.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pwm\'+SR.name)),False)
   else if (pos('pnm', SR.Name)<>0) and (Checkbox26.Checked = true) then
     CopyFile(PWideChar(WideString('Patch\pac\'+SR.name)),PWideChar(WideString( GameFolder +'\live\Paz\files_to_patch\character\pnm\'+SR.name)),False)
   else memo1.Lines.Add('skip file');
   memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);

 memo1.Lines.Add('копирование мета файла');
 //CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'pad00000.meta',False);
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'files\pad00000.meta.ori',False);
 memo1.SelAttributes.Color:=clgreen;
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('запуск инжектора');
 Sleep(200);
 ShellExecute(Handle, 'open', PWideChar(WideString(GameFolder+ '\live\Paz\injector.exe')), nil, PWideChar(WideString(GameFolder+ '\live\Paz\')), SW_SHOW);
 Sleep(1000);
 while IsRunning('injector.exe') do begin end;
 memo1.SelAttributes.Color:=clgreen;
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
 memo1.Lines.Add('копирование мета файла');
 CopyFile(PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),'files\pad00000.meta.bak',False);
 CopyFile('files\pad00000.meta.ori',PWideChar(WideString(GameFolder+ '\live\Paz\pad00000.meta')),False);
 memo1.SelAttributes.Color:=clgreen;
 memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';

   memo1.Lines.Add('копирование xlsm в папку игры');
    if FindFirst('Patch\*.xlsm',faAnyFile,SR) = 0 then
  repeat
    memo1.Lines.Add(SR.name);
    CopyFile(PWideChar(WideString('Patch\'+SR.name)),PWideChar(WideString(GameFolder + '\live\stringtable\ru\'+SR.name)),False);
    memo1.SelAttributes.Color:=clgreen;
    memo1.lines[memo1.lines.count-1] := memo1.lines[memo1.lines.count-1] + '.........ок';
    Application.ProcessMessages;
  until FindNext(SR) <> 0;
  FindClose(SR);

  memo1.SelAttributes.Color:=clgreen;
 memo1.Lines.Add('патч завершен. перезапустите сплиттер.');
end;

procedure TForm4.TrackBar1Change(Sender: TObject);
var a:real;
begin
a:=trackbar1.Position/100;
label1.Caption:='грудь : '+floattostrF(a,ffFixed,10,2);
label2.Caption:=StringReplace(floattostrF(a,ffFixed,10,2), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar2Change(Sender: TObject);
var a:real;
begin
a:=trackbar2.Position/100;
label3.Caption:='бедра : '+floattostrF(a,ffFixed,10,2);
label6.Caption:=StringReplace(floattostrF(a,ffFixed,10,2), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar3Change(Sender: TObject);
var a:real;
begin
a:=trackbar3.Position/100;
label4.Caption:='таз : '+floattostrF(a,ffFixed,10,2);
label7.Caption:=StringReplace(floattostrF(a,ffFixed,10,2), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.TrackBar4Change(Sender: TObject);
var a:real;
begin
a:=trackbar4.Position/100;
label5.Caption:='попка : '+floattostrF(a,ffFixed,10,2);
label8.Caption:=StringReplace(floattostrF(a,ffFixed,10,2), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm4.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
 WebBrowser1.OleObject.document.body.style.overflowX := 'hidden';
WebBrowser1.OleObject.document.body.style.overflowY := 'hidden';
end;

end.
