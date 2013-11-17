//
//  ChopeDataUtil.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeDataUtil.h"

@implementation ChopeDataUtil

+ (BOOL)isNull:(id)object
{
    if (object == nil || object == NULL || [object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isNullString:(NSString *)string
{
    if ([ChopeDataUtil isNull:string]) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSString class]]) {
        if ([[string lowercaseString] isEqualToString:@"null"] || [[string lowercaseString] isEqualToString:@"nil"]) {
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)isEmptyString:(NSString *)string
{
    if ([ChopeDataUtil isNullString:string] || [ChopeDataUtil trim:string].length == 0) {
        return YES;
    }
    
    return NO;
}

+ (NSString*)trim:(NSString*)string
{
    if ([ChopeDataUtil isNullString:string]) {
        return nil;
    }
    
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
