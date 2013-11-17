//
//  ChopeLoadingView.h
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChopeLoadingView : UIView

@property (nonatomic, retain) UIView *loadingView;

- (void)showInView:(UIView*)view;
- (void)hide;

@end
