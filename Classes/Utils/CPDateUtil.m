//
//  CPDateUtil.m
//  CPApplication
//
//  Created by Chope on 2014. 1. 4..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPDateUtil.h"

@implementation CPDateUtil

#pragma mark - Converter
+ (NSDate*)dateFromString:(NSString*)dateString format:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    return dateFromString;
}

+ (NSString*)stringWithDate:(NSDate*)date format:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}


#pragma mark RFC3339
+ (NSDate*)dateForRFC3339UTCString:(NSString*)dateString
{
    NSDate *date = [self dateFromString:dateString format:DATE_FORMAT_RFC3339_UTC];
    
    if (date == nil) {
        date = [self dateFromString:dateString format:DATE_FORMAT_RFC3339_UTC_SIMPLE];
    }
    
    return date;
}

+ (NSDate*)dateFromDefaultString:(NSString*)dateString
{
    return [CPDateUtil dateFromString:dateString format:DATE_FORMAT_DEFAULT];
}

@end
