unit uca_prompt;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Buttons, ExtCtrls, RichMemo, SynEdit, SynHighlighterSQL,StrUtils;

type

  { TPromptForm }

  TPromptForm = class(TForm)
    cbOutlineBab: TComboBox;
    cbSQLBab: TComboBox;
    cbPromptBab: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pgMain: TPageControl;
    SynExecSQL: TSynEdit;
    SynOutline: TSynEdit;
    spBuatSQL: TSpeedButton;
    spBuatOutline: TSpeedButton;
    spExecSQL: TSpeedButton;
    SynCreateSQL: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    tabOutline: TTabSheet;
    tabPrompt: TTabSheet;
    tabExecSQL: TTabSheet;
    procedure cbOutlineBabChange(Sender: TObject);
    procedure cbPromptBabChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spBuatOutlineClick(Sender: TObject);
    procedure spBuatSQLClick(Sender: TObject);
    procedure spExecSQLClick(Sender: TObject);
  private

  public

  end;

var
  PromptForm: TPromptForm;

implementation

{$R *.lfm}

{ TPromptForm }
uses
  uca_main;

procedure TPromptForm.FormShow(Sender: TObject);
begin
  pgMain.ShowTabs:=false;
end;

procedure TPromptForm.cbOutlineBabChange(Sender: TObject);
begin
  cbSQLBab.Text:=cbOutlineBab.text;
  cbPromptBab.text := cbOutlineBab.text;
end;

procedure TPromptForm.cbPromptBabChange(Sender: TObject);
begin
  cbSQLBab.text := cbPromptBab.text;
end;

procedure TPromptForm.spBuatOutlineClick(Sender: TObject);
var
  bab : string;
begin


  bab  := cbOutlineBab.text;
  if synOutline.text = '' then
  begin
    exit;

  end;

    if Dialogs.MessageDlg('Create an outline in a sub-subchapter format?',
        mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
        MainForm.TulisPrompt('This is the outline of the Chapter "' + cbOutlineBab.text + '" ' + #13#10 +
       '"' + synOutline.text + '"' + #13#10 +
       'Task : '+ #13#10 +
       'For Chapter "'+ cbOutlineBab.text + '" I want you to create chapters, subchapters, and sub-subchapters"'+
       '(Optional) from the outline you created. Use sub x.x numbering).'+#13#10+
       'Note: No explanation' +
       'Your Respon in [' + MainForm.cbLanguageAsk.text + ']');
        end;

    self.close;

end;

procedure TPromptForm.spBuatSQLClick(Sender: TObject);
var
  bab : string;
  gaya : string;
  id   : string;
  persona : string;
  target : string;
begin

  bab    := cbPromptBab.text ;
  gaya   := MainForm.tbuku.FieldByName('GAYA_BAHASA').AsString;
  id     := MainForm.tbuku.FieldByName('ID').AsString;
  target := MainForm.tbuku.FieldByName('TARGET_PEMBACA').AsString;
  persona := MainForm.tbuku.FieldByName('ROLE_PENULIS').AsString;

  if gaya = '' then exit ;
  if target = '' then exit;


  if SynCreateSQL.text  = '' then
  begin
    exit;

  end;

  if Dialogs.MessageDlg('Mengubah Outline dan Prompt menjadi Script SQL ?',
                mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
                begin

              MainForm.TulisPrompt('#role : prompt enginer  '  + sLineBreak  +
                                  '#Note ' + sLineBreak +
                                  'In accordance with the previous provisions, we will use writing style [' + gaya + ']' +  sLineBreak +
                                  ', author persona ['+ persona +'], and target audience [' + target + '].' + sLineBreak  +
                                  'This is the chapter outline for Chapter ' + bab+  sLineBreak +  ':' +

                                  SynCreateSQL.text + '.' +  sLineBreak  +
                                  'Add Introduction Chapter before SubChapter.'+ sLineBreak +
                                  '#Task :' + sLineBreak +
                                  'Create a prompt to get the content of Chapter ' + bab + 'for Introduction and for each subchapter. Use the writing style '', '  + sLineBreak  +
                                  'Author persona and target audience that you determined previously' + sLineBreak  +
                                  '#Output :  ' + sLineBreak + ' Insert Script to the ''prompts'' table with columns ' + sLineBreak  +

                                  '1. id_buku bertipe integer '  + sLineBreak  +
                                  '2. nomor_bab bertipe varchar(12)  '  + sLineBreak  +
                                  '3. tanya  bertipe Text  '  + sLineBreak  + sLineBreak +

                                  'Field "id buku" value ,' + id +    sLineBreak  +
                                  'Field "nomor_bab" value ,' + bab + '.x  '  + sLineBreak  +
                                  'Field "tanya" value prompt,  '  + sLineBreak  +  sLineBreak +

                                  'Note : One Row for One SQL Insert Script, '+ sLineBreak +
                                  'Your Respon in [' + MainForm.cbLanguageAsk.text + ']');


    end;
   self.close;
end;

procedure TPromptForm.spExecSQLClick(Sender: TObject);
var
  j : integer;
  i : integer;
  s : string;
  role,bab,id : string;
begin

 if Dialogs.MessageDlg('Executing Prompt Data Insertion on the Outline?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
      s := AnsiReplaceStr(synExecSQL.Text,#13#10,'');
      s := AnsiReplaceStr(s,');',');'+#13#10);
      s :=  AnsiReplaceStr(s,'\''','"') ;
      synExecSQL.Text := s ;

      if synExecSQL.Text='' then
      begin
        exit;

      end;

      j :=synExecSQL.Lines.Count;

      // sisipkan role penulis
      role := MainForm.tbuku.FieldByName('ROLE_PENULIS').AsString;
      if role<>'' then
      begin
        bab := cbSQLBab.text;
        id := MainForm.tbuku.FieldByName('ID').AsString;

        MainForm.koneksi.ExecuteDirect('INSERT INTO PROMPTS(ID_BUKU,NOMOR_BAB,TANYA) ' +
                  'VALUES( ' + id + ',' + QuotedStr('::Bab' + bab + '::') + ' ,' +
                  QuotedStr('Act as an Author who "' + role + '" , Answer the question I will ask next '+
                  'in Language [' + MainForm.cbLanguageAsk.text + '], wait for my question ') +')');

      end;


      for i := 0 to  j-1 do
      begin
          MainForm.koneksi.ExecuteDirect(synExecSQL.Lines.Strings[i]);
      end;
      ShowMessage('Prompt Sukses masuk ke Database');
  end;

    self.close;


end;

end.

