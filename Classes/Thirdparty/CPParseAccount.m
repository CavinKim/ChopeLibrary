//
//  CPParseAccount.m
//  CPApplication
//
//  Created by Chope on 2014. 5. 7..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Parse/PFUser.h>
#import <Parse/PFFile.h>
#import "CPParseAccount.h"

@implementation CPParseAccount

+ (void)login:(ChopeThirdpartyLoginType)loginType
      success:(void(^)(ChopeThirdpartyLoginType loginType))success
      failure:(void(^)(NSError *error))failure {
    CPThirdpartyAccount *thirdpartyAccount = [CPThirdpartyAccount thirdpartyLogin:loginType];
    
    [thirdpartyAccount openWithSuccess:^{
        [thirdpartyAccount loadProfileWithSuccess:^(ChopeThirdpartyUser *user) {
            PFUser *parseUser = [PFUser user];
            parseUser.username = [NSString stringWithFormat:@"%@_%@", [[thirdpartyAccount class] thirdpartyName], user.userId];
            parseUser.password = user.userId;
            parseUser[@"nickname"] = user.name;
            
            if (user.photoImage) {
                parseUser[@"photo"] = [PFFile fileWithName:@"photo.jpg"
                                                      data:UIImageJPEGRepresentation(user.photoImage, 1.0)];
            }
            
            [self signupUsingParse:parseUser
                          complete:^(BOOL succeeded) {
                              [CPParseAccount sharedManager].loginType = loginType;
                              success(loginType);
                          }
                           failure:^(NSError *error) {
                               failure(error);
                           }];
        } failure:^(NSError *error) {
            failure(error);
        }];
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)loginUsingParse:(PFUser *)user
                success:(void(^)())success
                failure:(void(^)(NSError *error))failure {
    [PFUser logInWithUsernameInBackground:user.username
                                 password:user.password 
                                    block:^(PFUser *user, NSError *error) {
                                        if (error) {
                                            failure(error);
                                        }
                                        else {
                                            success();
                                        }
                                    }];
}

+ (void)signupUsingParse:(PFUser*)user
                complete:(void(^)(BOOL succeeded))complete
                 failure:(void(^)(NSError *error))failure {
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            if (error.code == kPFErrorUsernameTaken) {
                [self loginUsingParse:user
                              success:^{
                                  complete(succeeded);
                              }
                              failure:^(NSError *error) {
                                  failure(error);
                              }];
            }
            else {
                failure(error);
            }
        }
        else {
            if (succeeded) {
                [self loginUsingParse:user
                              success:^{
                                  complete(succeeded);
                              }
                              failure:^(NSError *error) {
                                  failure(error);
                              }];
            }
            else {
                complete(succeeded);
            }
        }
    }];
}

+ (CPParseAccount *)sharedManager {
    static CPParseAccount *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
