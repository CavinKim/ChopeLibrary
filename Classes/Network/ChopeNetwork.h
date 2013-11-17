//
//  ChopeNetwork.h
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CHOPE_NETWORK_METHOD_POST @"post";
#define CHOPE_NETWORK_METHOD_GET @"get";

@interface ChopeNetwork : NSObject

@property (nonatomic, retain) NSString *host;
@property (nonatomic, retain) NSString *path;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, retain) NSString *method;

- (id)initWithHost:(NSString*)host
              path:(NSString*)path;

- (BOOL)isSuccessFromResponse:(NSDictionary*)response;
- (NSDictionary*)dataFromResponse:(NSDictionary*)response;
- (NSInteger)resultCodeFromResponse:(NSDictionary*)response;
- (NSString*)resultMessageFromResponse:(NSDictionary*)response;

- (void)post:(NSDictionary*)parameters
     success:(void(^)(ChopeNetwork *network, NSDictionary *data))successBlock
     failure:(void(^)(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage))failureBlock
       error:(void(^)(ChopeNetwork *network, NSError *error))errorBlock;

- (void)get:(NSDictionary*)parameters
    success:(void(^)(ChopeNetwork *network, NSDictionary *data))successBlock
    failure:(void(^)(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage))failureBlock
      error:(void(^)(ChopeNetwork *network, NSError *error))errorBlock;

@end
