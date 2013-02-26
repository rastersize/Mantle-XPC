//
//  CDUser.m
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import "CDUser.h"

@implementation CDUser

+ (BOOL)supportsSecureCoding
{
	return YES;
}

/* Workaround:
- (id)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
	[super encodeWithCoder:coder];
}
*/

@end
