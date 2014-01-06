//
//  ChopeLinearView.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeLinearView.h"

@implementation ChopeLinearView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray *views = self.subviews;
    CGFloat origin = 0;
    
    for (NSInteger i=0; i<self.subviews.count; i++) {
        UIView *view = [views objectAtIndex:i];
        origin += i > 0 ? self.interViewSpacing : 0;
        origin = [self setSubviewOrigin:origin view:view];
    }
    
    [self setSize:origin];
    
    if (self.centerAfterLayout) {
        [self setCenterSubviews];
    }
}

- (NSInteger)setSubviewOrigin:(CGFloat)origin view:(UIView*)view
{
    CGRect frame = view.frame;
    CGFloat newOrigin = origin;
    
    if (self.linearViewAlignType == ChopeLinearViewAlignTypeVertical) {
        frame.origin.x = 0;
        frame.origin.y = origin;
        newOrigin += frame.size.height;
        self.maxSize = frame.size.width > self.maxSize ? frame.size.width : self.maxSize;
    }
    else {
        frame.origin.x = origin;
        frame.origin.y = 0;
        newOrigin += frame.size.width;
        self.maxSize = frame.size.height > self.maxSize ? frame.size.height : self.maxSize;
    }
    
    view.frame = frame;
    
    return newOrigin;
}

- (void)setSize:(CGFloat)newSize
{
    CGRect frame = self.frame;
    
    if (self.resizeAfterLayout) {
        if (self.linearViewAlignType == ChopeLinearViewAlignTypeVertical) {
            frame.size.width = self.maxSize;
            frame.size.height = newSize;
        }
        else {
            frame.size.width = newSize;
            frame.size.height = self.maxSize;
        }
    }
    
    self.frame = frame;
}

- (void)setCenterSubviews
{
    NSArray *views = self.subviews;
    
    for (NSInteger i=0; i<self.subviews.count; i++) {
        UIView *view = [views objectAtIndex:i];
        
        CGPoint center = view.center;

        if (self.linearViewAlignType == ChopeLinearViewAlignTypeVertical) {
            center.x = self.center.x;
        }
        else {
            center.y = self.center.y;
        }
        
        [view setCenter:center];
    }
}

@end
