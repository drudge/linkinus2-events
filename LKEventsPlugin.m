//
//  LKEventsPlugin.m
//  Linkinus Events Plug-in
//
//  Created by Nicholas Penree on 3/11/10.
//  Copyright Conceited Software 2010. All rights reserved.
//

#import "LKEventsPlugin.h"
#import "LKEventsPlugin+PreferencesExtensions.h"

@interface FOConnection
@property(retain, nonatomic) NSString *description; 
@end

@implementation LKEventsPlugin

@synthesize events, agent;

- (id <LKPluginProtocol>)initWithAgent:(id <LKDatasource>)anAgent
{
	if (self = [super init])
	{
		self.agent = anAgent;
		
		NSMutableArray *hosts = [NSMutableArray arrayWithObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"drudge_", LKHostmaskKey, @"/mode $channel +o $nick", LKCommandKey, [NSNumber numberWithBool:YES], LKEnabledKey, @"#tracks", LKChannelKey, nil]];
		
		self.events = [NSMutableDictionary dictionaryWithObject:hosts forKey:LKJoinsKey];
		
		//NSLog(@"hosts = %@\nevents = %@", hosts, self.events);
		
		NSLog(@"[Events Plugin]");
	}
	
	return self;
}


- (id <LKConnectionProtocol>)connectionWithName:(NSString *)name
{
	for (id <LKConnectionProtocol> currentConnection in self.agent.connections) {
		if ([((FOConnection *)currentConnection).description isEqualToString:name])
			return currentConnection;
	}
	
	return nil;
}

#pragma mark -
#pragma mark Catch incoming data

- (void)incomingNick:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingJoin:(NSMutableDictionary *)infoDict
{ 	
	NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);

	for (id <LKChannelProtocol> channel in [infoDict objectForKey:LKChannelsKey]) {
		id <LKPersonProtocol> user = [channel personWithName:[infoDict objectForKey:LKNickKey]];
		
		NSString *hostmask = [user userhost];
		NSString *channelName = [channel name];
		
		NSLog(@"nick = %@\nmask = %@\nuser = %@", [[infoDict objectForKey:LKNickKey] class], hostmask, user);
		
		for (NSDictionary *event in (NSMutableArray *)[self.events objectForKey:LKJoinsKey]) {
			NSString *command = [[[event objectForKey:LKCommandKey] stringByReplacingOccurrencesOfString:@"$nick" withString:[infoDict objectForKey:LKNickKey]] stringByReplacingOccurrencesOfString:@"$channel" withString:channelName];

			if ([hostmask isEqualToString:[event objectForKey:LKHostmaskKey]] && [channelName isEqualToString:[event objectForKey:LKChannelKey]]) {
				[[channel connection] processCommand:command];
			}
		}
		
	}
		
	/*
	  [incomingJoin:] {
	 	    LKChannels =     (
	 	        "BD8D0D3E-CDCA-44BB-9AD1-C922F33D9CBF-483-000002540E1923FD"
	 	    );
	 	    LKConnection = "D92F2FF7-07A4-4432-A783-058A6A6498B1-7604-000065A78F025C78";
	 	    LKDescription = "";
	 	    LKNick = kaatje;
	 	    LKRaw = "Joined channel";
	 	}
	 */
	
	
}

- (void)incomingKick:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingNotice:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingPart:(NSMutableDictionary *)infoDict 
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingQuit:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingAction:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingMode:(NSMutableDictionary *)infoDict
{ 
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

- (void)incomingMessage:(NSMutableDictionary *)infoDict
{
	//NSLog (@"[%@] %@", NSStringFromSelector(_cmd), infoDict);
}

#pragma mark -
#pragma mark Catch outgoing data

- (void)outgoingAway:(NSMutableDictionary *)infoDict {}
- (void)outgoingMode:(NSMutableDictionary *)infoDict {}
- (void)outgoingBan:(NSMutableDictionary *)infoDict {}
- (void)outgoingJoin:(NSMutableDictionary *)infoDict {}
- (void)outgoingKick:(NSMutableDictionary *)infoDict {}
- (void)outgoingMessage:(NSMutableDictionary *)infoDict {}
- (void)outgoingNotice:(NSMutableDictionary *)infoDict {}
- (void)outgoingAction:(NSMutableDictionary *)infoDict {}
- (void)outgoingNick:(NSMutableDictionary *)infoDict {}
- (void)outgoingPart:(NSMutableDictionary *)infoDict {}
- (void)outgoingQuit:(NSMutableDictionary *)infoDict {}

#pragma mark -
#pragma mark Handle new commands

+ (NSArray *)availableCommands
{
	return [NSArray array];
}

- (void)handleCommand:(NSString *)line onConnection:(id <LKConnectionProtocol>)connection
{
	BOOL pluginEnabled = [self pluginEnabled];
	
	if (pluginEnabled) {}
}

@end