unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShellApi, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Label1Click(Sender: TObject);
begin
ShellExecute(application.Handle,'Open','http://adultmodslocalized.ru/user/74637-taira-miss/',Nil,Nil,SW_SHOWDEFAULT);
end;

procedure TForm2.Label1MouseLeave(Sender: TObject);
begin
Label1.Font.Style:=Label1.Font.Style-[fsUnderLine];
end;

procedure TForm2.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Label1.Font.Style:=Label1.Font.Style+[fsUnderline];
end;

procedure TForm2.Label2Click(Sender: TObject);
begin
ShellExecute(application.Handle,'Open','https://www.undertow.club/members/blackfirebr.2727/',Nil,Nil,SW_SHOWDEFAULT);
end;

procedure TForm2.Label2MouseLeave(Sender: TObject);
begin
Label2.Font.Style:=Label2.Font.Style-[fsUnderLine];
end;

procedure TForm2.Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Label2.Font.Style:=Label2.Font.Style+[fsUnderline];
end;

end.
