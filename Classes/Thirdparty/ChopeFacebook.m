//
//  ChopeFacebook.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <AFHTTPRequestOperationManager.h>
#import <FacebookSDK.h>
#import "ChopeFacebook.h"
#import "ChopeThirdpartyAccount.h"
#import "NSDictionary+ChopeValue.h"
#import "ChopeNetwork.h"

@implementation ChopeFacebook

+ (NSString*)thirdpartyName {
    return @"facebook";
}

- (BOOL)isOpened {
    return [[FBSession activeSession] isOpen];
}

- (void)openWithSuccess:(void(^)())success
                failure:(void(^)(NSError *error))failure {
    if ([self isOpened]) {
        success();
    }
    else {
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            if (error) {
                failure(error);
            }
            else {
                success();
            }
        }];
    }
}

- (void)closeWithSuccess:(void(^)())successCallback
                 failure:(void(^)(NSError *error))failure {
    [[FBSession activeSession] setStateChangeHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        NSLog(@"state : %d", status);
        
        if (error) {
            failure(error);
        }
        else if(status == FBSessionStateClosed) {
            successCallback();
        }
    }];
    [[FBSession activeSession] closeAndClearTokenInformation];
}

- (void)loadProfileWithSuccess:(void(^)(ChopeThirdpartyUser *user))success
                       failure:(void(^)(NSError *error))failure {
    if ([self isOpened]) {
        [FBRequestConnection startWithGraphPath:@"/me"
                                     parameters:nil
                                     HTTPMethod:@"GET"
                              completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                  if (error == nil) {
                                      NSDictionary *resultDic = (NSDictionary*) result;
                                      
                                      ChopeThirdpartyUser *user = [[ChopeThirdpartyUser alloc] init];
                                      user.userId = [NSString stringWithFormat:@"%@", [resultDic objectForKey:@"id"]];
                                      user.name = [resultDic stringForKey:@"name"];
                                      
                                      NSString *urlString = [NSString stringWithFormat:@"https://graph.facebook.com/me/picture?access_token=%@&type=%@",
                                                             [FBSession activeSession].accessTokenData,
                                                             @"large"];
                                      
                                      [ChopeNetwork downloadImageWithUrl:urlString
                                                                 success:^(UIImage *photoImage) {
                                                                     user.photoImage = photoImage;
                                                                     success(user);
                                                                 }
                                                                 failure:failure];
                                  }
                                  else {
                                      failure(error);
                                  }
                              }];
    }
    else {
        [self openWithSuccess:^{
            [self loadProfileWithSuccess:success
                                 failure:failure];
        } failure:failure];
    }
}

- (void)downloadImageWithUrl:(NSString*)urlString
                     success:(void(^)(UIImage *photoImage))success
                     failure:(void(^)(NSError *error))failure {
    if ([self isOpened]) {
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFImageResponseSerializer serializer];

        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            success(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failure(error);
        }];
        
        [operation start];
    }
    else {
        [self openWithSuccess:^{
            [self downloadImageWithUrl:urlString
                               success:success
                               failure:failure];
        } failure:failure];
    }
}

@end
