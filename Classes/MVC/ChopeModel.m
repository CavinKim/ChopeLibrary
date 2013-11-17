//
//  ChopeModel.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeModel.h"
#import "ChopeDataUtil.h"

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

- (NSInteger)integerFromResponse:(NSDictionary*)response forKey:(NSString*)key
{
    if ([ChopeDataUtil isNull:response]) {
        return -1;
    }
    
    id value = [response objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return -1;
    }
    
    return [value integerValue];
}

- (CGFloat)doubleFromResponse:(NSDictionary*)response forKey:(NSString*)key
{
    if ([ChopeDataUtil isNull:response]) {
        return -1.0;
    }
    
    id value = [response objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return -1.0;
    }
    
    return [value floatValue];
}

- (BOOL)booleanFromResponse:(NSDictionary*)response forKey:(NSString*)key
{
    if ([ChopeDataUtil isNull:response]) {
        return NO;
    }
    
    id value = [response objectForKey:key];
    
    if ([ChopeDataUtil isNull:value]) {
        return false;
    }
    
    return [value boolValue];
}

- (NSString*)stringFromResponse:(NSDictionary*)response forKey:(NSString*)key
{
    if ([ChopeDataUtil isNull:response]) {
        return nil;
    }
    
    id value = [response objectForKey:key];
    
    if ([ChopeDataUtil isNullString:value]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber*)value;
        return [number stringValue];
    }
    
    return value;
}

//- (NSDate*)dateFromResponse:(NSDictionary*)response forKey:(NSString*)key
//{
//    if ([ChopeDataUtil isNull:response]) {
//        return nil;
//    }
//    
//    id value = [response objectForKey:key];
//    
//    if ([ChopeDataUtil isNullString:value]) {
//        return nil;
//    }
//    
//    return [IumDateUtil dateForRFC3339DateTimeString:value];
//}

@end
