
#import <Cocoa/Cocoa.h>

@protocol LKPluginInterfaceControllerProtocol;

@interface LKPluginInterfaceController : NSObject <LKPluginInterfaceControllerProtocol>
{	
	IBOutlet NSButton *button;
	IBOutlet NSMatrix *matrix;
	IBOutlet NSView *preferencePaneView;
}

- (IBAction)statusChanged:(id)sender;

@end