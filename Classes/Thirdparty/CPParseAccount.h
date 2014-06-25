//
//  CPParseAccount.h
//  CPApplication
//
//  Created by Chope on 2014. 5. 7..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPThirdpartyAccount.h"

@interface CPParseAccount : NSObject

@property (nonatomic) ChopeThirdpartyLoginType loginType;

+ (void)login:(ChopeThirdpartyLoginType)loginType
      success:(void(^)(ChopeThirdpartyLoginType loginType))success
      failure:(void(^)(NSError *error))failure;

+ (CPParseAccount *)sharedManager;

@end
