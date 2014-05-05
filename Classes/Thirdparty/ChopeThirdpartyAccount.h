//
//  ChopeThirdpartyAccount.h
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeThirdpartyUser : NSObject

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) UIImage *photoImage;

@end


@protocol ChopeThirdpartyLoginDelegate <NSObject>


@optional
- (BOOL)isOpened;
- (void)openWithSuccess:(void(^)())success
                failure:(void(^)(NSError *error))failure;
- (void)closeWithSuccess:(void(^)())successCallback
                 failure:(void(^)(NSError *error))failure;
- (void)loadProfileWithSuccess:(void(^)(ChopeThirdpartyUser *user))success
                       failure:(void(^)(NSError *error))failure;

@end


typedef enum : NSUInteger {
    ChopeThirdpartyLoginTypeFacebook,
    ChopeThirdpartyLoginTypeKakao
} ChopeThirdpartyLoginType;


@interface ChopeThirdpartyAccount : NSObject <ChopeThirdpartyLoginDelegate>

+ (instancetype)thirdpartyLogin:(ChopeThirdpartyLoginType)type;

@end
