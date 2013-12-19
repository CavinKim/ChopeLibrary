//
//  ChopeDataUtilTests.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 11. 15..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChopeDataUtil.h"

@interface ChopeDataUtilTests : XCTestCase

@end

@implementation ChopeDataUtilTests

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

- (void)testIsNull_resultTrue
{
    XCTAssertTrue([ChopeDataUtil isNull:nil], @"");
    XCTAssertTrue([ChopeDataUtil isNull:NULL], @"");
    XCTAssertTrue([ChopeDataUtil isNull:0], @"");
    XCTAssertTrue([ChopeDataUtil isNull:[NSNull null]], @"");
}

- (void)testIsNull_resultFalse
{
    XCTAssertFalse([ChopeDataUtil isNull:@""], @"");
    XCTAssertFalse([ChopeDataUtil isNull:@"abc"], @"");
    XCTAssertFalse([ChopeDataUtil isNull:@1], @"");
    XCTAssertFalse([ChopeDataUtil isNull:@{}], @"");
    XCTAssertFalse([ChopeDataUtil isNull:@[]], @"");
    XCTAssertFalse([ChopeDataUtil isNull:[[UIView alloc] init]], @"");
}

- (void)testIsNullString_resultTrue
{
    XCTAssertTrue([ChopeDataUtil isNullString:@"nil"], @"");
    XCTAssertTrue([ChopeDataUtil isNullString:@"NIL"], @"");
    XCTAssertTrue([ChopeDataUtil isNullString:@"null"], @"");
    XCTAssertTrue([ChopeDataUtil isNullString:@"NULL"], @"");
}

- (void)testIsNullString_resultFalse
{
    XCTAssertFalse([ChopeDataUtil isNullString:@""], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:@"   "], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:@"A"], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:(NSString*)@1], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:(NSString*)@{}], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:(NSString*)@[]], @"");
    XCTAssertFalse([ChopeDataUtil isNullString:(NSString*)[[UIView alloc] init]], @"");
}

- (void)testIsEmptyString_resultTrue
{
    XCTAssertTrue([ChopeDataUtil isEmptyString:@""], @"");
    XCTAssertTrue([ChopeDataUtil isEmptyString:@" "], @"");
    XCTAssertTrue([ChopeDataUtil isEmptyString:@"   "], @"");
}

- (void)testIsEmptyString_resultFalse
{
    XCTAssertFalse([ChopeDataUtil isEmptyString:@"A"], @"");
    XCTAssertFalse([ChopeDataUtil isEmptyString:@"   B   "], @"");
}

@end
