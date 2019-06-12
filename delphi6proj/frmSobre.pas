unit frmSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, StdCtrls, Buttons, ExtCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses frmPrincipal;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MediaPlayer1.Stop;
MediaPlayer1.Close;
Form1.MediaPlayer1.FileName := 'Axelf_5.mid';
Form1.MediaPlayer1.Open;
Form1.MediaPlayer1.Play;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
MediaPlayer1.FileName := 'Entertnr.mid';
MediaPlayer1.Open;
MediaPlayer1.Play;
end;

end.
