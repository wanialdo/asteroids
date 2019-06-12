unit frmPrincipal;
{Jogo de Naves desenvolvido por Wanialdo Lima e Luciano Sombra
FIC - Faculdade Integrada do Ceará (2002)
Linguagem de Programação I - Prof. Leandro Taddeo

Este jogo não tem objetos criados dinamicamente, mas sim
objetos distribuídos de forma randômica utilizando timers.}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Gauges, MPlayer, MMSystem,
  frmSobre;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Game1: TMenuItem;
    NovoJogo1: TMenuItem;
    Sair1: TMenuItem;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Timer2: TTimer;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Gauge1: TGauge;
    MediaPlayer1: TMediaPlayer;
    Ajuda1: TMenuItem;
    SobreoJogo1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure NovoJogo1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Movimentacao(Objeto : TImage);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SobreoJogo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pontovida : integer; //Pontuação por permanecer vivo durante o jogo!!!

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
//Verificação das posições dos objetos
var
   i : integer;
begin
//Incrementar a pontuação de 10 de acordo com a permanência no jogo.
If pontovida < 100 then
   pontovida := pontovida + 10
Else
   begin
   pontovida := 0;
   label2.caption := inttostr(strtoint(label2.caption) + 10);
   end;
//Verificar  a posição dos objetos e redistribui-los
   movimentacao(image2);
   movimentacao(image3);
   movimentacao(image4);
   movimentacao(image5);
   movimentacao(image6);
   movimentacao(image7);
   movimentacao(image8);
   movimentacao(image9);
   movimentacao(image10);
   movimentacao(image11);
//Verificar se foi dado um tiro e se este acertou um alvo
   If Shape1.Visible = True Then
   If Shape1.Top < -50 Then
      Shape1.Visible := False
   Else
   Begin
      //Movimentar o tiro
      Shape1.Top := Shape1.Top - 10;
      //Verificar se o objeto foi acertado e se é um meteoro
      for i := 0 to ComponentCount -1 do
         if (Components[i] is TImage) AND
            ((TImage(Components[i]).Top + TImage(Components[i]).Height) >= Shape1.Top) AND
            (TImage(Components[i]).Top < Shape1.Top) AND (TImage(Components[i]).Left < Shape1.Left) AND
            ((TImage(Components[i]).Left + TImage(Components[i]).Width) >= Shape1.Left) Then
            Begin
            //Reposicionar o meteoro e apagar o tiro
            SndPlaySound('Bang.wav',SND_ASYNC);
            TImage(Components[i]).Top := Form1.Height + 10;
            Shape1.Visible := False;
            Label2.Caption := InttoStr(StrtoInt(Label2.Caption) + 100);
            end;
   End;
   If Shape2.Visible = True Then
   If Shape2.Top < -50 Then
      Shape2.Visible := False
   Else
   Begin
      //Movimentar o tiro
      Shape2.Top := Shape2.Top - 10;
      //Verificar se o objeto foi acertado e se é um meteoro
      for i := 0 to ComponentCount -1 do
         if (Components[i] is TImage) AND
            ((TImage(Components[i]).Top + TImage(Components[i]).Height) >= Shape2.Top) AND
            (TImage(Components[i]).Top < Shape2.Top) AND (TImage(Components[i]).Left < Shape2.Left) AND
            ((TImage(Components[i]).Left + TImage(Components[i]).Width) >= Shape2.Left) Then
            Begin
            //Reposicionar o meteoro e apagar o tiro
            SndPlaySound('Bang.wav',SND_ASYNC);
            TImage(Components[i]).Top := Form1.Height + 10;
            Shape2.Visible := False;
            Label2.Caption := InttoStr(StrtoInt(Label2.Caption) + 100);
            end;
   End;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//Verificar se o jogador está em jogo
If Image1.Enabled = True Then
   Begin
   Case Key of
//verificar se foi dado um tiro (espaço)
   32: Begin
       //Verificar se há força (power) para atirar
       If Gauge1.Progress = 10 Then
       Begin
          SndPlaySound('new.wav',SND_ASYNC);
          Gauge1.Progress := 0;
          Shape1.Visible:= true;
          Shape1.Top := Image1.Top -5;
          Shape1.Left := Image1.Left;
          Shape2.Visible:= true;
          Shape2.Top := Image1.Top -5;
          Shape2.Left := Image1.Left + Image1.Width - 9;
       End;
       End;
//Verificar a movimentação para a esquerda
   37: Begin
       If Image1.Left > 10 then
          Image1.Left := Image1.Left - 10
       Else
          Image1.left := 0;
       End;
//Verificar a movimentação para a frente
   38: Begin
       If Image1.Top > 10 then
          Image1.Top := Image1.Top - 10
       Else
          Image1.Top := 0;
       End;
//Verificar a movimentação para a direita
   39: Begin
       If Image1.Left < form1.width-Image1.width then
          Image1.Left := Image1.Left + 10
       Else
          Image1.left := form1.width-Image1.width;
       End;
//Verificar a movimentação para trás
   40: Begin
       If Image1.Top < form1.height-Image1.height then
          Image1.Top := Image1.Top + 10
       Else
          Image1.Top := form1.height-Image1.Height;
       End;
   End;
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
//posicionar os objetos e desabilitar o timer para iniciar o
//programa com o jogo parado.
 Form1.SetFocus;
 Timer1.Enabled := False;
 Image11.Top := form1.Height + 10;
 Image2.Top := form1.Height + 10;
 Image3.Top := form1.Height + 10;
 Image4.Top := form1.Height + 10;
 Image5.Top := form1.Height + 10;
 Image6.Top := form1.Height + 10;
 Image7.Top := form1.Height + 10;
 Image8.Top := form1.Height + 10;
 Image9.Top := form1.Height + 10;
 Image10.Top := form1.Height + 10;
 Image1.enabled := false;
end;

procedure TForm1.NovoJogo1Click(Sender: TObject);
begin
//posicionar os objetos e ativar os timers para iniciar um
//novo jogo, zerar o escore (label2 e pontovida) e a força (power - Gauge)
MediaPlayer1.Stop;
MediaPlayer1.Close;
MediaPlayer1.FileName := 'MKTheme.mid';
MediaPlayer1.Open;
MediaPlayer1.Play;

Timer2.Enabled := True;
Image11.Top := form1.Height + 10;
Image2.Top := form1.Height + 10;
Image3.Top := form1.Height + 10;
Image4.Top := form1.Height + 10;
Image5.Top := form1.Height + 10;
Image6.Top := form1.Height + 10;
Image7.Top := form1.Height + 10;
Image8.Top := form1.Height + 10;
Image9.Top := form1.Height + 10;
Image10.Top := form1.Height + 10;
timer1.enabled := true;
Image1.enabled := true;
Image1.Visible := true;
Image12.Visible := False;
Label1.Visible := False;
Shape1.Visible := False;
Shape2.Visible := False;
Gauge1.Progress:= 0;
Label2.Caption:= '000';
pontovida := 0;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
//terminar o programa
   Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
//carregar os escores e pintar o fundo do form de preto
var
   Arq: TextFile;
   BestRecord : String;
begin
MediaPlayer1.FileName := 'Axelf_5.mid';
MediaPlayer1.Open;
MediaPlayer1.Play;

   AssignFile(Arq, 'record.dat');
   Reset(Arq);
   Readln(Arq, BestRecord);
   Label3.Caption := BestRecord;
   Readln(Arq, BestRecord);
   Label4.Caption := BestRecord;
   CloseFile(Arq);
   Form1.Color := clblack;
end;

Procedure TForm1.Movimentacao(Objeto : TImage);
//verificar o posiconamento dos meteoros
Begin
//verificar se o meteoro atingiu o final do formulário e reposiciona-lo
if Objeto.Top > form1.Height then
begin
   Objeto.left := random(form1.width);
   Objeto.top := random(form1.height) * (-1);
end
Else
//movimentar os meteoros para baixo
   Objeto.Top := Objeto.top + 10;
//se um meteoro atingir a área de posicionamento da nave o jogo
//é terminado e os escores são verificados. Os objetos são desligados
If (Objeto.Top+Objeto.Height >= Image1.Top+5) AND
   (Objeto.Top <= Image1.Top+Image1.Height) AND
   (Objeto.Left+Objeto.Width >= Image1.Left) AND
   (Objeto.Left <= Image1.Left+Image1.Width) THEN
   Begin
      SndPlaySound('Explosn.wav',SND_ASYNC);
      Timer1.Enabled := False;
      Image12.top := Image1.Top;
      Image12.left := Image1.left;
      Image12.Visible:=true;
      Image1.Enabled := False;
      Image1.Visible := False;
      Label1.Visible := True;
      //Verifica se há um novo recorde
      If StrToInt(Label2.Caption) > StrToInt(Label4.Caption) Then
      Begin
         Label3.Caption := 'Recorde: ' +
            InputBox('Novo recorde, digite seu nome:', 'RECORDE', '');
         Label4.Caption := Label2.Caption;
      End;
      MediaPlayer1.Stop;
      MediaPlayer1.Close;
      MediaPlayer1.FileName := 'Axelf_5.mid';
      MediaPlayer1.Open;
      MediaPlayer1.Play;
   End;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
//preenche a força da nave
If Gauge1.Progress < 10 Then
   Gauge1.Progress := Gauge1.Progress+1;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
//salva os recordes ao fechar o programa
var
   Arq : TextFile;
   BestRecord : String;
begin
   AssignFile(Arq, 'record.dat');
   Rewrite(Arq);
   BestRecord := Label3.Caption;
   Writeln(Arq, BestRecord);
   BestRecord := Label4.Caption;
   Writeln(Arq, BestRecord);
   CloseFile(Arq);
end;

procedure TForm1.SobreoJogo1Click(Sender: TObject);
begin
MediaPlayer1.Stop;
MediaPlayer1.Close;
form2.ShowModal;
end;

end.
