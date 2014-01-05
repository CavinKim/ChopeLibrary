//
//  ChopeDeviceUtil.m
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeDeviceUtil.h"

@implementation ChopeDeviceUtil

+ (NSString*)systemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString*)currentCountryCode
{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];;
}

+ (NSString*)currentLanguageCode
{
    return [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
}

@end
