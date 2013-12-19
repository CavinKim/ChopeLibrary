//
//  ChopeModel.m
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeModel.h"

@implementation ChopeModel

- (id)initWithDelegate:(id<ChopeModelDelegate>)modelDelegate
{
    self = [super init];
    if (self) {
        self.delegate = modelDelegate;
        __weak ChopeModel *weakModel = self;
        
        [self setFailure:^(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage) {
            if (weakModel.delegate && [weakModel.delegate respondsToSelector:@selector(model:network:resultCode:resultMessage:)]) {
                [weakModel.delegate model:weakModel network:network resultCode:resultCode resultMessage:resultMessage];
            }
            else {
                NSLog(@"failure : %d - %@", resultCode, resultMessage);
            }
        }];
        
        [self setError:^(ChopeNetwork *network, NSError *error) {
            if (weakModel.delegate && [weakModel.delegate respondsToSelector:@selector(model:network:httpError:)]) {
                [weakModel.delegate model:weakModel network:network httpError:error];
            }
            else {
                NSLog(@"error : %@",error);
            }
        }];
    }
    return self;
}

- (id<ChopeModelDelegate>)delegate
{
    return _delegate;
}


#pragma mark API
- (BOOL)isSuccessFromResponse:(NSDictionary*)response
{
    [NSException raise:@"Incorrect use" format:@"You must override this method - isSuccessFromResponse"];
    return YES;
}

- (NSDictionary*)resultDataFromResponse:(NSDictionary*)response
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

@end
