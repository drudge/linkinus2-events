
#import "LKPluginInterfaceController.h"
#import "LKEventsPlugin+PreferencesExtensions.h"

@implementation LKPluginInterfaceController

/*
 * Designated initializer.
 * Loading the nib file here is generally a good idea.
 */

- (id)init
{
	if (self = [super init])
	{
		if (![NSBundle loadNibNamed:@"Pane" owner:self])
		{
			[self release];
			self = nil;
		}
	}
	
	return self;
}


/*
 * Return the name of the 32x32 icon that will represent
 * your plug-in in the Linkinus Preferences window.
 */
- (NSImage *)icon
{
	return nil;
}


/*
 * The main view displayed in the Linkinus preferences window.
 */
- (NSView *)view
{
	return preferencePaneView;
}


- (void)awakeFromNib
{
}

- (IBAction)statusChanged:(id)sender
{
	BOOL enabled = ([button state]==NSOnState);
	[matrix setEnabled:enabled];
	
	//NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[self preferences]];
	//[dict setObject:[NSNumber numberWithBool:enabled] forKey:LKSamplePluginEnabledKey];
	//[dict setObject:[NSNumber numberWithInt:[matrix selectedTag]] forKey:LKSamplePluginSelectedTagKey];
	//[self setPreferences:dict];
}

@end