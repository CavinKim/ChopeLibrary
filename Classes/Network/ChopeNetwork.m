//
//  ChopeNetwork.m
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeNetwork.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"


@interface AFHTTPRequestOperationManager (ChopeNetwork)

- (AFHTTPRequestOperation *)requestWithMethod:(NSString*)method
                                    urlString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end

@implementation AFHTTPRequestOperationManager (ChopeNetwork)

- (AFHTTPRequestOperation *)requestWithMethod:(NSString*)method
                                    urlString:(NSString *)URLString
                                   parameters:(NSDictionary *)parameters
                                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];
    
    return operation;
}

@end



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

- (void)requestWithSuccess:(void(^)(NSDictionary *data))successBlock
                     error:(void(^)(NSError *error))errorBlock
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
                                   successBlock(data);
                               }
                           }
                           else {
                               if (errorBlock) {
                                   NSUInteger resultCode = [self resultCodeFromResponse:responseObject];
                                   NSString *resultMessage = [self resultMessageFromResponse:responseObject];
                                   NSDictionary *userInfo = nil;
                                   
                                   if (resultMessage) {
                                       userInfo = @{ @"message": resultMessage };
                                   }
                                   
                                   NSError *error = [NSError errorWithDomain:@"API Falure"
                                                                        code:resultCode
                                                                    userInfo:userInfo];
                                   
                                   errorBlock(error);
                               }
                           }
                       }
                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"[ChopeNetwork][error] %@", error);
                           
                           if (errorBlock) {
                               errorBlock(error);
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
     success:(void(^)(NSDictionary *data))successBlock
       error:(void(^)(NSError *error))errorBlock
{
    self.parameters = parameters;
    self.method = CHOPE_NETWORK_METHOD_POST;
    
    [self requestWithSuccess:successBlock error:errorBlock];
}

- (void)get:(NSDictionary*)parameters
    success:(void(^)(NSDictionary *data))successBlock
      error:(void(^)(NSError *error))errorBlock
{
    self.parameters = parameters;
    self.method = CHOPE_NETWORK_METHOD_GET;
    
    [self requestWithSuccess:successBlock error:errorBlock];
}

@end
