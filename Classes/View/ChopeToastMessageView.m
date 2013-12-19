//
//  ChopeToastMessageView.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeToastMessageView.h"
#import "UIView+ChopeView.h"
#import "UILabel+ChopeResize.h"
#import "UIView+ChopeAnimation.h"

@implementation ChopeToastMessageView

- (id)initWithContentView:(UIView*)contentView
{
    self = [super initWithFrame:CGRectMake(0, 0, 40, 40)];
    if (self) {
        [self initPadding];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        self.hidden = YES;
        self.clipsToBounds = YES;
        self.userInteractionEnabled = NO;
        [self setRound:8.0];
        
        CGRect frame = self.frame;
        frame.size.width = contentView.frame.size.width + self.horizontalPadding * 2;
        frame.size.height = contentView.frame.size.height + self.verticalPadding * 2;
        self.frame = frame;
        
        contentView.center = self.center;
        contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:contentView];
    }
    return self;
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [self showInView:window];
}

- (void)showInView:(UIView*)view
{
    [self initPadding];
    
    [view addSubview:self];
    
    CGRect frame = self.frame;
    frame.origin.x = (view.frame.size.width - self.frame.size.width) / 2.0;
    frame.origin.y = view.frame.size.height - self.frame.size.height - 50;
    
    self.frame = frame;
    self.alpha = 0;
    
    [self fadeInOut:self.time completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)initPadding
{
    self.horizontalPadding = TOAST_DEFAULT_PADDING;
    self.verticalPadding = TOAST_DEFAULT_PADDING;
}


#pragma mark - Static Method
+ (ChopeToastMessageView*)toastWithMessage:(NSString*)message forTime:(NSTimeInterval)time
{
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = message;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.font = [UIFont systemFontOfSize:12];
    textLabel.numberOfLines = 0;
    textLabel.backgroundColor = [UIColor clearColor];
    
    [textLabel sizeToFitMaxWidth:280];
    
    ChopeToastMessageView *toastMessageView = [[ChopeToastMessageView alloc] initWithContentView:textLabel];
    toastMessageView.time = time;
    
    return toastMessageView;
}

+ (ChopeToastMessageView*)toastWithCustomView:(UIView*)customView forTime:(NSTimeInterval)time
{
    ChopeToastMessageView *toastMessageView = [[ChopeToastMessageView alloc] initWithContentView:customView];
    toastMessageView.time = time;
    
    return toastMessageView;
}

@end
