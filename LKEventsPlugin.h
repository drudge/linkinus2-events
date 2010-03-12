//
//  LKEventsPlugin.h
//  Linkinus Events Plug-in
//
//  Created by Nicholas Penree on 3/11/10.
//  Copyright Conceited Software 2010. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LKPluginProtocol.h"

#define LKJoinsKey @"JOIN"
#define LKModesKey @"MODE"
#define LKPartsKey @"PART"
#define LKQuitsKey @"QUIT"
#define LKKicksKey @"KICK"

#define LKHostmaskKey @"LKEventHostmask"
#define LKCommandKey @"LKEventCommand"
#define LKEnabledKey @"LKEventEnabled"
#define LKChannelKey @"LKEventChannel"

@protocol LKPluginProtocol, LKDatasource;

@interface LKEventsPlugin : NSObject <LKPluginProtocol>
{
	id <LKDatasource> agent;
	
	NSMutableDictionary *events;
}

@property (assign) id <LKDatasource> agent;
@property (retain,nonatomic) NSMutableDictionary *events;

@end