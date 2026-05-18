program captify;

{$MODE Delphi}

uses
  Forms, Interfaces,
  uca_main {MainForm};

{.$R *.res}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
