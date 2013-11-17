//
//  ChopeDeviceUtil.h
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeDeviceUtil : NSObject

+ (CGSize)windowSize;

+ (NSString*)systemVersion;
+ (NSString*)currentCountryCode;
+ (NSString*)currentLanguageCode;

@end
