unit uca_note;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  SynEdit, RichMemo;

type

  { TFormNote }

  TFormNote = class(TForm)
    RichMemo1: TSynEdit;
    procedure btNoteCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlHeaderMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pnlHeaderMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RichMemo1Click(Sender: TObject);
    procedure RichMemo1DblClick(Sender: TObject);
  private
    fDraging : Boolean;
    fLastPos : TPoint;
  public

  end;

var
  FormNote: TFormNote;

implementation

{$R *.lfm}

{ TFormNote }
uses uca_main;

procedure TFormNote.btNoteCloseClick(Sender: TObject);
begin
  self.close;
end;

procedure TFormNote.FormShow(Sender: TObject);
var
  note : string;
begin

  note := MainForm.tbuku.FieldByName('NOTE').AsString;
  RichMemo1.Lines.text := note
end;

procedure TFormNote.pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
   begin
     fDraging:= true;
     fLastPos := Point(X,Y);
   end;

end;

procedure TFormNote.pnlHeaderMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if fDraging then
   begin
     self.Left:= Self.Left + ( X - fLastPos.X) ;
     self.top := Self.top + ( Y - fLastPos.Y) ;
   end;
end;

procedure TFormNote.pnlHeaderMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fDraging:=false;
end;

procedure TFormNote.RichMemo1Click(Sender: TObject);
begin

end;

procedure TFormNote.RichMemo1DblClick(Sender: TObject);
begin
  MainForm.tbuku.Edit;
  MainForm.tbuku.FieldByName('NOTE').AsString:= RichMemo1.Lines.text;
  MainForm.tbuku.post;
end;

end.

