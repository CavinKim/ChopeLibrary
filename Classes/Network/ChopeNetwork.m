//
//  ChopeNetwork.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeNetwork.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"

@implementation ChopeNetwork

- (id)initWithHost:(NSString*)host
              path:(NSString*)path
{
    self = [super init];
    if (self) {
        self.host = host;
        self.path = path;
    }
    return self;
}

- (NSString*)fullUrlString
{
    return [NSString stringWithFormat:@"%@/%@", self.host, self.path];
}

- (void)requestWithSuccess:(void(^)(ChopeNetwork *network, NSDictionary *data))successBlock
                   failure:(void(^)(ChopeNetwork *network, NSUInteger code, NSString *message))failureBlock
                     error:(void(^)(ChopeNetwork *network, NSError *error))errorBlock
{
    NSLog(@"[ChopeNetwork][%@] %@", self.method, [self fullUrlString]);
    NSLog(@"[ChopeNetwork][Parameters] %@", self.parameters);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager requestWithMethod:self.method
                     urlString:[self fullUrlString]
                    parameters:self.parameters
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           NSLog(@"[ChopeNetwork][success] %@", [self fullUrlString]);
                           
                           NSDictionary *data = [self dataFromResponse:responseObject];

                           if ([self isSuccessFromResponse:responseObject]) {
                               if (successBlock) {
                                   successBlock(self, data);
                               }
                           }
                           else {
                               if (failureBlock) {
                                   NSUInteger resultCode = [self resultCodeFromResponse:responseObject];
                                   NSString *resultMessage = [self resultMessageFromResponse:responseObject];
                                   
                                   failureBlock(self, resultCode, resultMessage);
                               }
                           }
                       }
                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"[ChopeNetwork][error] %@", error);
                           
                           if (errorBlock) {
                               errorBlock(self, error);
                           }
                       }];
}


#pragma mark Must override
- (BOOL)isSuccessFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use" format:@"You must override this method - isSuccessFromResponse"];
    return YES;
}

- (NSDictionary*)dataFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use" format:@"You must override this method - dataFromResponse"];
    return nil;
}

- (NSInteger)resultCodeFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use" format:@"You must override this method - resultCodeFromResponse"];
    return 0;
}

- (NSString*)resultMessageFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use" format:@"You must override this method - resultMessageFromResponse"];
    return nil;
}


#pragma mark Public Method
- (void)post:(NSDictionary*)parameters
     success:(void(^)(ChopeNetwork *network, NSDictionary *data))successBlock
     failure:(void(^)(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage))failureBlock
       error:(void(^)(ChopeNetwork *network, NSError *error))errorBlock
{
    self.parameters = parameters;
    self.method = CHOPE_NETWORK_METHOD_POST;
    
    [self requestWithSuccess:successBlock failure:failureBlock error:errorBlock];
}

- (void)get:(NSDictionary*)parameters
    success:(void(^)(ChopeNetwork *network, NSDictionary *data))successBlock
    failure:(void(^)(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage))failureBlock
      error:(void(^)(ChopeNetwork *network, NSError *error))errorBlock
{
    self.parameters = parameters;
    self.method = CHOPE_NETWORK_METHOD_GET;
    
    [self requestWithSuccess:successBlock failure:failureBlock error:errorBlock];
}

@end
