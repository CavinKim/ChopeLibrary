//
//  NSDictionary+ChopeData.m
//  LibrarySeat
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSDictionary+ChopeData.h"
#import "ChopeDataUtil.h"

@implementation NSDictionary (ChopeData)

- (NSInteger)integerForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return -1;
    }
    
    return [value integerValue];
}

- (double)doubleForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return -DBL_MIN;
    }
    
    return [value doubleValue];
}

- (float)floatForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return -FLT_MIN;
    }
    
    return [value floatValue];
}

- (BOOL)booleanForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return false;
    }
    
    return [value boolValue];
}

- (NSString*)stringForKey:(NSString*)key
{
    id value = [self objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [number stringValue];
    }
    
    return value;
}

@end
