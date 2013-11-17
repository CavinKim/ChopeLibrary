//
//  ChopeDataUtil.h
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeDataUtil : NSObject

+ (BOOL)isNull:(id)object;
+ (BOOL)isNullString:(NSString *)string;
+ (BOOL)isEmptyString:(NSString *)string;
+ (NSString*)trim:(NSString*)string;

@end
