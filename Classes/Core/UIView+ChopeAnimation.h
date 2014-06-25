//
//  UIView+ChopeAnimation.h
//  CPApplication
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ChopeAnimation)

- (void)fadeIn:(NSTimeInterval)time delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion;
- (void)fadeOut:(NSTimeInterval)time delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion;
- (void)fadeInOut:(NSTimeInterval)time completion:(void (^)(BOOL finished))completion;

@end
