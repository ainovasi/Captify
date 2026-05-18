unit uai_split;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Math, DB, dbf, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, RxDBGrid, IdThreadComponent,
  ZConnection, ZDataset;

type

  { TfrmSplitter }

  TfrmSplitter = class(TForm)
    DSBook: TDataSource;
    TrdPrepare: TIdThreadComponent;
    spPaste: TSpeedButton;
    SpeedButton2: TSpeedButton;
    spClear: TSpeedButton;
    MmText: TMemo;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure spClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spPasteClick(Sender: TObject);
    procedure TrdPrepareRun(Sender: TIdThreadComponent);

  private
   procedure spPrepareClick(Sender: TObject);
   procedure prepare;
  public

  end;

var
  frmSplitter: TfrmSplitter;
  JUMLAH_BARIS : integer;
implementation

{$R *.lfm}
uses
  uca_main;

procedure TfrmSplitter.SpeedButton1Click(Sender: TObject);
var
  i,j  : integer;
begin
  if MmText.text = '' then exit;
  MainForm.tbatch.close;
  MainForm.tbatch.open;

  if  MainForm.tbatch.IsEmpty then
     // prepare
      TrdPrepare.Active:=true
  else
  begin
  for i := 1 to MainForm.tbatch.RecordCount do
      begin
        MainForm.tbatch.Delete;
        MainForm.tbatch.next;
      end;
 // prepare;
 TrdPrepare.Active:=True;
  end;
 //prepare;

end;

procedure TfrmSplitter.spPasteClick(Sender: TObject);
begin
  MmText.PasteFromClipboard;
end;

procedure TfrmSplitter.TrdPrepareRun(Sender: TIdThreadComponent);
begin
  prepare
end;



procedure TfrmSplitter.FormShow(Sender: TObject);
begin
   JUMLAH_BARIS := 5;
   MainForm.tbatch.open;
end;

procedure TfrmSplitter.spClearClick(Sender: TObject);
begin
  MmText.Clear;
end;

procedure TfrmSplitter.spPrepareClick(Sender: TObject);
var
  angka1 : integer;
  angka2 : integer;
  hasil  : integer;
  tanya : string;
begin



  Randomize;
  angka1 := RandomRange(1,100);
  angka2 := RandomRange(1,100);

  hasil := angka1 + angka2 ;
  tanya := InputBox('Proteksi',#13 + 'Hitung ' + IntToStr(angka1) + ' + ' +
                   IntToStr( angka2 ) + ' ?' +#13,'');
  if  tanya=IntToStr(hasil) then
  begin


  // pbPrepare.Position:=0;

  end
  else
  ShowMessage('Hitungan Salah');

end;



procedure TfrmSplitter.prepare;
var

  ts : TStringList;
  j,i : integer;
  outputLine : string;
  linecount: Integer =0;
begin



  try
    ts := Tstringlist.Create;
    ts.Text:= MmText.Text;
    j := ts.Count-1;

   // book_id := MainForm.DBP.FieldByName('id').AsString;

  //  MainForm.DBP.First;
    outputLine:='';
    linecount:=0;;
  //  pbPrepare.Min:=0;
  //  pbPrepare.Max:=j;


    for i := 0 to j - 1 do
        begin
          outputLine := outputLine + ts[i] + #13;
        //  ShowMessage(outputLine);
          Inc(linecount);
        //  pbPrepare.Position:=i;
          if linecount = JUMLAH_BARIS then
          begin
            // Masukkan ke tabel
                if  Length(trim(outputline))<>0 then
                   begin
                    MainForm.tbatch.Append;
                    MainForm.tbatch.FieldByName('NOMOR').AsInteger:=i;
                    MainForm.tbatch.FieldByName('PROMPT').AsString:=QuotedStr(Trim(outputline)) ;
                    MainForm.tbatch.Post;

                   end;

            // Reset untuk kelompok berikutnya
            outputLine := '';
            lineCount := 0;
          end;
        end;

        // Masukkan sisa baris jika ada
        if outputLine <> '' then
        begin
          if  Length(trim(outputline))<>0 then
              begin

                    MainForm.tbatch.Append;
                    MainForm.tbatch.FieldByName('NOMOR').AsInteger:=i;
                    MainForm.tbatch.FieldByName('PROMPT').AsString:=QuotedStr(Trim(outputline)) ;
                    MainForm.tbatch.Post;
              end;

        end;



  finally
   ts.Free;
  end;
  ShowMessage('Proses Selesai');
  TrdPrepare.Terminate;
 // TrdTranslateAi.Terminate;
end;

end.

