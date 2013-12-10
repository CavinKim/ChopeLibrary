//
//  NSString+Chope.m
//  LibrarySeat
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSString+Chope.h"
#import "ChopeDataUtil.h"

@implementation NSString (Chope)

- (BOOL)isNull
{
    if ([ChopeDataUtil isNull:self]) {
        return YES;
    }

    if ([[self lowercaseString] isEqualToString:@"null"] ||
        [[self lowercaseString] isEqualToString:@"nil"]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isEmpty
{
    if ([self isNull] || [self trim].length == 0) {
        return YES;
    }
    
    return NO;
}

- (NSString*)trim
{
    if ([self isNull]) {
        return nil;
    }
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
