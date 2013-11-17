//
//  ChopeDeviceUtil.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeDeviceUtil.h"

@implementation ChopeDeviceUtil

+ (CGSize)windowSize
{
    return [[UIScreen mainScreen] bounds].size;
}

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
