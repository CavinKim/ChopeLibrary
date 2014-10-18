//
//  NSDictionary+ChopeValue.m
//  CPApplication
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSDictionary+ChopeValue.h"
#import "NSObject+ChopeValue.h"
#import "CPDateUtil.h"

@implementation NSDictionary (ChopeValue)

- (bool)isNull:(NSString *)value {
    return !value || [value isNull];
}

- (NSInteger)integerForKey:(NSString*)key {
    id value = self[key];
    
    if ([self isNull:value]) {
        return 0;
    }
    
    return [value integerValue];
}

- (NSUInteger)unsignedIntegerForKey:(NSString*)key {
    id value = self[key];

    if ([self isNull:value]) {
        return 0;
    }

    return [value unsignedIntegerValue];
}

- (long long int)longLongForKey:(NSString *)key {
    id value = self[key];

    if ([self isNull:value]) {
        return 0;
    }

    return [value longLongValue];
}

- (double)doubleForKey:(NSString*)key {
    id value = self[key];
    
    if ([self isNull:value]) {
        return 0.0;
    }
    
    return [value doubleValue];
}

- (float)floatForKey:(NSString*)key {
    id value = self[key];
    
    if ([self isNull:value]) {
        return 0.0;
    }
    
    return [value floatValue];
}

- (BOOL)boolForKey:(NSString*)key {
    id value = self[key];

    if ([self isNull:value]) {
        return false;
    }
    
    return [value boolValue];
}

- (NSString*)stringForKey:(NSString*)key {
    id value = self[key];

    if ([self isNull:value]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [number stringValue];
    }
    
    return value;
}

- (NSDate*)dateForKey:(NSString*)key {
    id value = self[key];
    
    if ([self isNull:value] || ![value isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSDate *date = [CPDateUtil dateFromDefaultString:value];
    
    if (!date) {
        date = [CPDateUtil dateForRFC3339UTCString:value];
    }
    
    return date;
}

@end
