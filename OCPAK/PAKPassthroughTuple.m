//
//  PAKPassthroughTuple.m
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import "PAKPassthroughTuple.h"

@interface PAKPassthroughTuple ()

- (id)initWithValue:(__strong id*)firstObj arguments:(va_list)args;

@end

@implementation PAKPassthroughTuple

+ (instancetype)tupleWithValues:(__strong id*)firstObj, ... NS_REQUIRES_NIL_TERMINATION
{
	va_list args;
	va_start(args, firstObj);
	PAKPassthroughTuple* t = [[PAKPassthroughTuple alloc] initWithValue:firstObj arguments:args];
	return t;
}

- (id)initWithValue:(__strong id*)firstObj arguments:(va_list)args
{
	[NSArray arrayWithObjects:nil];
	if (self = [super init])
	{
		NSMutableArray* values = [NSMutableArray array];
		__strong id* value = firstObj;
		while (value)
		{
			[values addObject:[NSValue valueWithPointer:value]];
			value = va_arg(args, __strong id*);
		}
		
		_values = values;
	}
	return self;
}

- (id)initWithValues:(__strong id*)firstObj, ... NS_REQUIRES_NIL_TERMINATION
{
	[NSArray arrayWithObjects:nil];
	if (self = [super init])
	{
		NSMutableArray* values = [NSMutableArray array];
		va_list args;
		va_start(args, firstObj);
		__strong id* value = firstObj;
		while (value)
		{
			[values addObject:[NSValue valueWithPointer:value]];
			value = va_arg(args, __strong id*);
		}
		
		_values = values;
	}
	return self;
}

#pragma mark - PAKArgPacker
- (NSEnumerator*)pack
{
	NSMutableArray* packedValues = [NSMutableArray arrayWithCapacity:_values.count];
	for (NSValue* value in _values)
	{
		__strong id* ptr = (__strong id*) [value pointerValue];
		[packedValues addObject:[*ptr copy]];
	}
	return [packedValues objectEnumerator];
}

#pragma mark - PAKArgUnpacker
- (void)unpack:(NSEnumerator*)enumerator
{
	for (NSValue* value in _values)
	{
		__strong id* ptr = (__strong id*) [value pointerValue];
		*ptr = [enumerator nextObject];
	}
}

@end
