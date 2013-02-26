//
//  CDUserCreator.h
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDUser;
@class CDVanillaUser;

@protocol CDUserCreator <NSObject>

- (void)userWithName:(NSString *)name identifier:(NSUInteger)identifier reply:(void (^)(CDUser *))reply;

- (void)vanillaUserWithName:(NSString *)name identifier:(NSUInteger)identifier reply:(void (^)(CDVanillaUser *))reply;


@end
