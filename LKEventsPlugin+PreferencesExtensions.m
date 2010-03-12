//
//  LKEventsPlugin+PreferencesExtensions.m
//  Linkinus Events Plug-in
//
//  Created by Nicholas Penree on 3/11/10.
//  Copyright Conceited Software 2010. All rights reserved.
//

#import "LKEventsPlugin+PreferencesExtensions.h"

NSString *LKEventsPluginEnabledKey = @"LKEventsPluginEnabled";

@implementation NSObject (LKEventsPlugin_PreferencesExtensions)

- (NSDictionary *)preferences
{
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self preferencesPath]])
	{
		[self setPreferences:[NSDictionary dictionary]];
	}
	
	return [NSDictionary dictionaryWithContentsOfFile:[self preferencesPath]];
}

- (void)setPreferences:(NSDictionary *)dictionary
{
	[dictionary writeToFile:[self preferencesPath] atomically:YES];
}

- (NSString *)preferencesPath
{
	return [[NSString stringWithFormat:@"~/Library/Preferences/%@.plist", [[NSBundle bundleForClass:[self class]] bundleIdentifier]] stringByExpandingTildeInPath];
}

- (BOOL)pluginEnabled
{
	return [[self.preferences objectForKey:LKEventsPluginEnabledKey] boolValue];
}

@end