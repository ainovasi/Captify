unit uca_main;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Buttons, Menus,
  ZDataset, ZConnection, RxDBGrid, cyPageControl, uWVBrowser, uWVWindowParent,
  uWVLoader, uWVBrowserBase, uWVTypes, uWVEvents, StrUtils, DB, uca_prompt,
  DBGrids, atshapeline, SynEdit, PasLibVlcPlayerUnit, uai_split, uca_note,
  uca_data, uWVTypeLibrary,uabout,u_zsplash, Grids,Clipbrd;

type

  { TMainForm }

  TMainForm = class(TForm)
    cbDetik: TComboBox;
    cbDetik2: TComboBox;
    cbLanguageAsk: TDBComboBox;
    cbLanguageTranslate: TComboBox;
    ckAutoCop: TCheckBox;
    ComboBox1: TComboBox;
    dscode: TDataSource;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    koneksidbgambar: TZConnection;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lvStepPrepared: TListView;
    Macro1: TGroupBox;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    mnMeta: TMenuItem;
    mnMistral: TMenuItem;
    mnHelp: TMenuItem;
    mnHapusAll: TMenuItem;
    mnHapusCurrent: TMenuItem;
    mnTestEngine: TMenuItem;
    mnQwen: TMenuItem;
    Panel3: TPanel;
    pgMain: TcyPageControl;
    dsbatch: TDataSource;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBText3: TDBText;
    DBText4: TDBText;
    edtBabPrompt: TDBMemo;
    dsgambar: TDataSource;
    dskategorigambar: TDataSource;
    dsprompt: TDataSource;
    edURL: TDBEdit;
    DBEdit4: TDBEdit;
    edtGambar: TDBMemo;
    DBMemo3: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    dsbuku: TDataSource;
    dskategori: TDataSource;
    dstask: TDataSource;
    eCariGambar: TEdit;
    grdBook: TRxDBGrid;
    grdKategori: TRxDBGrid;
    grdkategorigambar: TRxDBGrid;
    grdtemplategambar: TRxDBGrid;
    GroupBox2: TGroupBox;
    koneksi: TZConnection;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Macro: TGroupBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnHapusPrompt: TMenuItem;
    mnReload: TMenuItem;
    mnGoGPT: TMenuItem;
    mnGoDeepSeek: TMenuItem;
    mnGoGrok: TMenuItem;
    mnTentang: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    mnNote: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    mnGoGemini: TMenuItem;
    mnGoClaude: TMenuItem;
    mnGoCopilot: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    pnFormSplit: TPanel;
    pmHapusPrompt: TPopupMenu;
    pnPromptBookMenu1: TPanel;
    pmDeleteTerjemah: TPopupMenu;
    progressAuto2: TProgressBar;
    Separator1: TMenuItem;
    Separator3: TMenuItem;
    spBackPrompt: TSpeedButton;
    spBackToPrompt: TSpeedButton;
    spGoPrompting: TSpeedButton;
    spGoProyek1: TSpeedButton;
    spSaveBook: TSpeedButton;
    spStart2: TSpeedButton;
    tabOther: TTabSheet;
    tabChat: TTabSheet;
    tabSplit: TTabSheet;
    tabPlay: TTabSheet;
    tcode: TZTable;
    tmSend_Mass2: TTimer;
    trOther: TTreeView;
    pgFitur: TPageControl;
    pgBook: TPageControl;
    pnPromptBookMenu: TPanel;
    Panel5: TPanel;
    progressAuto: TProgressBar;
    grdBatch: TRxDBGrid;
    grdPrompt: TRxDBGrid;
    Separator2: TMenuItem;
    spBackBuku: TSpeedButton;
    spBukaPromptKustom: TSpeedButton;
    spTambahData: TSpeedButton;
    spEditData: TSpeedButton;
    spHapusData: TSpeedButton;
    spNewTask: TSpeedButton;
    spReapirPromptGambar: TSpeedButton;
    spStart: TSpeedButton;
    spGetURL: TSpeedButton;
    spGoProyek: TSpeedButton;
    spBuatGambar: TSpeedButton;
    Splitter1: TSplitter;
    tabFiturBuku: TTabSheet;
    tabFiturPenerjemahan: TTabSheet;
    tabFiturGambar: TTabSheet;
    tabHomeBook: TTabSheet;
    tabIDBook: TTabSheet;
    tabPromptBook: TTabSheet;
    tbuku: TZTable;
    tgambar: TZTable;
    tbatch: TZTable;
    tkategorigambar: TZTable;
    Timer1: TTimer;
    tkategori: TZTable;
    tmSend_Mass: TTimer;
    tprompt: TZQuery;
    ttask: TZTable;
    VLCPlayer: TPasLibVlcPlayer;
    WVBrowser1: TWVBrowser;
    WVWindowParent1: TWVWindowParent;
    procedure ckAutoCopChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ebFileDocChange(Sender: TObject);
    procedure eCariGambarKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grdBookCellClick(Column: TColumn);
    procedure grdBookDblClick(Sender: TObject);
    procedure grdBookDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdKategoriCellClick(Column: TColumn);
    procedure grdKategoriDblClick(Sender: TObject);
    procedure grdkategorigambarDblClick(Sender: TObject);
    procedure grdPromptDblClick(Sender: TObject);
    procedure lvStelCodeClick(Sender: TObject);
    procedure lvStelCodeDblClick(Sender: TObject);
    procedure lvStepPreparedClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure mnCreateBookClick(Sender: TObject);
    procedure mnDeepSeekClick(Sender: TObject);
    procedure mnGoClaudeClick(Sender: TObject);
    procedure mnGoCopilotClick(Sender: TObject);
    procedure mnGoDeepSeekClick(Sender: TObject);
    procedure mnGoGeminiClick(Sender: TObject);
    procedure mnGoGPTClick(Sender: TObject);
    procedure Grok(Sender: TObject);
    procedure mnHapusAllClick(Sender: TObject);
    procedure mnHapusCurrentClick(Sender: TObject);
    procedure mnHapusPromptClick(Sender: TObject);
    procedure mnHelpClick(Sender: TObject);
    procedure mnNoteClick(Sender: TObject);
    procedure mnQwenClick(Sender: TObject);
    procedure mnTestEngineClick(Sender: TObject);
    procedure Separator3Click(Sender: TObject);
    procedure spCodeGoClick(Sender: TObject);
    procedure spErnieClick(Sender: TObject);
    procedure spImageGoClick(Sender: TObject);
    procedure mnProjectClick(Sender: TObject);
    procedure mnReloadClick(Sender: TObject);
    procedure mnTentangClick(Sender: TObject);
    procedure MyDriveClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure spBackBukuClick(Sender: TObject);
    procedure spBackPromptClick(Sender: TObject);
    procedure spBackToPromptClick(Sender: TObject);
    procedure spbBookClick(Sender: TObject);
    procedure spBukaDokuen(Sender: TObject);
    procedure spBukaPromptKustomClick(Sender: TObject);
    procedure spCreateOutineBabClick(Sender: TObject);
    procedure spCreateSQLClick(Sender: TObject);
    procedure spEditDataClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure spHapusDataClick(Sender: TObject);
    procedure spMetaClick(Sender: TObject);
    procedure spMixtralClick(Sender: TObject);
    procedure spNewTaskClick(Sender: TObject);
    procedure spPhotopeaClick(Sender: TObject);
    procedure spPlayChatClick(Sender: TObject);
    procedure spPlayMediaClick(Sender: TObject);
    procedure spMistralClick(Sender: TObject);
    procedure spQwenClick(Sender: TObject);
    procedure spReloadClick(Sender: TObject);
    procedure spRunPromptCodeClick(Sender: TObject);
    procedure spSideClick(Sender: TObject);
    procedure spStart2Click(Sender: TObject);
    procedure spStartClick(Sender: TObject);
    procedure spEksekusiManteraClick(Sender: TObject);
    procedure spExecSQLClick(Sender: TObject);
    procedure spGayaBahasaClick(Sender: TObject);
    procedure spGetURLClick(Sender: TObject);
    procedure spGoPromptingClick(Sender: TObject);
    procedure spBuatGambarClick(Sender: TObject);
    procedure spGoProyekClick(Sender: TObject);
    procedure spKonsistensiClick(Sender: TObject);
    procedure spReapirPromptGambarClick(Sender: TObject);
    procedure spSaveBookClick(Sender: TObject);
    procedure spTambahDataClick(Sender: TObject);
    procedure spTerjemahClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure tmSend_Mass2Timer(Sender: TObject);
    procedure tmSend_MassTimer(Sender: TObject);
    procedure trOtherClick(Sender: TObject);
    procedure trOtherDblClick(Sender: TObject);
    procedure WVBrowser1AfterCreated(Sender: TObject);
    procedure WVBrowser1DocumentTitleChanged(Sender: TObject);
    procedure WVBrowser1InitializationError(Sender: TObject;
      aErrorCode: HRESULT; const aErrorMessage: wvstring);
    procedure WVBrowser1NavigationCompleted(
      Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2NavigationCompletedEventArgs);
    procedure WVBrowser1NewWindowRequested(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2NewWindowRequestedEventArgs);
    procedure WVBrowser1SourceChanged(
      Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2SourceChangedEventArgs);
  protected                  
    // It's necessary to handle these messages to call NotifyParentWindowPositionChanged or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
  public
    { Public declarations }
    procedure TulisPrompt(tx:string);
    function GetEngine:string;
    procedure Tanya;
  private
    FormPrompt : TPromptForm;
    FormSplit : TfrmSplitter;
    FormNote : TFormNote;
    FormData : TFormDB;
    FormAbout : TfrmTentang;
    FormSplash : TFZSplash;
  end;

var
  MainForm: TMainForm;
  engine : string ;
  link_engine : string;
  detik : integer = 0;
implementation

{$R *.lfm}

procedure TMainForm.FormShow(Sender: TObject);
begin

  WindowState:=wsMaximized;
  pgBook.ShowTabs:=false;
  pgFitur.ShowTabs:=false;


  if GlobalWebView2Loader.InitializationError then
    showmessage(UTF8Encode(GlobalWebView2Loader.ErrorMessage))
   else
    if GlobalWebView2Loader.Initialized then
      WVBrowser1.CreateBrowser(WVWindowParent1.Handle)
     else
      Timer1.Enabled := True;

  tabHomeBook.show;
  tbatch.open;

  engine := 'GEMINI';
  link_engine := 'https://gemini.google.com/app';

  WVBrowser1.Navigate(link_engine);
  trOther.LoadFromFile(ExtractFilePath(Application.ExeName) + 'support/kustom.txt');
    FormSplash.ShowModal;
    pgFitur.Width:=383;
end;

procedure TMainForm.GoBtnClick(Sender: TObject);
begin

end;

procedure TMainForm.tmSend_Mass2Timer(Sender: TObject);
begin

  grdBatch.Enabled:=false;

  if tbatch.eof then
   begin
       tmSend_Mass2.Enabled:=false;
       progressAuto2.Position:=0;
       detik := 0 ;
       grdBatch.Enabled:=true;
       spStart2.Caption:='START';
       pnPromptBookMenu.Enabled:=true;
   end;

  inc(detik);
    progressAuto2.Position:=detik;
  if detik = StrToInt(cbDetik2.text) then
   begin
   detik := 0 ;
   TulisPrompt( 'Please Translate [' + tbatch.FieldByName('tanya').AsString  + '] into language ' +
                '[' + cbLanguageTranslate.text + ']') ;
   Sleep(2000);
   Tanya;
   tbatch.next;
   end;

end;

procedure TMainForm.tmSend_MassTimer(Sender: TObject);
begin

 grdPrompt.Enabled:=false;

  if tprompt.eof then
   begin
       tmSend_Mass.Enabled:=false;
       progressAuto.Position:=0;
       detik := 0 ;
       grdPrompt.Enabled:=true;
       spStart.Caption:='START';
       pnPromptBookMenu.Enabled:=true;
   end;

  inc(detik);
    progressAuto.Position:=detik;
  if detik = StrToInt(cbDetik.text) then
   begin
   detik := 0 ;
   TulisPrompt( 'Please respond in [' + cbLanguageAsk.text + '] ' +
                tprompt.FieldByName('tanya').AsString);
   Sleep(2000);
   Tanya;
   tprompt.next;
   end;

end;

procedure TMainForm.trOtherClick(Sender: TObject);
begin
end;

procedure TMainForm.trOtherDblClick(Sender: TObject);
begin
  TulisPrompt(trOther.Selected.text);
end;

procedure TMainForm.WVBrowser1AfterCreated(Sender: TObject);
begin
  WVWindowParent1.UpdateSize;
 // Caption := 'SimpleBrowser';

end;

procedure TMainForm.WVBrowser1DocumentTitleChanged(Sender: TObject);
begin
 // Caption := 'SimpleBrowser - ' + UTF8Encode(WVBrowser1.DocumentTitle);
end;

procedure TMainForm.WVBrowser1InitializationError(Sender: TObject;
  aErrorCode: HRESULT; const aErrorMessage: wvstring);
begin
  showmessage(UTF8Encode(aErrorMessage));
end;

procedure TMainForm.WVBrowser1NavigationCompleted(
  Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2NavigationCompletedEventArgs);
begin

end;

procedure TMainForm.WVBrowser1NewWindowRequested(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2NewWindowRequestedEventArgs);
  var
  TargetURL: PWideChar;
  URLString: String;
begin

  aArgs.Get_Uri(TargetURL);
  WVBrowser1.Navigate(String(TargetURL));

  aArgs.Set_Handled(Integer(True)); // Batalkan pembukaan jendela baru

end;

procedure TMainForm.WVBrowser1SourceChanged(
  Sender: TObject; const aWebView: ICoreWebView2; const aArgs: ICoreWebView2SourceChangedEventArgs);
var
  url : string;
  ada : boolean;
begin

  url := WVBrowser1.Source;
  if tabFiturBuku.Showing then
   begin
      ada := tbuku.Locate('LINK_GEMINI',url,[loPartialKey]);

      if not ada then
       begin
       tabHomeBook.show;
     //  spTambahDataClick(sender);
       end
      else
       begin
       tabIDBook.show;
       tbuku.Locate('LINK_GEMINI',url,[loPartialKey]);

       end;
   end;


end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  if GlobalWebView2Loader.Initialized then
    WVBrowser1.CreateBrowser(WVWindowParent1.Handle)
   else
    Timer1.Enabled := True;
end;

procedure TMainForm.spGayaBahasaClick(Sender: TObject);
begin


  TulisPrompt('1. Determine a writing style suitable for this book '+ #13#10 +
              '2. Determine a suitable author persona for this book ' + #13#10 +
              '3. Determine the target audience for this book ' + #13#10 +
              'Note: No Explanation.' + #13#10 +
              'We will consistently use this writing style and author persona. '+
              'Waiting for your question');
    Sleep(2000);
  Tanya;
end;

procedure TMainForm.spGetURLClick(Sender: TObject);
begin
  if edURL.text = '' then
    edURL.Text:= WVBrowser1.Source;
end;

procedure TMainForm.spGoPromptingClick(Sender: TObject);
var
  id : string;
begin

  id := tbuku.FieldByName('ID').AsString;

  with tprompt do
  begin
    close;
    sql.Clear;
    sql.Add('select * from prompts where id_buku='+ id );
    open;
  end;
  tabPromptBook.show;

end;

procedure TMainForm.spBuatGambarClick(Sender: TObject);
var
  prompt : string;
begin

  prompt := 'Create Picture from this text [' + edtGambar.Text + ']';
  TulisPrompt(prompt);

end;

procedure TMainForm.spGoProyekClick(Sender: TObject);
begin
  tabHomeBook.show;
end;

procedure TMainForm.spKonsistensiClick(Sender: TObject);
begin
  TulisPrompt('Saya akan mulai bertahap membuat isi tiap bab. Anda harus konsisten '+
              'dengan judul judul bab ini. Jangan membuat judul bab baru atau menggantinya.'+
              'Tunggu perintah saya');
end;

procedure TMainForm.spReapirPromptGambarClick(Sender: TObject);
var
  prompt : string;
begin

  prompt := '#Role' + #13#10 + ' Image Prompt Engineer for High-Quality Results , '+  #13#10 +
            '#Task '+ #13#10 + 'Improve the following image generation prompt "' + edtGambar.Text + '"';
  TulisPrompt(prompt);

end;

procedure TMainForm.spSaveBookClick(Sender: TObject);
begin
  tbuku.edit;
  tbuku.Post;
  ShowMessage('Update Sucessfully');
end;

procedure TMainForm.spTambahDataClick(Sender: TObject);
begin
  tbuku.Append;
  FormData.Show;
end;

procedure TMainForm.spTerjemahClick(Sender: TObject);
begin
  tabFiturPenerjemahan.show;

end;

procedure TMainForm.spEksekusiManteraClick(Sender: TObject);
begin
  TulisPrompt(tbuku.FieldByName('mantera').AsString )
end;

procedure TMainForm.spExecSQLClick(Sender: TObject);
begin

   FormPrompt.synExecSQL.Lines.Clear;
   FormPrompt.tabExecSQL.show;
   FormPrompt.ShowModal;

end;

procedure TMainForm.spCreateOutineBabClick(Sender: TObject);
begin

 FormPrompt.synOutline.Lines.Clear;
 FormPrompt.tabOutline.show;
 FormPrompt.ShowModal;

end;

procedure TMainForm.spCreateSQLClick(Sender: TObject);
begin


 FormPrompt.synCreateSQL.Lines.Clear;
 FormPrompt.tabPrompt.show;
 FormPrompt.ShowModal;

end;

procedure TMainForm.spEditDataClick(Sender: TObject);
begin
  tbuku.edit;
  FormData.Show;
end;

procedure TMainForm.SpeedButton12Click(Sender: TObject);
begin

end;

procedure TMainForm.SpeedButton13Click(Sender: TObject);
var
  s : string;
begin

  s := InputBox('URL','Masukan URL Youtube','') ;

  if s <> '' then
   VLCPlayer.PlayYoutube(s);


end;

procedure TMainForm.SpeedButton14Click(Sender: TObject);
begin
  VLCPlayer.Stop();
end;

procedure TMainForm.SpeedButton6Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
   begin
   VLCPlayer.Play(OpenDialog1.FileName);
   end;
end;

procedure TMainForm.spHapusDataClick(Sender: TObject);
begin
 if Dialogs.MessageDlg('Menghapus Data Buku ini?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
   begin

     koneksi.ExecuteDirect('delete from prompts where id_buku=' +
                           tbuku.FieldByName('id').AsString);
     tbuku.Delete;
   end;

end;

procedure TMainForm.spMetaClick(Sender: TObject);
begin
    engine := 'Meta';
   link_engine := 'https://www.meta.ai/'  ;
   WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.spMixtralClick(Sender: TObject);
begin
   engine := 'MISTRAL';
   link_engine := 'https://chat.mistral.ai/chat'  ;
   WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.spNewTaskClick(Sender: TObject);
begin
  tabSplit.show;
end;

procedure TMainForm.spPhotopeaClick(Sender: TObject);
begin
  WVBrowser1.Navigate('https://www.photopea.com/');
end;

procedure TMainForm.spPlayChatClick(Sender: TObject);
begin
  tabChat.Show;
end;

procedure TMainForm.spPlayMediaClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TMainForm.spMistralClick(Sender: TObject);
begin
     engine := 'QWEN';
   link_engine := 'https://chat.mistral.ai/chat'  ;
   WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.spQwenClick(Sender: TObject);
begin
   engine := 'QWEN';
   link_engine := 'https://chat.qwen.ai/'  ;
   WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.spReloadClick(Sender: TObject);
begin
  WVBrowser1.Refresh;
end;

procedure TMainForm.spRunPromptCodeClick(Sender: TObject);
begin



end;

procedure TMainForm.spSideClick(Sender: TObject);
begin
  if pgFitur.Showing then
     pgFitur.hide
  else
     pgFitur.Show;
end;

procedure TMainForm.spStart2Click(Sender: TObject);
begin
  
if tprompt.IsEmpty then exit;

if spStart2.Caption='START' then
  begin
  detik:= 0;
  progressAuto2.Min:=0;
  progressAuto2.Max:=StrToInt(cbDetik2.Text);
  tmSend_Mass2.Interval:=1000 ;
  tmSend_Mass2.Enabled:=True;
  spStart2.Caption:='STOP';
  pnPromptBookMenu.Enabled:=false;

  end
else
begin
  tmSend_Mass2.Enabled:=false;
  progressAuto2.Position:=0;
  detik := 0 ;
  grdBatch.Enabled:=true;
  spStart2.Caption:='START';
  pnPromptBookMenu.Enabled:=true;
end
end;

procedure TMainForm.spStartClick(Sender: TObject);
begin

if tprompt.IsEmpty then exit;

if spStart.Caption='START' then
  begin
  detik:= 0;
  progressAuto.Min:=0;
  progressAuto.Max:=StrToInt(cbDetik.Text);
  tmSend_Mass.Interval:=1000 ;
  tmSend_Mass.Enabled:=True;
  spStart.Caption:='STOP';
  pnPromptBookMenu.Enabled:=false;

  end
else
begin
  tmSend_Mass.Enabled:=false;
  progressAuto.Position:=0;
  detik := 0 ;
  grdPrompt.Enabled:=true;
  spStart.Caption:='START';
  pnPromptBookMenu.Enabled:=true;
end

end;

procedure TMainForm.grdBookCellClick(Column: TColumn);
begin



end;

procedure TMainForm.eCariGambarKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then
    begin
        tgambar.Filtered:=false;
        tgambar.Filter:='isi like' + QuotedStr('*'+ eCariGambar.text + '*');
        tgambar.Filtered:=true;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  //frmSplitter.TrdPrepare.free;
end;

procedure TMainForm.ebFileDocChange(Sender: TObject);
begin

end;

procedure TMainForm.ckAutoCopChange(Sender: TObject);
begin


end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  With koneksidbgambar do
  begin
    Connected:=false;
    Protocol:='sqlite';
    Database:=ExtractFilePath(Application.ExeName) + 'support/language/' + ComboBox1.text + '.sla';
    LibraryLocation:=ExtractFilePath(Application.ExeName) + 'support/sqlite3.dll';
    Connect;
    tkategorigambar.open;
    tgambar.open;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin

  FormPrompt := TPromptForm.Create(self);
  FormAbout := TfrmTentang.create(self);
  FormSplash := TFZSplash.Create(self);


  FormSplit := TfrmSplitter.Create(self);
  FormSplit.Parent:= pnFormSplit ;
  FormSplit.Align:=alClient;
  FormSplit.BorderStyle:=bsnone;
  FormSplit.show;


  FormNote := TFormNote.Create(self);   ;
  FormData := TFormDB.create(self);
  tabChat.show;
  With koneksi do
  begin
    Protocol:='sqlite';
    Database:=ExtractFilePath(Application.ExeName) + 'support/capty.db';
    LibraryLocation:=ExtractFilePath(Application.ExeName) + 'support/sqlite3.dll';
    Connect;
    tbuku.open;
    tkategori.open;
    ttask.Open;
    tcode.open;
  end;



  //  VLCPlayer.VLC.Path:= ExtractFilePath(Application.ExeName) + 'support\vlc\';
end;

procedure TMainForm.grdBookDblClick(Sender: TObject);
var
  url : string;
begin

  url := tbuku.FieldByName('LINK_GEMINI').AsString;


  if url <> '' then
    WVBrowser1.Navigate(url);
  tbuku.edit;
  tabIDBook.show;

end;

procedure TMainForm.grdBookDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


 grdBook.Canvas.Font.Style:=[fsBold];
 if trim(tbuku.FieldByName('FILE_DOC').AsString) <>''
 then
  grdBook.Canvas.Font.Color:=clBlue
else
  grdBook.Canvas.Font.Color:=clRed;

  grdBook.DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TMainForm.grdKategoriCellClick(Column: TColumn);
begin
  tbuku.Filtered:=false;
  tbuku.Filter:='JENIS=' + QuotedStr(tkategori.FieldByName('KATEGORI').AsString);
  tbuku.Filtered:=true;
end;

procedure TMainForm.grdKategoriDblClick(Sender: TObject);
begin

end;

procedure TMainForm.grdkategorigambarDblClick(Sender: TObject);
begin
  tgambar.Filtered:=false;
  tgambar.Filter:= 'kategori=' + QuotedStr(tkategorigambar.FieldByName('kategori').AsString);
  tgambar.Filtered:=true;
end;

procedure TMainForm.grdPromptDblClick(Sender: TObject);
var
  prompt : string;
begin

  prompt := tprompt.FieldByName('tanya').AsString;

  if prompt='' then exit;

  TulisPrompt(prompt);
  Sleep(2000);
  Tanya;

end;

procedure TMainForm.lvStelCodeClick(Sender: TObject);
begin

end;

procedure TMainForm.lvStelCodeDblClick(Sender: TObject);
begin
end;

procedure TMainForm.lvStepPreparedClick(Sender: TObject);
var
  s : integer;
  i : integer;
begin

   i := lvStepPrepared.Selected.Index;
   s := StrToInt(lvStepPrepared.Items.Item[i].Caption);

   case s of
   1 :  spGayaBahasaClick(sender);
   2 :  spEksekusiManteraClick(sender);
   3 :  spCreateOutineBabClick(sender);
   4 :  spCreateSQLClick(sender);
   5 :  spExecSQLClick(sender);

   end;

end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  engine := 'GEMINI' ;
  link_engine := 'https://gemini.google.com/app';
  WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.MenuItem7Click(Sender: TObject);
begin
  OpenDocument('winword');
end;

procedure TMainForm.mnCreateBookClick(Sender: TObject);
var
  s : string ;
begin
  s := InputBox('Input','Enter Topic Title ','');
  s := '#Role ' + sLineBreak +
       'prompt enginer '  + sLineBreak +
       '#task ' + sLineBreak +
       'Create a prompt for making an initial book outline with the theme [' + s + '] , use role elemen :' + sLineBreak +
       '1. Context, '+ sLineBreak +
       '2. Output Format, '+ sLineBreak +
       '3. Result , '+ sLineBreak +
       '4. Constraint , '+ sLineBreak +
       '5. Trigger word.';

  TulisPrompt(s);

end;

procedure TMainForm.mnDeepSeekClick(Sender: TObject);
begin
  engine := 'DEEPSEEK' ;
  link_engine := 'https://chat.deepseek.com/';
  WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.mnGoClaudeClick(Sender: TObject);
begin

   engine := 'CLAUDE';
   link_engine := 'https://claude.ai/login';
   WVBrowser1.Navigate(link_engine);

end;

procedure TMainForm.mnGoCopilotClick(Sender: TObject);
begin
     engine := 'COPILOT';
    link_engine := 'https://copilot.microsoft.com/';
    WVBrowser1.Navigate(link_engine);

end;

procedure TMainForm.mnGoDeepSeekClick(Sender: TObject);
begin
     engine:= 'DEEPSEEK';
     link_engine := 'https://chat.deepseek.com/';
     WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.mnGoGeminiClick(Sender: TObject);
begin
  WVBrowser1.Navigate('https://gemini.google.com/app');
end;

procedure TMainForm.mnGoGPTClick(Sender: TObject);
begin
    engine := 'CHATGPT';
   WVBrowser1.Navigate('https://chatgpt.com/');

end;

procedure TMainForm.Grok(Sender: TObject);
begin
   engine := 'GROK';
   link_engine := 'https://grok.com/'  ;
   WVBrowser1.Navigate(link_engine);

end;

procedure TMainForm.mnHapusAllClick(Sender: TObject);
begin
  if Dialogs.MessageDlg('Delete All Record ?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
   begin
    koneksi.ExecuteDirect('delete from batch');
    tbatch.Refresh;
   end;
end;

procedure TMainForm.mnHapusCurrentClick(Sender: TObject);
begin

  if Dialogs.MessageDlg('Delete This Record ?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    tbatch.Delete;
end;

procedure TMainForm.mnHapusPromptClick(Sender: TObject);
begin
   if Dialogs.MessageDlg('Delete This Prompt ?',
  mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    tprompt.Delete;
end;

procedure TMainForm.mnHelpClick(Sender: TObject);
begin
  OpenDocument(ExtractFilePath(Application.ExeName) + 'support/Captify.pdf');
end;

procedure TMainForm.mnNoteClick(Sender: TObject);
begin
  FormNote.FormStyle:=fsStayOnTop;
  FormNote.show;
end;

procedure TMainForm.mnQwenClick(Sender: TObject);
begin

end;

procedure TMainForm.mnTestEngineClick(Sender: TObject);
begin
  engine := GetEngine;
  TulisPrompt('Explain Short About  ' + engine);
  sleep(2000);
  Tanya;
end;

procedure TMainForm.Separator3Click(Sender: TObject);
begin

end;

procedure TMainForm.spCodeGoClick(Sender: TObject);
begin

end;

procedure TMainForm.spErnieClick(Sender: TObject);
begin
    engine := 'ERNIE';
   link_engine := 'https://ernie.baidu.com/'  ;
   WVBrowser1.Navigate(link_engine);
end;

procedure TMainForm.spImageGoClick(Sender: TObject);
begin
  tabFiturGambar.show;
   With koneksidbgambar do
  begin
    Connected:=false;
    Protocol:='sqlite';
    Database:=ExtractFilePath(Application.ExeName) + 'support/language/' + ComboBox1.text + '.sla';
    LibraryLocation:=ExtractFilePath(Application.ExeName) + 'support/sqlite3.dll';
    Connect;
    tkategorigambar.open;
    tgambar.open;
  end;
end;

procedure TMainForm.mnProjectClick(Sender: TObject);
begin
  WVBrowser1.Navigate('https://docspace-5ew5rn.onlyoffice.com/rooms/personal/filter?'+
                       'folder=2533006&page=1&sortby=DateAndTime&sortorder=descending&date=1770180468333');
end;

procedure TMainForm.mnReloadClick(Sender: TObject);
begin
  WVBrowser1.Refresh;
end;

procedure TMainForm.mnTentangClick(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TMainForm.MyDriveClick(Sender: TObject);
begin
  WVBrowser1.Navigate('https://docspace-5ew5rn.onlyoffice.com/s/DWvX5jkx64LvZKm');

end;

procedure TMainForm.Panel2Click(Sender: TObject);
begin

end;

procedure TMainForm.spBackBukuClick(Sender: TObject);
begin
  tabIDBook.show;
end;

procedure TMainForm.spBackPromptClick(Sender: TObject);
begin
  tabHomeBook.show;
end;

procedure TMainForm.spBackToPromptClick(Sender: TObject);
begin
  tabPromptBook.show;
end;

procedure TMainForm.spbBookClick(Sender: TObject);
begin
  tabFiturBuku.show;
end;

procedure TMainForm.spBukaDokuen(Sender: TObject);
var
  doc:string;
begin
  tabChat.show;
  doc:= tbuku.FieldByName('FILE_DOC').AsString;
  if doc = '' then exit;

  WVBrowser1.Navigate(doc);
end;

procedure TMainForm.spBukaPromptKustomClick(Sender: TObject);
begin
  tabOther.Show;
end;

procedure TMainForm.WMMove(var aMessage : TWMMove);
begin
  inherited;

  if (WVBrowser1 <> nil) then
    WVBrowser1.NotifyParentWindowPositionChanged;
end;

procedure TMainForm.WMMoving(var aMessage : TMessage);
begin
  inherited;

  if (WVBrowser1 <> nil) then
    WVBrowser1.NotifyParentWindowPositionChanged;
end;

procedure TMainForm.TulisPrompt(tx:string);
 var
    jscode : string;
    area : string;
begin

if ckAutoCop.Checked then
    Clipboard.AsText:= tx;

  // perbaiki
  tx := AnsiReplaceStr(tx,'\','\\"');
  tx := AnsiReplaceStr(tx,'"','\"');
  tx := AnsiReplaceStr(tx,'''','\x27');
  tx := AnsiReplaceStr(tx,#13#10,'\n');
  tx := AnsiReplaceStr(tx,'&','&amp;');
  tx := AnsiReplaceStr(tx,'<','&lt;');
  tx := AnsiReplaceStr(tx,'>','&gt;');
  tx := AnsiReplaceStr(tx,#10,'\n');
  tx := tx + '\n' + 'Note : Dont Use Canvas';
 // tx := tx + #13#10 + 'jawaban dalam bahasa "' + cbLanguageAsk.text + '"';

  if GetEngine='GEMINI' then
    begin
      jsCode := 'textbox = document.querySelector(''div[role="textbox"]'');'+
                'textbox.textContent = "' +tx + '"' ;
      WVBrowser1.ExecuteScript(jsCode,  0);
    end
  else if GetEngine = 'DEEPSEEK' then
    begin

  JScode := 'function fillTextareaAndActivateButton(selector, text) {' + #13#10 +
            '  const textarea = document.querySelector(selector);' + #13#10 +
            '  if (!textarea) return console.error(''Textarea tidak ditemukan'');' + #13#10 +
            '' + #13#10 +
            '  // 1. Focus dulu' + #13#10 +
            '  textarea.focus();' + #13#10 +
            '' + #13#10 +
            '  // 2. Override value via React native setter' + #13#10 +
            '  const nativeSetter = Object.getOwnPropertyDescriptor(' + #13#10 +
            '    window.HTMLTextAreaElement.prototype, ''value''' + #13#10 +
            '  ).set;' + #13#10 +
            '  nativeSetter.call(textarea, text);' + #13#10 +
            '' + #13#10 +
            '  // 3. Trigger semua event yang mungkin didengarkan React' + #13#10 +
            '  [''input'', ''change'', ''keydown'', ''keyup'', ''keypress''].forEach(eventType => {' + #13#10 +
            '    let event;' + #13#10 +
            '    if (eventType.startsWith(''key'')) {' + #13#10 +
            '      event = new KeyboardEvent(eventType, { bubbles: true, cancelable: true, key: ''a'' });' + #13#10 +
            '    } else {' + #13#10 +
            '      event = new Event(eventType, { bubbles: true });' + #13#10 +
            '    }' + #13#10 +
            '    textarea.dispatchEvent(event);' + #13#10 +
            '  });' + #13#10 +
            '}' + #13#10 +
            '' + #13#10 +
            '// Panggil:' + #13#10 +
            'fillTextareaAndActivateButton(''textarea[placeholder="Message DeepSeek"]'', '''+tx+''');';


    WVBrowser1.ExecuteScript(jsCode,  0);
    end
  else if GetEngine = 'CHATGPT' then
    begin
    // jscode :=' const el = document.getElementById("prompt-textarea"); '+
      //         'el.innerHTML = "<p>' + tx + '</p>";';

     jscode := 'document.querySelector(''#prompt-textarea'').textContent = ''' + tx + '''';
    WVBrowser1.ExecuteScript(jsCode,  0);

    end
  else if GetEngine = 'COPILOT' then
    begin
    jscode := 'const ta = document.querySelector(''textarea[id="userInput"]''); ' +
           'const nativeSetter = Object.getOwnPropertyDescriptor(window.HTMLTextAreaElement.prototype, ''value'').set; ' +
           'nativeSetter.call(ta, ''' +tx +'''); ' +
           'ta.dispatchEvent(new Event(''input'', { bubbles: true }));';


    end
  else if GetEngine = 'GROK' then
    begin
    jsCode := 'document.querySelector(''.tiptap'').innerHTML ="' +tx+ '";';
     WVBrowser1.ExecuteScript(jsCode,  0);
    end
  else if GetEngine = 'ERNIE' then
    begin
         jscode := 'function fillSlateEditorNative(newText) { ' +
                   'const editor = document.querySelector(''[data-slate-editor="true"]''); ' +
                   'if (!editor) return console.error("Editor tidak ditemukan!"); ' +
                   'editor.focus(); ' +
                   'editor.textContent = newText; ' +
                   'const inputEvent = new InputEvent(''input'', { bubbles: true, cancelable: true, inputType: ''insertText'', data: newText }); ' +
                   'editor.dispatchEvent(inputEvent); ' +
                   '} ' +
                   'fillSlateEditorNative("' + tx + '");';

   WVBrowser1.ExecuteScript(jsCode,  0);
    end
  else if GetEngine = 'QWEN' then
    begin
     JScode := 'function fillTextareaAndActivateButton(selector, text) {' + #13#10 +
            '  const textarea = document.querySelector(selector);' + #13#10 +
            '  if (!textarea) return console.error(''Textarea tidak ditemukan'');' + #13#10 +
            '' + #13#10 +
            '  // 1. Focus dulu' + #13#10 +
            '  textarea.focus();' + #13#10 +
            '' + #13#10 +
            '  // 2. Override value via React native setter' + #13#10 +
            '  const nativeSetter = Object.getOwnPropertyDescriptor(' + #13#10 +
            '    window.HTMLTextAreaElement.prototype, ''value''' + #13#10 +
            '  ).set;' + #13#10 +
            '  nativeSetter.call(textarea, text);' + #13#10 +
            '' + #13#10 +
            '  // 3. Trigger semua event yang mungkin didengarkan React' + #13#10 +
            '  [''input'', ''change'', ''keydown'', ''keyup'', ''keypress''].forEach(eventType => {' + #13#10 +
            '    let event;' + #13#10 +
            '    if (eventType.startsWith(''key'')) {' + #13#10 +
            '      event = new KeyboardEvent(eventType, { bubbles: true, cancelable: true, key: ''a'' });' + #13#10 +
            '    } else {' + #13#10 +
            '      event = new Event(eventType, { bubbles: true });' + #13#10 +
            '    }' + #13#10 +
            '    textarea.dispatchEvent(event);' + #13#10 +
            '  });' + #13#10 +
            '}' + #13#10 +
            '' + #13#10 +
            '// Panggil:' + #13#10 +
            'fillTextareaAndActivateButton(''textarea[placeholder="How can I help you today?"]'', '''+tx+''');';

     WVBrowser1.ExecuteScript(jsCode,  0);
    end
  else if GetEngine = 'CLAUDE' then
    begin

    // jsCode := 'const editor = document.querySelector(''div[data-testid="chat-input"]'');'+
      //         'editor.textContent = "' +tx +'";';

     JSCODE := 'function setReactInput(text) {' +
              'const el = document.querySelector(''[data-testid="chat-input"]'');' +
              'el.focus();' +
              'el.innerHTML = '''';' +
              'document.execCommand(''insertText'', false, text);' +
              '}' +
              'function sendMessage(text) {' +
              'setReactInput(text);' +
              'setTimeout(() => {' +
              'const sendBtn = document.querySelector(''button[aria-label="Send message"]'');' +
              'if (sendBtn) sendBtn.click();' +
              '}, 300);' +
              '}' +
              'sendMessage("'+tx+'");';
          WVBrowser1.ExecuteScript(jsCode,  0);
    end;



end;

function TMainForm.GetEngine:string;
var
   url : string;
begin

   url := WVBrowser1.Source;
   if AnsiContainsStr(url,'gemini') then
     Result := 'GEMINI'
   else if AnsiContainsStr(url,'qwen') then
     Result := 'QWEN'
   else if AnsiContainsStr(url,'grok') then
     Result := 'GROK'
   else if AnsiContainsStr(url,'copilot') then
     Result := 'COPILOT'
   else if AnsiContainsStr(url,'chatgpt') then
     Result := 'CHATGPT'
    else if AnsiContainsStr(url,'cluade') then
     Result := 'CLAUDE'
    else if AnsiContainsStr(url,'baidu') then
     Result := 'ERNIE'
   else if AnsiContainsStr(url,'deepseek') then
     Result := 'DEEPSEEK'  ;


end;

procedure TMainForm.Tanya;
 var jscode : string;
  area : string;
begin

  if GetEngine = 'GEMINI' then
  begin
      area := 'mat-icon notranslate send-button-icon icon-filled google-symbols mat-ligature-font mat-icon-no-color';
      jsCode:= 'document.getElementsByClassName("'+ area +'")[0].click()';
      WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine = 'DEEPSEEK' then
  begin
    jsCode := 'document.querySelector(''._7436101.ds-icon-button.ds-icon-button--l'').click();';
     WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine = 'ERNIE' then
  begin
       jscode := 'document.querySelector(''svg'').closest(''div[class*="send"]'').click();';
      WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine = 'CHATGPT' then
  begin
      jsCode := 'document.getElementById("composer-submit-button").click();';
      WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine ='COPILOT' then
  begin
       jsCode := 'document.querySelector(''[data-testid="submit-button"]'').click();';
       WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine ='GROK' then
  begin
    jsCode := 'const button = document.querySelector(''button[aria-label="Submit"]'').click();';
    WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine ='QWEN' then
  begin
     JSCode :=
      'const button = document.querySelector(''.send-button'');' + #13#10 +
      'if (button) {' + #13#10 +
      '    const event = new MouseEvent(''click'', {' + #13#10 +
      '        view: window,' + #13#10 +
      '        bubbles: true,' + #13#10 +
      '        cancelable: true' + #13#10 +
      '    });' + #13#10 +
      '    button.dispatchEvent(event);' + #13#10 +
      '}';
    WVBrowser1.ExecuteScript(jsCode,  0);
  end
  else if GetEngine ='CLAUDE' then
  begin
    jscode := 'const sendButton = document.querySelector(''button[aria-label="Send message"]'').click(); ';
     WVBrowser1.ExecuteScript(jsCode,  0);
  end;




end;

initialization
  GlobalWebView2Loader                := TWVLoader.Create(nil);
  GlobalWebView2Loader.UserDataFolder := UTF8Decode(ExtractFileDir(Application.ExeName) + '\CustomCache');
  GlobalWebView2Loader.StartWebView2;

end.
