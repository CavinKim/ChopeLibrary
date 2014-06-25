//
//  NSObject+ChopeValue.m
//  CPApplication
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "NSObject+ChopeValue.h"

@implementation NSObject (ChopeValue)

- (BOOL)isNull {
    if ([self isKindOfClass:[NSString class]]) {
        NSString *value = [((NSString *) self) lowercaseString];
        return [value isEqualToString:@"null"] || [value isEqualToString:@"nil"];
    }
    return [self isKindOfClass:[NSNull class]];
}

@end
