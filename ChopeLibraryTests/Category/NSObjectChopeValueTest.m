//
//  NSObjectChopeValueTest.m
//  CPApplication
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+ChopeValue.h"

@interface NSObjectChopeValueTest : XCTestCase

@end

@implementation NSObjectChopeValueTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testNull
{
    XCTAssertTrue([[NSNull null] isNull], @"");
    XCTAssertFalse([@"AB" isNull], @"");
}

@end
