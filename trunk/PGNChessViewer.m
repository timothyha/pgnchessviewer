
#import "PGNChessViewer.h"
#import "PGNChessViewerController.h"

@implementation PGNChessViewer

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here. If an error occurs here, 
        //  send a [self release] message and return nil.
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)makeWindowControllers
{
    // Override and create window controller and add it to list of managed window controllers.
    PGNChessViewerController* aPGNChessViewerController;
    aPGNChessViewerController = [[PGNChessViewerController alloc] init ];
    [super addWindowController:aPGNChessViewerController];
}

- (BOOL)writeToURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to the specified file. If outError != NULL,
    //  ensure that you create and set an appropriate error when returning No.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return YES;
}

- (BOOL)readFromURL:(NSURL *)absoluteURL ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the specified file. If outError != NULL,
    //  ensure that you create and set an appropriate error when returning NO.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    return YES;    
}

@end

