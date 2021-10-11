unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, Buttons, ExtCtrls, ShellAPI, ShlObj, ComObj;

type
  TMainForm = class(TForm)
    XPManifest: TXPManifest;
    ed_file: TEdit;
    lbl_file: TLabel;
    ed_folder: TEdit;
    lbl_folder: TLabel;
    bt_open_file: TSpeedButton;
    bt_open_folder: TSpeedButton;
    bt_close: TSpeedButton;
    bt_set_icon: TSpeedButton;
    OpenDlg: TOpenDialog;
    Bevel1: TBevel;
    procedure bt_closeClick(Sender: TObject);
    procedure bt_set_iconClick(Sender: TObject);
    procedure bt_open_fileClick(Sender: TObject);
    procedure bt_open_folderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  PSHFolderCustomSettings = ^SHFolderCustomSettings;
  SHFolderCustomSettings = packed record
    dwSize: DWORD;
    dwMask: DWORD;
    pvid: PGUID;
    pszWebViewTemplate: PWideChar;
    cchWebViewTemplate: DWORD;
    pszWebViewTemplateVersion: PWideChar;
    pszInfoTip: PWideChar;
    cchInfoTip: DWORD;
    pclsid: PGUID;
    dwFlags: DWORD;
    pszIconFile: PWideChar;
    cchIconFile: DWORD;
    iIconIndex: Integer;    
    pszLogo: PWideChar;
    cchLogo: DWORD;
  end;

const
  FCSM_VIEWID = $01;
  FCSM_WEBVIEWTEMPLATE = $02;
  FCSM_INFOTIP = $04;
  FCSM_CLSID = $08;
  FCSM_ICONFILE  = $10;
  FCSM_LOGO = $20;
  FCSM_FLAGS = $40;

  FCS_READ = $01;
  FCS_FORCEWRITE = $02;
  FCS_WRITE = FCS_READ or FCS_FORCEWRITE;


var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function SHGetSetFolderCustomSettings(pfcs: PSHFolderCustomSettings;
  pszPath: PWideChar; dwReadWrite: DWORD): HRESULT; stdcall; external 'shell32.dll'
  name 'SHGetSetFolderCustomSettingsW';


function SetFolderIcon(Folder, IconFile: WideString; IconIndex: Integer): HRESULT;
var
  fcs: SHFolderCustomSettings;
begin
  FillChar(fcs, SizeOf(fcs), 0);
  fcs.dwSize := SizeOf(fcs);
  fcs.dwMask := FCSM_ICONFILE;
  fcs.pszIconFile := PWideChar(IconFile);
  fcs.cchIconFile := 0;
  fcs.iIconIndex := IconIndex;
  Result := SHGetSetFolderCustomSettings(@fcs, PWideChar(Folder), FCS_FORCEWRITE);
end;

procedure TMainForm.bt_closeClick(Sender: TObject);
begin
  Application.Terminate ;
end;

procedure TMainForm.bt_set_iconClick(Sender: TObject);
begin
  if SetFolderIcon(ed_folder.Text, ed_file.Text, 0) = S_OK
   then  MessageBox(0, 'Иконка успешно установлена..!!', 'Информация', MB_ICONQUESTION);
end;

procedure TMainForm.bt_open_fileClick(Sender: TObject);
begin
  if OpenDlg.Execute then ed_file.Text := OpenDlg.FileName;
end;

procedure TMainForm.bt_open_folderClick(Sender: TObject);
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  Path_id : array[0..MAX_PATH] of char;
begin
  FillChar(BrowseInfo, SizeOf(TBrowseInfo), #0);
  BrowseInfo.hwndOwner := MainForm.Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  BrowseInfo.lpszTitle := PChar('Выберите папку, для установки иконки');
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then
  begin
    SHGetPathFromIDList(lpItemID, Path_id);
    ed_folder.Text := Path_id;
    GlobalFreePtr(lpItemID);
  end;
end;

end.
