//
//  CPDeviceUtil.h
//  CPApplication
//
//  Created by Chope on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPDeviceUtil : NSObject

+ (NSString*)systemVersion;
+ (NSString*)currentCountryCode;
+ (NSString*)currentLanguageCode;

@end
