//
//  ChopeDateUtilTest.m
//  CPApplication
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CPDateUtil.h"

@interface ChopeDateUtilTest : XCTestCase

@end

@implementation ChopeDateUtilTest

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

//+ (NSDate*)dateFromString:(NSString*)dateString format:(NSString*)format;
//+ (NSString*)stringWithDate:(NSDate*)date format:(NSString*)format;

- (void)testDateFromString
{
    XCTAssertNil([CPDateUtil dateFromString:@"123456A" format:DATE_FORMAT_DEFAULT], @"");
    XCTAssertNotNil([CPDateUtil dateFromString:@"2014-01-04 21:35:00" format:DATE_FORMAT_DEFAULT], @"");
}

- (void)testStringWithDate
{
    NSString *date = [CPDateUtil stringWithDate:[NSDate date] format:DATE_FORMAT_DEFAULT];

    XCTAssertNotNil(date, @"");
    XCTAssertEqual(date.length, (NSUInteger)19, @"");
}

@end
