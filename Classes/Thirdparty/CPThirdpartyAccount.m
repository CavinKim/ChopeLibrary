//
//  ChopeThirdpartyLogin.m
//  CPApplication
//
//  Created by Chope on 2014. 5. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPThirdpartyAccount.h"
#import "CPFacebook.h"
#import "CPKakao.h"

@implementation ChopeThirdpartyUser

@end


@interface CPThirdpartyAccount ()

@property (nonatomic, retain) id<ChopeThirdpartyLoginDelegate> thirdpartyLoginDelegate;

@end


@implementation CPThirdpartyAccount

+ (instancetype)thirdpartyLogin:(ChopeThirdpartyLoginType)type {
    if (type == ChopeThirdpartyLoginTypeFacebook) {
        return [[CPFacebook alloc] init];
    }
    else if (type == ChopeThirdpartyLoginTypeKakao) {
        return [[CPKakao alloc] init];
    }
    
    return nil;
}

+ (NSString*)thirdpartyName {
    return nil;
}

@end
