unit uca_data;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, Buttons;

type

  { TFormDB }

  TFormDB = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    spSimpan: TSpeedButton;
    procedure spSimpanClick(Sender: TObject);
  private

  public

  end;

var
  FormDB: TFormDB;

implementation

{$R *.lfm}

{ TFormDB }
uses uca_main;

procedure TFormDB.spSimpanClick(Sender: TObject);
begin
    MainForm.tbuku.post;
    self.close;
    MainForm.tkategori.Refresh;
end;

end.

