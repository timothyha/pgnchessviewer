unit PGNChessViewerControllerU;

{$modeswitch ObjectiveC1}

interface

uses
  Classes, SysUtils, CocoaAll, NSHelpers, WebKit;

type
  PGNChessViewerController = objcclass(NSWindowController)
     {IBOutlets}
    Browser : WebView;
    window : NSWindow;
     {IBActions}

  public
    function init : id; override;
    procedure dealloc; override;
    procedure windowDidLoad; override;
    function windowTitleForDocumentDisplayName(displayName: NSString): NSString; override;
  end;

function LocalDirectory: string;
function ReadChessFile(name: string): string;

implementation

uses
  PGNChessViewerU;

function LocalDirectory: string;
var
arr: NSArray;
begin
arr := NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, true);
Result := NSStrToStr(arr.objectAtIndex(0)) + '/PGNChessViewer';
ForceDirectories(Result);
end;

function AppDirectory: string;
begin
Result := StringReplace(ParamStr(0),'MacOS/PGNChessViewer','Resources',[]);
end;

function ReadChessFile(name: string): string;
var
header,footer,lines: TStringList;
i: integer;
s: string;
begin

try

header := TStringList.Create;
header.LoadFromFile(AppDirectory + '/header.html');

s := 'file://' + AppDirectory + '/pgn4web/';
for i:=0 to header.Count-1 do
header[i] := StringReplace(header[i], '%BASEDIR%', s, []);

lines := TStringList.Create;
lines.LoadFromFile(name);
footer := TStringList.Create;
footer.LoadFromFile(AppDirectory + '/footer.html');

header.AddStrings(lines);
header.AddStrings(footer);
header.SaveToFile(LocalDirectory + '/temp.html');

Result := LocalDirectory + '/temp.html';

    except
        writeln('Could not load file ' + name);
Result := '';
    end;
end;

function PGNChessViewerController.init : id;
begin
  Result := initWithWindowNibName(NSSTR('PGNChessViewer'));
end;

procedure PGNChessViewerController.dealloc;
begin
  inherited dealloc;
end;

function PGNChessViewerController.windowTitleForDocumentDisplayName(displayName: NSString): NSString;
begin
    Result := displayName;
    if NSSTRtoSTr(displayName) = 'Untitled' then
    Result := StrToNSSTR('PGN Chess Viewer for Mac OS X');
end;

procedure PGNChessViewerController.windowDidLoad;
var
s : string;
begin
  inherited windowDidLoad;
  Browser.setMainFrameURL(StrToNSSTR('file://' + AppDirectory + '/index.html'));
//Browser.loadHTMLString_baseURL(StrToNSSTR('<h1>?'), nil);
//writeln('Path is ');

s := NSStrToStr(document.fileURL.absoluteString);
if s <> '' then
begin
    s := StringReplace(s, 'file://localhost', '', []);
s := ReadChessFile(s);
writeln(s);
    if s <> '' then
    Browser.setMainFrameURL(StrToNSSTR('file://localhost' + s));
end;

end;


end.

