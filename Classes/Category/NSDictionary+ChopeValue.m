//
//  NSDictionary+ChopeValue.m
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSDictionary+ChopeValue.h"
#import "NSObject+ChopeValue.h"
#import "ChopeDateUtil.h"

@implementation NSDictionary (ChopeValue)

- (NSInteger)integerForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull]) {
        return 0;
    }
    
    return [value integerValue];
}

- (double)doubleForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull]) {
        return 0.0;
    }
    
    return [value doubleValue];
}

- (float)floatForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull]) {
        return 0.0;
    }
    
    return [value floatValue];
}

- (BOOL)boolForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull]) {
        return false;
    }
    
    return [value boolValue];
}

- (NSString*)stringForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [number stringValue];
    }
    
    return value;
}

- (NSDate*)dateForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if (!value || [value isNull] || ![value isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSDate *date = [ChopeDateUtil dateFromDefaultString:value];
    
    if (!date) {
        date = [ChopeDateUtil dateForRFC3339UTCString:value];
    }
    
    return value;
}

@end
