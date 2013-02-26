//
//  CDVanillaUser.m
//  Mantle XPC
//
//  Created by Aron Cedercrantz on 26-02-2013.
//  Copyright (c) 2013 Aron Cedercrantz. All rights reserved.
//

#import "CDVanillaUser.h"

@implementation CDVanillaUser

+ (BOOL)supportsSecureCoding
{
	return YES;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [self init];
	if (self) {
		_name = [[aDecoder decodeObjectOfClass:NSString.class forKey:@"name"] copy];
		_identifier = [[aDecoder decodeObjectOfClass:NSNumber.class forKey:@"identifier"] unsignedIntegerValue];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:_name forKey:@"name"];
	[aCoder encodeObject:@(_identifier) forKey:@"identifier"];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p { name: %@, identifier: %ld }>", self.class, self, self.name, (unsigned long)self.identifier];
}

@end
