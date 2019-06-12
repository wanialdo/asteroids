program Naves;

uses
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {Form1},
  frmSobre in 'frmSobre.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Asteróides';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
