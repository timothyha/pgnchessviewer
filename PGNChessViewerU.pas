unit PGNChessViewerU;

{$modeswitch ObjectiveC1}

interface

uses
  CocoaAll, NSHelpers, WebKit, AnonClassDefinitionsWebkit,
  PGNChessViewerControllerU;

type
  PGNChessViewer = objcclass(NSDocument)
  public
    function init : id; override;
    procedure dealloc; override;
    procedure makeWindowControllers; override;
    function writeToURL_ofType_error(absoluteURL: NSURL; typeName: NSString; outError: NSErrorPointer): Boolean; override;
    function readFromURL_ofType_error(absoluteURL: NSURL; typeName: NSString; outError: NSErrorPointer): Boolean; override;
//    function getName : NSString; message 'getName';
//    procedure setName(name : NSString); message 'setName:';
  end;


implementation

function PGNChessViewer.init : id;
begin
  Result := inherited init;
end;

procedure PGNChessViewer.dealloc;
begin
  inherited dealloc;
end;

procedure PGNChessViewer.makeWindowControllers;
var
  aPGNChessViewerController : PGNChessViewerController;
begin
  aPGNChessViewerController := PGNChessViewerController.alloc.init;
  addWindowController(aPGNChessViewerController);
end;

function PGNChessViewer.writeToURL_ofType_error(absoluteURL: NSURL; typeName: NSString; outError: NSErrorPointer): Boolean;
begin
end;

function PGNChessViewer.readFromURL_ofType_error(absoluteURL: NSURL; typeName: NSString; outError: NSErrorPointer): Boolean;
//var
//    control : PGNChessViewerController;
begin
    writeln(NSSTRToSTR(absoluteURL.absoluteString));
//control := PGNChessViewerController.alloc.init;
//control := self.windowControllers.objectAtIndex(0);
//control.Browser.setMainFrameURL(StrToNSSTR('http://google.com'));
    Result := true;
end;


end.

