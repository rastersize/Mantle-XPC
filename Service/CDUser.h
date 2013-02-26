//
//  CDUser.h
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface CDUser : MTLModel <NSSecureCoding>

@property (copy) NSString *name;
@property (assign) NSUInteger identifier;

@end