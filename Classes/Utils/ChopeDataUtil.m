//
//  ChopeDataUtil.m
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 18..
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

@end
