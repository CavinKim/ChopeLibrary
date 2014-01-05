//
//  NSObject+ChopeValue.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "NSObject+ChopeValue.h"

@implementation NSObject (ChopeValue)

- (BOOL)isNull
{
    return [self isKindOfClass:[NSNull class]];
}

@end
