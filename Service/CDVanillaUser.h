//
//  CDVanillaUser.h
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDVanillaUser : NSObject <NSSecureCoding>

@property (copy) NSString *name;
@property (assign) NSUInteger identifier;

@end
