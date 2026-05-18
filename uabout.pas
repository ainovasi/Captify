unit uabout;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
       klabels, atshapeline,
  LCLIntf, Buttons, ATShapeLineBGRA;

type

  { TfrmTentang }

  TfrmTentang = class(TForm)
    btclose: TButton;
    goFPC: TSpeedButton;
    goChrome: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    KLinkLabel1: TKLinkLabel;
    KLinkLabel2: TKLinkLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ShapeLineBGRA1: TShapeLineBGRA;
    goLazarus: TSpeedButton;
    procedure btcloseClick(Sender: TObject);
    procedure goChromiumClick(Sender: TObject);
    procedure goCTClick(Sender: TObject);
    procedure goFPCClick(Sender: TObject);
    procedure goLazarusClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private

  public

  end;

var
  frmTentang: TfrmTentang;

implementation

{$R *.lfm}

{ TfrmTentang }

procedure TfrmTentang.btcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTentang.goChromiumClick(Sender: TObject);
begin
  OpenURL('https://cef-builds.spotifycdn.com/index.html');
end;

procedure TfrmTentang.goCTClick(Sender: TObject);
begin
  OpenURL('https://www.pilotlogic.com/sitejoom/');
end;

procedure TfrmTentang.goFPCClick(Sender: TObject);
begin
  OpenURL('https://www.freepascal.org');
end;

procedure TfrmTentang.goLazarusClick(Sender: TObject);
begin
   OpenURL('https://www.lazarus-ide.org');
end;

procedure TfrmTentang.Label4Click(Sender: TObject);
begin

end;

end.

