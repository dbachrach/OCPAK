//
//  PAKPassthroughTuple.h
//  testunpacking
//
//  Created by DUSTIN on 10/24/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAKProtocols.h"

@interface PAKPassthroughTuple : NSObject <PAKSeqPacker, PAKSeqUnpacker>
{
	NSArray* _values;
}
+ (instancetype)tupleWithValues:(__strong id*)firstObj, ... NS_REQUIRES_NIL_TERMINATION;

- (id)initWithValues:(__strong id*)firstObj, ... NS_REQUIRES_NIL_TERMINATION;

@end

#define PT_1(a) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, nil]
#define PT_2(a, b) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, nil]
#define PT_3(a, b, c) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, nil]
#define PT_4(a, b, c, d) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, nil]
#define PT_5(a, b, c, d, e) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, nil]
#define PT_6(a, b, c, d, e, f) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, (__strong id* )&f, nil]
#define PT_7(a, b, c, d, e, f, g) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, (__strong id* )&f, (__strong id* )&g, nil]
#define PT_8(a, b, c, d, e, f, g, h) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, (__strong id* )&f, (__strong id* )&g, (__strong id* )&h, nil]
#define PT_9(a, b, c, d, e, f, g, h, i) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, (__strong id* )&f, (__strong id* )&g, (__strong id* )&h, (__strong id* )&i, nil]
#define PT_10(a, b, c, d, e, f, g, h, i, j) [PAKPassthroughTuple tupleWithValues:(__strong id* )&a, (__strong id* )&b, (__strong id* )&c, (__strong id* )&d, (__strong id* )&e, (__strong id* )&f, (__strong id* )&g, (__strong id* )&h, (__strong id* )&i, (__strong id* )&j, nil]
#define GET_PT_MACRO(_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, NAME, ...) NAME
#define _(...) GET_PT_MACRO(__VA_ARGS__, PT_10, PT_9, PT_8, PT_7, PT_6, PT_5, PT_4, PT_3, PT_2, PT_1)(__VA_ARGS__)
