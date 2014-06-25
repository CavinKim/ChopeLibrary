//
//  ChopeDeviceUtilTests.m
//  CPApplication
//
//  Created by Chope on 2013. 11. 15..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CPDeviceUtil.h"

@interface ChopeDeviceUtilTests : XCTestCase

@end

@implementation ChopeDeviceUtilTests

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

- (void)testCurrentCountryCode
{
    XCTAssertEqualObjects([[CPDeviceUtil currentCountryCode] uppercaseString], [CPDeviceUtil currentCountryCode], @"");
    XCTAssertNotEqualObjects([[CPDeviceUtil currentCountryCode] lowercaseString], [CPDeviceUtil currentCountryCode], @"");
}

- (void)testCurrentLanguageCode
{
    XCTAssertEqualObjects([[CPDeviceUtil currentLanguageCode] lowercaseString], [CPDeviceUtil currentLanguageCode], @"");
    XCTAssertNotEqualObjects([[CPDeviceUtil currentLanguageCode] uppercaseString], [CPDeviceUtil currentLanguageCode], @"");
}

@end
