//
//  UIView+ChopeAnimation.m
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "UIView+ChopeAnimation.h"

@implementation UIView (ChopeAnimation)

- (void)fadeIn:(NSTimeInterval)time delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion
{
    self.hidden = NO;
    
    [UIView animateWithDuration:time
                          delay:delay
                        options:UIViewAnimationOptionShowHideTransitionViews
                     animations:^{
                         self.alpha = 1.0;
                     }
                     completion:completion];
}

- (void)fadeOut:(NSTimeInterval)time delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion
{
    self.hidden = NO;
    
    [UIView animateWithDuration:time
                          delay:delay
                        options:UIViewAnimationOptionShowHideTransitionViews
                     animations:^{
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         self.hidden = YES;
                         
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

- (void)fadeInOut:(NSTimeInterval)time completion:(void (^)(BOOL finished))completion
{
    [self fadeIn:0.5 delay:0 completion:^(BOOL finished) {
        [self fadeOut:0.5 delay:time completion:completion];
    }];
}

@end
