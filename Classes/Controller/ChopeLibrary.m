//
//  ChopeLibrary.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 2. 25..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeLibrary.h"

@implementation ChopeLibrary

+ (instancetype)SharedInstance
{
    static ChopeLibrary *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (UIWindow*)window
{
    return [UIApplication sharedApplication].windows.firstObject;
}

@end
