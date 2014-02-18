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
{
    self = [super init];
    if (self) {
        self.operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:host]];
    }
    return self;
}

- (void)requestWithMethod:(NSString*)method
                     path:(NSString*)path
               parameters:(NSDictionary*)parameters
                  success:(void(^)(NSDictionary *data))successBlock
                    error:(void(^)(NSError *error))errorBlock
{
    NSLog(@"[ChopeNetwork][%@] %@", method, path);
    NSLog(@"[ChopeNetwork][Parameters] %@", parameters);
    
    [self.operationManager requestWithMethod:method
                                   urlString:path
                                  parameters:parameters
                                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                         NSLog(@"[ChopeNetwork][success] %@", path);
                           
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
    [NSException raise:@"Incorrect use"
                format:@"You must override this method - isSuccessFromResponse"];
    return YES;
}

- (NSDictionary*)dataFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use"
                format:@"You must override this method - dataFromResponse"];
    return nil;
}

- (NSInteger)resultCodeFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use"
                format:@"You must override this method - resultCodeFromResponse"];
    return 0;
}

- (NSString*)resultMessageFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use"
                format:@"You must override this method - resultMessageFromResponse"];
    return nil;
}


#pragma mark Public Method
- (void)post:(NSString*)path
  parameters:(NSDictionary*)parameters
     success:(void(^)(NSDictionary *data))successBlock
       error:(void(^)(NSError *error))errorBlock
{
    [self requestWithMethod:@"POST"
                       path:path
                 parameters:parameters
                    success:successBlock
                      error:errorBlock];
}

- (void)get:(NSString*)path
 parameters:(NSDictionary*)parameters
    success:(void(^)(NSDictionary *data))successBlock
      error:(void(^)(NSError *error))errorBlock
{
    [self requestWithMethod:@"GET"
                       path:path
                 parameters:parameters
                    success:successBlock
                      error:errorBlock];
}

@end
