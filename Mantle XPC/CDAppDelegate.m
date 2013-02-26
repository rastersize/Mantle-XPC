//
//  CDAppDelegate.m
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import "CDAppDelegate.h"
#import "CDUserCreator.h"
#import "CDUser.h"


@implementation CDAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSXPCConnection *xpcConnection = [[NSXPCConnection alloc] initWithServiceName:@"com.cedercrantz.Mantle-XCP.Service"];
	xpcConnection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(CDUserCreator)];
	
	[xpcConnection resume];
	
	id<CDUserCreator> userCreator = [xpcConnection remoteObjectProxyWithErrorHandler:^(NSError *error) {
		NSLog(@"Darn an error occurred: %@", error);
	}];
	
	/*[userCreator vanillaUserWithName:@"Aron Cedercrantz" identifier:30123 reply:^(CDVanillaUser *user) {
		NSLog(@"Created a vanilla user on a XPC service: %@", user);
		[xpcConnection invalidate];
	}];*/
	
	[userCreator userWithName:@"Aron Cedercrantz" identifier:30123 reply:^(CDUser *user) {
		NSLog(@"Created a user on a XPC service: %@", user);
		[xpcConnection invalidate];
	}];
}

@end
