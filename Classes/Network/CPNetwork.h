//
//  CPNetwork.h
//  CPApplication
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperationManager.h>


@interface CPNetwork : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;

- (id)initWithHost:(NSString*)host;

- (BOOL)isSuccessFromResponse:(NSDictionary*)response;
- (NSDictionary*)dataFromResponse:(NSDictionary*)response;
- (NSInteger)resultCodeFromResponse:(NSDictionary*)response;
- (NSString*)resultMessageFromResponse:(NSDictionary*)response;

- (void)post:(NSString*)path
  parameters:(NSDictionary*)parameters
     success:(void(^)(NSDictionary *data))successBlock
       error:(void(^)(NSError *error))errorBlock;

- (void)get:(NSString*)path
 parameters:(NSDictionary*)parameters
    success:(void(^)(NSDictionary *data))successBlock
      error:(void(^)(NSError *error))errorBlock;

+ (void)downloadImageWithUrl:(NSString*)urlString
                     success:(void(^)(UIImage *photoImage))success
                     failure:(void(^)(NSError *error))failure;

@end
