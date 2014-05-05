//
//  ChopeThirdpartyLogin.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeThirdpartyAccount.h"
#import "ChopeFacebook.h"
#import "ChopeKakao.h"

@implementation ChopeThirdpartyUser

@end


@interface ChopeThirdpartyAccount ()

@property (nonatomic, retain) id<ChopeThirdpartyLoginDelegate> thirdpartyLoginDelegate;

@end


@implementation ChopeThirdpartyAccount

+ (instancetype)thirdpartyLogin:(ChopeThirdpartyLoginType)type {
    if (type == ChopeThirdpartyLoginTypeFacebook) {
        return [[ChopeFacebook alloc] init];
    }
    else if (type == ChopeThirdpartyLoginTypeKakao) {
        return [[ChopeKakao alloc] init];
    }
    
    return nil;
}

@end
