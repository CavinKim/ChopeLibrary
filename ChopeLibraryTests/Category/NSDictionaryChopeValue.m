//
//  NSDictionaryChopeValue.m
//  CPApplication
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+ChopeValue.h"

@interface NSDictionaryChopeValue : XCTestCase

@property (nonatomic, retain) NSDictionary *testData;

@end

@implementation NSDictionaryChopeValue

- (void)setUp
{
    [super setUp];
    
    self.testData = @{@"A": @"B",
                      @"B": @123,
                      @"C": [NSNull null],
                      @"D": @1234.5678,
                      @"E": @1,
                      @"F": @0,
                      @"H": @"2014-01-05 19:37:00",
                      @"I": @"2014-01-05T19:37:00.123Z",
                      @"J": @"2014-01-05T19:37:00Z"
                      };
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testIntegerForKey
{
    XCTAssertEqual([self.testData integerForKey:@"A"], 0, @"");
    XCTAssertEqual([self.testData integerForKey:@"B"], 123, @"");
    XCTAssertEqual([self.testData integerForKey:@"C"], 0, @"");
    XCTAssertEqual([self.testData integerForKey:@"D"], 1234, @"");
    XCTAssertEqual([self.testData integerForKey:@"E"], 1, @"");
    XCTAssertEqual([self.testData integerForKey:@"F"], 0, @"");
    XCTAssertEqual([self.testData integerForKey:@"G"], 0, @"");
}

- (void)testDoubleForKey
{
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"A"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"B"], 123, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"C"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"D"], 1234.5678, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"E"], 1, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"F"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData doubleForKey:@"G"], 0, 0.001, @"");
}

- (void)testFloatForKey
{
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"A"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"B"], 123, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"C"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"D"], 1234.5678, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"E"], 1, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"F"], 0, 0.001, @"");
    XCTAssertEqualWithAccuracy([self.testData floatForKey:@"G"], 0, 0.001, @"");
}

- (void)testBoolForKey
{
    XCTAssertFalse([self.testData boolForKey:@"A"], @"");
    XCTAssertTrue([self.testData boolForKey:@"B"], @"");
    XCTAssertFalse([self.testData boolForKey:@"C"], @"");
    XCTAssertTrue([self.testData boolForKey:@"D"], @"");
    XCTAssertTrue([self.testData boolForKey:@"E"], @"");
    XCTAssertFalse([self.testData boolForKey:@"F"], @"");
    XCTAssertFalse([self.testData boolForKey:@"G"], @"");
}

- (void)testStringForKey
{
    XCTAssertEqualObjects([self.testData stringForKey:@"A"], @"B", @"");
    XCTAssertEqualObjects([self.testData stringForKey:@"B"], @"123", @"");
    XCTAssertNil([self.testData stringForKey:@"C"], @"");
    XCTAssertEqualObjects([self.testData stringForKey:@"D"], @"1234.5678", @"");
    XCTAssertEqualObjects([self.testData stringForKey:@"E"], @"1", @"");
    XCTAssertEqualObjects([self.testData stringForKey:@"F"], @"0", @"");
    XCTAssertNil([self.testData stringForKey:@"G"], @"");
}

- (void)testDateForKey
{
    XCTAssertNotNil([self.testData dateForKey:@"A"], @"");
    XCTAssertNil([self.testData dateForKey:@"B"], @"");
    XCTAssertNil([self.testData dateForKey:@"C"], @"");
    XCTAssertNil([self.testData dateForKey:@"D"], @"");
    XCTAssertNil([self.testData dateForKey:@"E"], @"");
    XCTAssertNil([self.testData dateForKey:@"F"], @"");
    XCTAssertNil([self.testData dateForKey:@"G"], @"");
    XCTAssertNotNil([self.testData dateForKey:@"H"], @"");
    XCTAssertNotNil([self.testData dateForKey:@"I"], @"");
    XCTAssertNotNil([self.testData dateForKey:@"J"], @"");
}

@end
