//
//  ChopeDeviceUtilTests.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 11. 15..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChopeDeviceUtil.h"

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
    XCTAssertEqualObjects([[ChopeDeviceUtil currentCountryCode] uppercaseString], [ChopeDeviceUtil currentCountryCode], @"");
    XCTAssertNotEqualObjects([[ChopeDeviceUtil currentCountryCode] lowercaseString], [ChopeDeviceUtil currentCountryCode], @"");
}

- (void)testCurrentLanguageCode
{
    XCTAssertEqualObjects([[ChopeDeviceUtil currentLanguageCode] lowercaseString], [ChopeDeviceUtil currentLanguageCode], @"");
    XCTAssertNotEqualObjects([[ChopeDeviceUtil currentLanguageCode] uppercaseString], [ChopeDeviceUtil currentLanguageCode], @"");
}

@end
