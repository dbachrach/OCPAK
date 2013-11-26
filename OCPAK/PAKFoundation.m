//
//  PAKFoundation.m
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import "PAKFoundation.h"

@implementation NSEnumerator (OCPAK)

- (NSEnumerator*)pack
{
	return self;
}

@end

@implementation NSArray (OCPAK)

- (NSEnumerator*)pack
{
	return [self objectEnumerator];
}

@end

@implementation NSMutableArray (OCPAK)

- (void)unpack:(NSEnumerator *)enumerator
{
	[self removeAllObjects];
	
	id val = nil;
	while (val = [enumerator nextObject])
	{
		[self addObject:val];
	}
}

@end

@implementation NSOrderedSet (OCPAK)

- (NSEnumerator*)pack
{
	return [self objectEnumerator];
}

@end

@implementation NSMutableOrderedSet (OCPAK)

- (void)unpack:(NSEnumerator *)enumerator
{
	[self removeAllObjects];
	
	id val = nil;
	while (val = [enumerator nextObject])
	{
		[self addObject:val];
	}
}

@end

@implementation NSDictionary (OCPAK)

- (NSEnumerator*)pack
{
	return [self keyEnumerator];
}

@end

@implementation NSValue (OCPAK)

- (NSEnumerator*)pack
{
	if (strcmp(self.objCType, @encode(NSRange)) == 0)
	{
		NSRange range = self.rangeValue;
		return [@[@(range.location), @(range.length)] objectEnumerator];
	}
	else if (strcmp(self.objCType, @encode(CGSize)) == 0)
	{
		CGSize size = self.CGSizeValue;
		return [@[@(size.width), @(size.height)] objectEnumerator];
	}
	return nil;
}

@end

