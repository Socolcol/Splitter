unit Path;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    armor1: TRadioButton;
    armor2: TRadioButton;
    RadioButton3: TRadioButton;
    GroupBox2: TGroupBox;
    underwear1: TRadioButton;
    underwear2: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox3: TGroupBox;
    glowers1: TRadioButton;
    glowers2: TRadioButton;
    RadioButton9: TRadioButton;
    GroupBox4: TGroupBox;
    boots1: TRadioButton;
    boots2: TRadioButton;
    RadioButton12: TRadioButton;
    GroupBox5: TGroupBox;
    lifeskill1: TRadioButton;
    RadioButton15: TRadioButton;
    GroupBox6: TGroupBox;
    sorkweap1: TRadioButton;
    sorkweap2: TRadioButton;
    RadioButton17: TRadioButton;
    GroupBox7: TGroupBox;
    nude1: TRadioButton;
    nude2: TRadioButton;
    nude6: TRadioButton;
    nude3: TRadioButton;
    nude4: TRadioButton;
    nudetamer: TCheckBox;
    Button1: TButton;
    nude5: TRadioButton;
    nude7: TRadioButton;
    nude8: TRadioButton;
    armor3: TRadioButton;
    GroupBox8: TGroupBox;
    lowerbody1: TRadioButton;
    lowerbody2: TRadioButton;
    RadioButton5: TRadioButton;
    GroupBox9: TGroupBox;
    hats1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox10: TGroupBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    GroupBox11: TGroupBox;
    CheckBox9: TCheckBox;
    Label2: TLabel;
    nude9: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm4.Button1Click(Sender: TObject);
begin
patch1:=1;
form4.Close;
form1.Button2Click(nil);
end;

procedure TForm4.TrackBar1Change(Sender: TObject);
var a:real;
begin
a:=trackbar1.Position/100;
label1.Caption:='установлен : '+floattostr(a);
label2.Caption:=StringReplace(floattostr(a), ',', '.',[rfReplaceAll,rfIgnoreCase]);
end;

end.
