//
//  NSDictionary+ChopeValue.h
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ChopeValue)

- (NSInteger)integerForKey:(NSString*)key;
- (double)doubleForKey:(NSString*)key;
- (float)floatForKey:(NSString*)key;
- (BOOL)boolForKey:(NSString*)key;
- (NSString*)stringForKey:(NSString*)key;
- (NSDate*)dateForKey:(NSString*)key;

@end