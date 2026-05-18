unit u_zsplash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TFZSplash }

  TFZSplash = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbTerminate: TLabel;
    Panel1: TPanel;
    tmSplash: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure lbTerminateClick(Sender: TObject);
    procedure tmSplashTimer(Sender: TObject);
  private

  public

  end;

var
  FZSplash: TFZSplash;
  i: integer;

implementation


{$R *.lfm}

{ TFZSplash }

procedure TFZSplash.tmSplashTimer(Sender: TObject);
begin
  inc(i);
  if i>3 then
      begin
        tmSplash.Enabled:=false;
        close;
      end;
end;

procedure TFZSplash.FormShow(Sender: TObject);
begin
  i := 0 ;
  tmSplash.Enabled:=true;
end;

procedure TFZSplash.Label5Click(Sender: TObject);
begin

end;

procedure TFZSplash.lbTerminateClick(Sender: TObject);
begin
  FreeOnRelease;
  Application.Terminate;
end;

end.

