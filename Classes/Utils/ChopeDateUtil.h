//
//  ChopeDateUtil.h
//  ChopeLibrary
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATE_FORMAT_RFC3339_UTC @"yyyy-MM-dd'T'HH:mm:ss.SSSZ"
#define DATE_FORMAT_RFC3339_UTC_SIMPLE @"yyyy-MM-dd'T'HH:mm:ssZ"
#define DATE_FORMAT_DEFAULT @"yyyy-MM-dd HH:mm:ss"

@interface ChopeDateUtil : NSObject

+ (NSDate*)dateFromString:(NSString*)dateString format:(NSString*)format;
+ (NSString*)stringWithDate:(NSDate*)date format:(NSString*)format;

+ (NSDate*)dateForRFC3339UTCString:(NSString*)dateString;
+ (NSDate*)dateFromDefaultString:(NSString*)dateString;

@end
