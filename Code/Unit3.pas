unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CheckLst;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;
{$R *.dfm}

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

procedure TForm3.Button2Click(Sender: TObject);
var
line1, box,posx :integer;
begin
memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\CustomFX.cfg');
line1:=492;
box:=17;
posx:=0;
while posx<30 do  begin
 if checklistbox1.Checked[box]=true then
 memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '0', '1', [rfReplaceAll, rfIgnoreCase])
 else memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '1', '0', [rfReplaceAll, rfIgnoreCase]);
 line1:=line1+1;
 box:=box+1;
 posx:=posx+1;
end;
Memo2.Lines.SaveToFile(GameFolder +'\live\bin64\ReShade\CustomFX.cfg');
 sleep(2000);
memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\SweetFX.cfg');
line1:=458;
box:=52;
posx:=0;
while posx<32 do  begin
 if (FindComponent('Checkbox'+IntToStr(box)) as TCheckBox).Checked = true then
 memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '0', '1', [rfReplaceAll, rfIgnoreCase])
 else memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '1', '0', [rfReplaceAll, rfIgnoreCase]);
 line1:=line1+1;
 box:=box+1;
 posx:=posx+1;
end;
Memo2.Lines.SaveToFile(GameFolder +'\live\bin64\ReShade\SweetFX.cfg');
sleep(2000);
memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\BasicFX.cfg');
line1:=60;
box:=47;
posx:=0;
while posx<5 do  begin
 if (FindComponent('Checkbox'+IntToStr(box)) as TCheckBox).Checked = true then
 memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '0', '1', [rfReplaceAll, rfIgnoreCase])
 else memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '1', '0', [rfReplaceAll, rfIgnoreCase]);
 line1:=line1+1;
 box:=box+1;
 posx:=posx+1;
end;
Memo2.Lines.SaveToFile(GameFolder +'\live\bin64\ReShade\BasicFX.cfg');
sleep(2000);
memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\GemFX.cfg');
line1:=186;
box:=6;
posx:=0;
while posx<11 do  begin
 if (FindComponent('Checkbox'+IntToStr(box)) as TCheckBox).Checked = true then
 memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '0', '1', [rfReplaceAll, rfIgnoreCase])
 else memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '1', '0', [rfReplaceAll, rfIgnoreCase]);
 line1:=line1+1;
 box:=box+1;
 posx:=posx+1;
end;
Memo2.Lines.SaveToFile(GameFolder +'\live\bin64\ReShade\GemFX.cfg');
sleep(2000);
memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\McFX.cfg');
line1:=213;
box:=1;
posx:=0;
while posx<5 do  begin
 if (FindComponent('Checkbox'+IntToStr(box)) as TCheckBox).Checked = true then
 memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '0', '1', [rfReplaceAll, rfIgnoreCase])
 else memo2.Lines[line1]:=StringReplace(memo2.Lines[line1], '1', '0', [rfReplaceAll, rfIgnoreCase]);
 line1:=line1+1;
 box:=box+1;
 posx:=posx+1;
end;
Memo2.Lines.SaveToFile(GameFolder +'\live\bin64\ReShade\McFX.cfg');
end;

procedure TForm3.FormShow(Sender: TObject);
var
pos1 :integer;
begin
 memo1.Lines.Add('проверка состояния мода');
   if FileExists(GameFolder+ '\live\bin64\ReShade64.dll') then
 memo1.Lines.Add('ReShade64.dll найден') else begin
 memo1.Lines.Add('ReShade не найден');
 Sleep(100);
 panel1.Visible:=true;
 end;

  if FileExists(GameFolder+ '\live\bin64\ReShade\CustomFX.cfg') then
 memo1.Lines.Add('CustomFX.cfg найден') else
 memo1.Lines.Add('CustomFX.cfg НЕ! найден');
  if FileExists(GameFolder+ '\live\bin64\ReShade\GemFX.cfg') then
 memo1.Lines.Add('GemFX.cfg найден') else
 memo1.Lines.Add('GemFX.cfg НЕ! найден');
  if FileExists(GameFolder+ '\live\bin64\ReShade\SweetFX.cfg') then
 memo1.Lines.Add('SweetFX.cfg найден') else
 memo1.Lines.Add('SweetFX.cfg НЕ! найден');
  if FileExists(GameFolder+ '\live\bin64\ReShade\BasicFX.cfg') then
 memo1.Lines.Add('BasicFX.cfg найден') else
 memo1.Lines.Add('BasicFX.cfg НЕ! найден');
  if FileExists(GameFolder+ '\live\bin64\ReShade\McFX.cfg') then
 memo1.Lines.Add('McFX.cfg найден') else
 memo1.Lines.Add('McFX.cfg НЕ! найден');
  if FileExists(GameFolder+ '\live\bin64\ReShade\Common.cfg') then
 memo1.Lines.Add('Common.cfg найден') else
 memo1.Lines.Add('Common.cfg НЕ! найден');

memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\CustomFX.cfg');
pos1:=0;
 while pos1<=memo2.Lines.Count do begin
  if Pos('define USE_', Memo2.Lines[pos1]) <> 0 then begin
   checklistbox1.AddItem(pars('/**',Memo2.Lines[pos1-2],'**/'),nil);
   if Pos('1',pars('define',Memo2.Lines[pos1],' //'))<>0 then
    checklistbox1.Checked[checklistbox1.Items.Count-1]:=true;
   pos1:=pos1+1;
  end;
  pos1:=pos1+1;
 end;

memo2.Lines.Clear;
memo2.Lines.LoadFromFile(GameFolder+ '\live\bin64\ReShade\GemFX.cfg');
pos1:=0;
 while pos1<=memo2.Lines.Count do begin
  if Pos('define USE_', Memo2.Lines[pos1]) <> 0 then begin
   checklistbox2.AddItem(pars('/**',Memo2.Lines[pos1-2],'**/'),nil);
   if Pos('1',pars('define',Memo2.Lines[pos1],' //'))<>0 then
    checklistbox2.Checked[checklistbox2.Items.Count-1]:=true;
   pos1:=pos1+1;
  end;
  pos1:=pos1+1;
 end;
end;

end.
