//
//  ChopeLoadingView.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 5. 8..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeLoadingView.h"
#import "UIApplication+ChopeApplication.h"
#import "UIImage+ChopeImage.h"

@interface ChopeLoadingView ()

@property (nonatomic, retain) UIImage *backgroundImage;

@property NSUInteger count;

@end


@implementation ChopeLoadingView

- (id)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure {
    [self setFrame:self.window.bounds];
}

- (void)drawRect:(CGRect)rect {
    if (self.backgroundImage) {
        [self.backgroundImage drawInRect:rect];
    }
}

- (void)setupBackgroundImage {
    UIImage *image = [[UIApplication sharedApplication] toImage];
    self.backgroundImage = [image blurWithRadius:10.0];
}

- (UIWindow *)window {
    return [[UIApplication sharedApplication].windows lastObject];
}

- (void)show {
    if (self.count <= 0) {
        [self setupBackgroundImage];
        [self.window addSubview:self];
        self.count = 0;
    }
    
    self.count++;
}

- (void)hide {
    self.count--;
    
    if (self.count <= 0) {
        [self removeFromSuperview];
    }
}

@end
