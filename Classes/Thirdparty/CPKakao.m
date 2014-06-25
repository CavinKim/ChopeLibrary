//
//  CPKakao.m
//  CPApplication
//
//  Created by Chope on 2014. 5. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <KakaoOpenSDK/KakaoOpenSDK.h>
#import "CPKakao.h"
#import "CPNetwork.h"
#import "NSString+Chope.h"
#import "NSObject+ChopeValue.h"

@implementation CPKakao

+ (NSString*)thirdpartyName {
    return @"kakao";
}

- (BOOL)isOpened {
    return [[KOSession sharedSession] isOpen];
}

- (void)openWithSuccess:(void(^)())success
                failure:(void(^)(NSError *error))failure {
    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        if ([[KOSession sharedSession] isOpen]) {
            success();
        }
        else {
            failure(error);
        }
    }];
}

- (void)closeWithSuccess:(void(^)())successCallback
                 failure:(void(^)(NSError *error))failure {
    if ([self isOpened]) {
        successCallback();
    }
    else {
        [[KOSession sharedSession] logoutAndCloseWithCompletionHandler:^(BOOL success, NSError *error) {
            if (error) {
                failure(error);
            }
            else if (success) {
                successCallback();
            }
        }];
    }
}

- (void)loadProfileWithSuccess:(void(^)(ChopeThirdpartyUser *user))success
                       failure:(void(^)(NSError *error))failure {
    if ([self isOpened]) {
        [KOSessionTask meTaskWithCompletionHandler:^(KOUser* result, NSError *error) {
            if (result) {
                NSLog(@"userId=%@", result.ID);
                NSLog(@"nickName=%@", [result propertyForKey:@"nickname"]);
                NSLog(@"%@", result);
                
                ChopeThirdpartyUser *thirdpartyUser = [[ChopeThirdpartyUser alloc] init];
                thirdpartyUser.userId = [result.ID stringValue];
                thirdpartyUser.name = [result propertyForKey:@"nickname"];
                
                NSString *profileImageUrl = [result propertyForKey:@"profile_image"];
                
                if (![profileImageUrl isNull]) {
                    [CPNetwork downloadImageWithUrl:profileImageUrl
                                            success:^(UIImage *photoImage) {
                        thirdpartyUser.photoImage = photoImage;
                        success(thirdpartyUser);
                    }
                                            failure:failure];
                }
                else {
                    success(thirdpartyUser);
                }
            }
            else {
                failure(error);
            }
        }];
    }
    else {
        [self openWithSuccess:^{
            [self loadProfileWithSuccess:success failure:failure];
        } failure:failure];
    }
}

@end
