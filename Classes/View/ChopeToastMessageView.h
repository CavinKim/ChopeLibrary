//
//  ChopeToastMessageView.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TOAST_DEFAULT_PADDING 5

@interface ChopeToastMessageView : UIView

@property (nonatomic) CGFloat horizontalPadding;
@property (nonatomic) CGFloat verticalPadding;
@property (nonatomic) NSTimeInterval time;

+ (ChopeToastMessageView*)toastWithMessage:(NSString*)message forTime:(NSTimeInterval)time;
+ (ChopeToastMessageView*)toastWithCustomView:(UIView*)customView forTime:(NSTimeInterval)time;

- (void)show;
- (void)showInView:(UIView*)view;

@end
