unit Modemenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, IniFiles, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox1: TGroupBox;
    TamerNudeSkin1: TRadioButton;
    TamerNudeSkin2: TRadioButton;
    TamerNudeSkin3: TRadioButton;
    TamerNudeSkin4: TRadioButton;
    TamerNudeSkin5: TRadioButton;
    TamerNudeSkin6: TRadioButton;
    TamerNudeSkin7: TRadioButton;
    GroupBox2: TGroupBox;
    TamerUnderwear1: TCheckBox;
    TamerUnderwear2: TCheckBox;
    TamerUnderwear3: TCheckBox;
    TamerUnderwear4: TCheckBox;
    TamerUnderwear5: TCheckBox;
    TamerUnderwear6: TCheckBox;
    TamerUnderwear7: TCheckBox;
    TamerUnderwear8: TCheckBox;
    TamerUnderwear9: TCheckBox;
    TamerUnderwear10: TCheckBox;
    TamerUnderwear11: TCheckBox;
    TamerUnderwear12: TCheckBox;
    GroupBox3: TGroupBox;
    TamerCostume17: TCheckBox;
    TamerCostume2: TCheckBox;
    TamerCostume3: TCheckBox;
    TamerCostume4: TCheckBox;
    TamerCostume5: TCheckBox;
    TamerCostume6: TCheckBox;
    TamerCostume7: TCheckBox;
    TamerCostume8: TCheckBox;
    TamerCostume9: TCheckBox;
    TamerCostume10: TCheckBox;
    TamerCostume11: TCheckBox;
    TamerCostume12: TCheckBox;
    TamerCostume13: TCheckBox;
    TamerCostume14: TCheckBox;
    TamerCostume15: TCheckBox;
    TamerCostume16: TCheckBox;
    TamerCostume1: TCheckBox;
    TamerCostume18: TCheckBox;
    TamerCostume19: TCheckBox;
    TamerCostume20: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox35: TCheckBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox5: TGroupBox;
    SorcererNudeSkin1: TRadioButton;
    SorcererNudeSkin2: TRadioButton;
    SorcererNudeSkin3: TRadioButton;
    SorcererNudeSkin4: TRadioButton;
    SorcererNudeSkin5: TRadioButton;
    SorcererNudeSkin6: TRadioButton;
    SorcererNudeSkin7: TRadioButton;
    GroupBox6: TGroupBox;
    SorcererUnderwear1: TCheckBox;
    SorcererUnderwear2: TCheckBox;
    SorcererUnderwear3: TCheckBox;
    SorcererUnderwear4: TCheckBox;
    SorcererUnderwear5: TCheckBox;
    SorcererUnderwear6: TCheckBox;
    SorcererUnderwear7: TCheckBox;
    SorcererUnderwear8: TCheckBox;
    SorcererUnderwear9: TCheckBox;
    SorcererUnderwear10: TCheckBox;
    SorcererUnderwear11: TCheckBox;
    SorcererUnderwear12: TCheckBox;
    GroupBox7: TGroupBox;
    SorcererCostume17: TCheckBox;
    SorcererCostume2: TCheckBox;
    SorcererCostume3: TCheckBox;
    SorcererCostume4: TCheckBox;
    SorcererCostume5: TCheckBox;
    SorcererCostume6: TCheckBox;
    SorcererCostume7: TCheckBox;
    SorcererCostume8: TCheckBox;
    SorcererCostume9: TCheckBox;
    SorcererCostume10: TCheckBox;
    SorcererCostume11: TCheckBox;
    SorcererCostume12: TCheckBox;
    SorcererCostume13: TCheckBox;
    SorcererCostume14: TCheckBox;
    SorcererCostume15: TCheckBox;
    SorcererCostume16: TCheckBox;
    SorcererCostume1: TCheckBox;
    SorcererCostume18: TCheckBox;
    SorcererCostume19: TCheckBox;
    SorcererCostume20: TCheckBox;
    GroupBox8: TGroupBox;
    Label4: TLabel;
    CheckBox36: TCheckBox;
    TrackBar2: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox9: TGroupBox;
    RangerNudeSkin1: TRadioButton;
    RangerNudeSkin2: TRadioButton;
    RangerNudeSkin3: TRadioButton;
    RangerNudeSkin4: TRadioButton;
    RangerNudeSkin5: TRadioButton;
    RangerNudeSkin6: TRadioButton;
    RangerNudeSkin7: TRadioButton;
    GroupBox10: TGroupBox;
    RangerUnderwear1: TCheckBox;
    RangerUnderwear2: TCheckBox;
    RangerUnderwear3: TCheckBox;
    RangerUnderwear4: TCheckBox;
    RangerUnderwear5: TCheckBox;
    RangerUnderwear6: TCheckBox;
    RangerUnderwear7: TCheckBox;
    RangerUnderwear8: TCheckBox;
    RangerUnderwear9: TCheckBox;
    RangerUnderwear10: TCheckBox;
    RangerUnderwear11: TCheckBox;
    RangerUnderwear12: TCheckBox;
    GroupBox11: TGroupBox;
    RangerCostume17: TCheckBox;
    RangerCostume2: TCheckBox;
    RangerCostume3: TCheckBox;
    RangerCostume4: TCheckBox;
    RangerCostume5: TCheckBox;
    RangerCostume6: TCheckBox;
    RangerCostume7: TCheckBox;
    RangerCostume8: TCheckBox;
    RangerCostume9: TCheckBox;
    RangerCostume10: TCheckBox;
    RangerCostume11: TCheckBox;
    RangerCostume12: TCheckBox;
    RangerCostume13: TCheckBox;
    RangerCostume14: TCheckBox;
    RangerCostume15: TCheckBox;
    RangerCostume16: TCheckBox;
    RangerCostume1: TCheckBox;
    RangerCostume18: TCheckBox;
    RangerCostume19: TCheckBox;
    RangerCostume20: TCheckBox;
    GroupBox12: TGroupBox;
    Label7: TLabel;
    CheckBox37: TCheckBox;
    TrackBar3: TTrackBar;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox13: TGroupBox;
    WitchNudeSkin1: TRadioButton;
    WitchNudeSkin2: TRadioButton;
    WitchNudeSkin3: TRadioButton;
    WitchNudeSkin4: TRadioButton;
    WitchNudeSkin5: TRadioButton;
    WitchNudeSkin6: TRadioButton;
    WitchNudeSkin7: TRadioButton;
    GroupBox14: TGroupBox;
    WitchUnderwear1: TCheckBox;
    WitchUnderwear2: TCheckBox;
    WitchUnderwear3: TCheckBox;
    WitchUnderwear4: TCheckBox;
    WitchUnderwear5: TCheckBox;
    WitchUnderwear6: TCheckBox;
    WitchUnderwear7: TCheckBox;
    WitchUnderwear8: TCheckBox;
    WitchUnderwear9: TCheckBox;
    WitchUnderwear10: TCheckBox;
    WitchUnderwear11: TCheckBox;
    WitchUnderwear12: TCheckBox;
    GroupBox15: TGroupBox;
    WitchCostume17: TCheckBox;
    WitchCostume2: TCheckBox;
    WitchCostume3: TCheckBox;
    WitchCostume4: TCheckBox;
    WitchCostume5: TCheckBox;
    WitchCostume6: TCheckBox;
    WitchCostume7: TCheckBox;
    WitchCostume8: TCheckBox;
    WitchCostume9: TCheckBox;
    WitchCostume10: TCheckBox;
    WitchCostume11: TCheckBox;
    WitchCostume12: TCheckBox;
    WitchCostume13: TCheckBox;
    WitchCostume14: TCheckBox;
    WitchCostume15: TCheckBox;
    WitchCostume16: TCheckBox;
    WitchCostume1: TCheckBox;
    WitchCostume18: TCheckBox;
    WitchCostume19: TCheckBox;
    WitchCostume20: TCheckBox;
    GroupBox16: TGroupBox;
    Label10: TLabel;
    CheckBox38: TCheckBox;
    TrackBar4: TTrackBar;
    Label11: TLabel;
    GroupBox17: TGroupBox;
    MaehwaNudeSkin1: TRadioButton;
    MaehwaNudeSkin2: TRadioButton;
    MaehwaNudeSkin3: TRadioButton;
    MaehwaNudeSkin4: TRadioButton;
    MaehwaNudeSkin5: TRadioButton;
    MaehwaNudeSkin6: TRadioButton;
    MaehwaNudeSkin7: TRadioButton;
    GroupBox18: TGroupBox;
    MaehwaUnderwear1: TCheckBox;
    MaehwaUnderwear2: TCheckBox;
    MaehwaUnderwear3: TCheckBox;
    MaehwaUnderwear4: TCheckBox;
    MaehwaUnderwear5: TCheckBox;
    MaehwaUnderwear6: TCheckBox;
    MaehwaUnderwear7: TCheckBox;
    MaehwaUnderwear8: TCheckBox;
    MaehwaUnderwear9: TCheckBox;
    MaehwaUnderwear10: TCheckBox;
    MaehwaUnderwear11: TCheckBox;
    MaehwaUnderwear12: TCheckBox;
    GroupBox19: TGroupBox;
    MaehwaCostume17: TCheckBox;
    MaehwaCostume2: TCheckBox;
    MaehwaCostume3: TCheckBox;
    MaehwaCostume4: TCheckBox;
    MaehwaCostume5: TCheckBox;
    MaehwaCostume6: TCheckBox;
    MaehwaCostume7: TCheckBox;
    MaehwaCostume8: TCheckBox;
    MaehwaCostume9: TCheckBox;
    MaehwaCostume10: TCheckBox;
    MaehwaCostume11: TCheckBox;
    MaehwaCostume12: TCheckBox;
    MaehwaCostume13: TCheckBox;
    MaehwaCostume14: TCheckBox;
    MaehwaCostume15: TCheckBox;
    MaehwaCostume16: TCheckBox;
    MaehwaCostume1: TCheckBox;
    MaehwaCostume18: TCheckBox;
    MaehwaCostume19: TCheckBox;
    MaehwaCostume20: TCheckBox;
    GroupBox20: TGroupBox;
    Label12: TLabel;
    CheckBox39: TCheckBox;
    TrackBar5: TTrackBar;
    Label13: TLabel;
    GroupBox21: TGroupBox;
    ValkyrieNudeSkin1: TRadioButton;
    ValkyrieNudeSkin2: TRadioButton;
    ValkyrieNudeSkin3: TRadioButton;
    ValkyrieNudeSkin4: TRadioButton;
    ValkyrieNudeSkin5: TRadioButton;
    ValkyrieNudeSkin6: TRadioButton;
    ValkyrieNudeSkin7: TRadioButton;
    GroupBox22: TGroupBox;
    ValkyrieUnderwear1: TCheckBox;
    ValkyrieUnderwear2: TCheckBox;
    ValkyrieUnderwear3: TCheckBox;
    ValkyrieUnderwear4: TCheckBox;
    ValkyrieUnderwear5: TCheckBox;
    ValkyrieUnderwear6: TCheckBox;
    ValkyrieUnderwear7: TCheckBox;
    ValkyrieUnderwear8: TCheckBox;
    ValkyrieUnderwear9: TCheckBox;
    ValkyrieUnderwear10: TCheckBox;
    ValkyrieUnderwear11: TCheckBox;
    ValkyrieUnderwear12: TCheckBox;
    GroupBox23: TGroupBox;
    ValkyrieCostume17: TCheckBox;
    ValkyrieCostume2: TCheckBox;
    ValkyrieCostume3: TCheckBox;
    ValkyrieCostume4: TCheckBox;
    ValkyrieCostume5: TCheckBox;
    ValkyrieCostume6: TCheckBox;
    ValkyrieCostume7: TCheckBox;
    ValkyrieCostume8: TCheckBox;
    ValkyrieCostume9: TCheckBox;
    ValkyrieCostume10: TCheckBox;
    ValkyrieCostume11: TCheckBox;
    ValkyrieCostume12: TCheckBox;
    ValkyrieCostume13: TCheckBox;
    ValkyrieCostume14: TCheckBox;
    ValkyrieCostume15: TCheckBox;
    ValkyrieCostume16: TCheckBox;
    ValkyrieCostume1: TCheckBox;
    ValkyrieCostume18: TCheckBox;
    ValkyrieCostume19: TCheckBox;
    ValkyrieCostume20: TCheckBox;
    GroupBox24: TGroupBox;
    Label14: TLabel;
    CheckBox40: TCheckBox;
    TrackBar6: TTrackBar;
    Label15: TLabel;
    GroupBox25: TGroupBox;
    KunoichiNudeSkin1: TRadioButton;
    KunoichiNudeSkin2: TRadioButton;
    KunoichiNudeSkin3: TRadioButton;
    KunoichiNudeSkin4: TRadioButton;
    KunoichiNudeSkin5: TRadioButton;
    KunoichiNudeSkin6: TRadioButton;
    KunoichiNudeSkin7: TRadioButton;
    GroupBox26: TGroupBox;
    KunoichiUnderwear1: TCheckBox;
    KunoichiUnderwear2: TCheckBox;
    KunoichiUnderwear3: TCheckBox;
    KunoichiUnderwear4: TCheckBox;
    KunoichiUnderwear5: TCheckBox;
    KunoichiUnderwear6: TCheckBox;
    KunoichiUnderwear7: TCheckBox;
    KunoichiUnderwear8: TCheckBox;
    KunoichiUnderwear9: TCheckBox;
    KunoichiUnderwear10: TCheckBox;
    KunoichiUnderwear11: TCheckBox;
    KunoichiUnderwear12: TCheckBox;
    GroupBox27: TGroupBox;
    KunoichiCostume17: TCheckBox;
    KunoichiCostume2: TCheckBox;
    KunoichiCostume3: TCheckBox;
    KunoichiCostume4: TCheckBox;
    KunoichiCostume5: TCheckBox;
    KunoichiCostume6: TCheckBox;
    KunoichiCostume7: TCheckBox;
    KunoichiCostume8: TCheckBox;
    KunoichiCostume9: TCheckBox;
    KunoichiCostume10: TCheckBox;
    KunoichiCostume11: TCheckBox;
    KunoichiCostume12: TCheckBox;
    KunoichiCostume13: TCheckBox;
    KunoichiCostume14: TCheckBox;
    KunoichiCostume15: TCheckBox;
    KunoichiCostume16: TCheckBox;
    KunoichiCostume1: TCheckBox;
    KunoichiCostume18: TCheckBox;
    KunoichiCostume19: TCheckBox;
    KunoichiCostume20: TCheckBox;
    GroupBox28: TGroupBox;
    Label16: TLabel;
    CheckBox73: TCheckBox;
    TrackBar7: TTrackBar;
    Label17: TLabel;
    TabSheet9: TTabSheet;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure TrackBar1Change(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  P1,P2,P3,P4,P5,P6,P7 :integer;
implementation

{$R *.dfm}
{$R DataRes.RES}

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

procedure TForm3.Button1Click(Sender: TObject);
var
IniFile : TIniFile;
count1,TexturesCount,count2 :integer;
Rawdata: string;
begin
 IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
 count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('TamerUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('TamerUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('TamerCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('TamerCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('SorcererUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('SorcererUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('SorcererCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('SorcererCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('RangerUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('RangerUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('RangerCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('RangerCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('WitchUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('WitchUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('WitchCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('WitchCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('MaehwaUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('MaehwaUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('MaehwaCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('MaehwaCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('ValkyrieUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('ValkyrieUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('ValkyrieCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('ValkyrieCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
   count1:=1;
 while count1 <= 12 do
  begin
   if TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('KunoichiUnderwear'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('KunoichiUnderwear'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
 count1:=1;
 while count1 <= 20 do
  begin
   if TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Checked = true then
    begin
     memo1.Lines.Add('добавляю: '+ TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Caption);
     TexturesCount:= strtoint(inifile.ReadString('KunoichiCostume'+inttostr(count1),'textures', '0'));
     count2:=1;
     while count2<=TexturesCount do
      begin
       Rawdata:= inifile.ReadString('KunoichiCostume'+inttostr(count1),'texture'+inttostr(count2), '0');
       count2:=count2+1;
       memo1.Lines.Add('текстура: ' +Pars(';',Rawdata,':')+'.dds');
       if Pars(':',Rawdata,':') = '0'
        then
         ExtractRes('data', 'empty',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds')
        else
         ExtractRes('data', 'fill',ExtractFilePath(Application.ExeName)+'\Patch\'+ Pars(';',Rawdata,':')+'.dds');
      end;
    end;
   count1:=count1+1;
  end;
end;

procedure TForm3.TabSheet2Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
if P1 =1  then exit;
 P1:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('TamerUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('TamerUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('TamerUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('TamerCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('TamerCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('TamerCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TabSheet3Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P2 =1  then exit;
 P2:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('SorcererUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('SorcererUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('SorcererUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('SorcererCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('SorcererCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('SorcererCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TabSheet4Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P3 =1  then exit;
 P3:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('RangerUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('RangerUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('RangerUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('RangerCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('RangerCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('RangerCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TabSheet5Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P4 =1  then exit;
 P4:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('WitchUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('WitchUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('WitchUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('WitchCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('WitchCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('WitchCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;


procedure TForm3.TabSheet6Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P5 =1  then exit;
 P5:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('MaehwaUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('MaehwaUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('MaehwaUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('MaehwaCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('MaehwaCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('MaehwaCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TabSheet7Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P6 =1  then exit;
 P6:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('ValkyrieUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('ValkyrieUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('ValkyrieUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('ValkyrieCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('ValkyrieCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('ValkyrieCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TabSheet8Show(Sender: TObject);
var
IniFile : TIniFile;
count1:integer;
NameMod:String;
begin
 if P7 =1  then exit;
 P7:=1;
IniFile := TIniFile.Create(ExtractFileDir(ParamStr(0))+'\files\modlist.ini');
count1:=1;
while count1 <= 12 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('KunoichiUnderwear'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('KunoichiUnderwear' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('KunoichiUnderwear'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
count1:=1;
while count1 <= 20 do
 begin
 NameMod:=Utf8Decode(inifile.ReadString('KunoichiCostume'+inttostr(count1),'name', 'none'));
 if NameMod='none' then
  begin
  TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Enabled:=false;
  TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Caption := 'пока пусто';
  end
  else
 TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Caption := NameMod;
 TCheckbox(FindComponent('KunoichiCostume' + IntToStr(count1))).Checked := StrToBool(inifile.ReadString('KunoichiCostume'+inttostr(count1),'enabled', '0'));
 count1:=count1+1;
 end;
end;

procedure TForm3.TrackBar1Change(Sender: TObject);
var a:real;
begin
a:=trackbar1.Position/100;
label1.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar2Change(Sender: TObject);
var a:real;
begin
a:=trackbar2.Position/100;
label4.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar3Change(Sender: TObject);
var a:real;
begin
a:=trackbar3.Position/100;
label7.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar4Change(Sender: TObject);
var a:real;
begin
a:=trackbar4.Position/100;
label10.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar5Change(Sender: TObject);
var a:real;
begin
a:=trackbar5.Position/100;
label12.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar6Change(Sender: TObject);
var a:real;
begin
a:=trackbar6.Position/100;
label14.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

procedure TForm3.TrackBar7Change(Sender: TObject);
var a:real;
begin
a:=trackbar7.Position/100;
label16.Caption:='рекомендуемый : 5,25 установлен : '+floattostr(a);
end;

end.
