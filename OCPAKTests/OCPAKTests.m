//
//  OCPAKTests.m
//  OCPAKTests
//
//  Created by Dustin Bachrach on 11/25/13.
//  Copyright (c) 2013 Dustin Bachrach. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCPAK.h"

@interface OCPAKTests : XCTestCase

@end

@implementation OCPAKTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    id a = @1;
	id b = @2;
	
	NSLog(@"%@, %@", a, b);
	unpack (_(a, b) from _(b, a));
	XCTAssertEqualObjects(a, @(2), @"a swapped");
   	XCTAssertEqualObjects(b, @(1), @"b swapped");
	
	NSArray *array = @[@1, @2];
	NSMutableArray *array2 = [NSMutableArray array];
	unpack(array2 from [array reverseObjectEnumerator]);
	XCTAssertEqualObjects(array2[0], @(2), @"reversed element 1");
   	XCTAssertEqualObjects(array2[1], @(1), @"reversed element 2");
	
	id a1,a2,a3,a4,a5,a6,a7,a8,a9,a10;
	unpack (_(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10) from @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10]);
	NSLog(@"%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ ", a1,a2,a3,a4,a5,a6,a7,a8,a9,a10);
    XCTAssertEqualObjects(a1, @1, @"1");
    XCTAssertEqualObjects(a2, @2, @"2");
    XCTAssertEqualObjects(a3, @3, @"3");
    XCTAssertEqualObjects(a4, @4, @"4");
    XCTAssertEqualObjects(a5, @5, @"5");
    XCTAssertEqualObjects(a6, @6, @"6");
    XCTAssertEqualObjects(a7, @7, @"7");
    XCTAssertEqualObjects(a8, @8, @"8");
    XCTAssertEqualObjects(a9, @9, @"9");
    XCTAssertEqualObjects(a10, @10, @"10");
	
	CGSize size = CGSizeMake(20, 30);
	id width, height;
	unpack (_(width, height) from [NSValue valueWithCGSize:size]);
    XCTAssertEqualObjects(width, @(20), @"width");
    XCTAssertEqualObjects(height, @(30), @"height");
}

@end
