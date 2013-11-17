//
//  ChopeLoadingView.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 20..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeLoadingView.h"
#import "ChopeDeviceUtil.h"

@implementation ChopeLoadingView

- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    self.loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.loadingView.frame];
    label.text = @"Loading...";
    label.font = [UIFont systemFontOfSize:13.0];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = CGPointMake(self.loadingView.frame.size.width/2.0, self.loadingView.frame.size.height/2.0);
    
    [self.loadingView addSubview:label];
    [self addSubview:self.loadingView];
}

- (void)showInView:(UIView*)view
{
    [view addSubview:self];
    self.frame = view.bounds;
    self.loadingView.center = self.center;
}

- (void)hide
{
    [self removeFromSuperview];
}


@end
