//
//  ChopeApplicationUtil.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 2013. 11. 15..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeApplicationUtil.h"

@implementation ChopeApplicationUtil

+ (NSString*)applicationVersion
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
}

+ (NSString*)applicationShortVersion
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

@end
