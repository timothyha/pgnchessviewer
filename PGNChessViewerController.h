
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface PGNChessViewerController : NSWindowController {
@private
// Drag a control's New Referencing Outlet here to add an IBOutlet,
//  then declare the control in your Pascal window controller class
//  using the same name and type.
// Example Pascal declaration:
//   button : NSButton;
    
    IBOutlet WebView *Browser;
}
// Drag a control's Sent Action here to add an IBAction, then add
//  the method to your Pascal window controller class.
// Example Pascal declaration:
//   procedure buttonClick(sender : id); message 'buttonClick:';
// Example Pascal implementation:
//   procedure MyWindowController.buttonClick(sender : id);

@end

