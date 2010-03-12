//
//  LKEventsPlugin+PreferencesExtensions.h
//  Linkinus Events Plug-in
//
//  Created by Nicholas Penree on 3/11/10.
//  Copyright Conceited Software 2010. All rights reserved.
//

#import <Cocoa/Cocoa.h> 

extern NSString *LKEventsPluginEnabledKey;

@interface NSObject (LKEventsPlugin_PreferencesExtensions)

@property (assign) NSDictionary *preferences;
@property (readonly) NSString *preferencesPath;
@property (readonly) BOOL pluginEnabled;

@end
