//
//  ChopeModel.h
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChopeNetwork.h"


@class ChopeModel;


@protocol ChopeModelDelegate <NSObject>

@optional
- (void)model:(ChopeModel*)model network:(ChopeNetwork*)network resultCode:(NSInteger)resultCode resultMessage:(NSString*)resultMessage;
- (void)model:(ChopeModel*)model network:(ChopeNetwork*)network httpError:(NSError*)error;

@end


__attribute__((deprecated))
@interface ChopeModel : NSObject

@property (nonatomic, weak) id<ChopeModelDelegate> delegate;
@property (nonatomic, copy) void(^failure)(ChopeNetwork *network, NSUInteger resultCode, NSString *resultMessage);
@property (nonatomic, copy) void(^error)(ChopeNetwork *network, NSError *error);

- (id)initWithDelegate:(id<ChopeModelDelegate>)delegate;


@end
