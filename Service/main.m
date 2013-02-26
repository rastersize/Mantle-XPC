//
//  main.m
//  Service
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#include <Foundation/Foundation.h>
#import "CDUser.h"
#import "CDVanillaUser.h"
#import "CDUserCreator.h"

#pragma mark
@interface CDServiceListenerDelegate : NSObject <NSXPCListenerDelegate, CDUserCreator>
@end

@implementation CDServiceListenerDelegate



#pragma mark -
- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection
{
	newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(CDUserCreator)];
	newConnection.exportedObject = self;
	[newConnection resume];
	return YES;
}

#pragma mark - 
- (void)userWithName:(NSString *)name identifier:(NSUInteger)identifier reply:(void (^)(CDUser *))reply
{
	CDUser *user = CDUser.new;
	user.name = name;
	user.identifier = identifier;
	
	reply(user);
}

- (void)vanillaUserWithName:(NSString *)name identifier:(NSUInteger)identifier reply:(void (^)(CDVanillaUser *))reply
{
	CDVanillaUser *user = CDVanillaUser.new;
	user.name = name;
	user.identifier = identifier;
	
	reply(user);
}

@end



#pragma mark -
int main(int argc, const char *argv[])
{
	NSXPCListener *listener = NSXPCListener.serviceListener;
	CDServiceListenerDelegate *delegate = CDServiceListenerDelegate.new;
	listener.delegate = delegate;
	[listener resume];
	
	return 0;
}
