//
//  NSString+Chope.m
//  CPApplication
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSString+Chope.h"
#import "NSObject+ChopeValue.h"

@implementation NSString (Chope)

- (BOOL)isEmpty {
    return [self isNull] || [self trim].length == 0;

}

- (NSString*)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
