//
//  CPLinearView.m
//  CPApplication
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "CPLinearView.h"

@implementation CPLinearView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray *views = self.subviews;
    CGFloat origin = (self.linearViewAlignType == CPLinearViewAlignTypeVertical ? self.contentInset.top : self.contentInset.left);
    
    for (NSUInteger i=0; i<self.subviews.count; i++) {
        UIView *view = views[i];
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
    
    if (self.linearViewAlignType == CPLinearViewAlignTypeVertical) {
        frame.origin.x = self.contentInset.left;
        frame.origin.y = origin;
        newOrigin += frame.size.height;
        self.maxSize = frame.size.width > self.maxSize ? frame.size.width : self.maxSize;
    }
    else {
        frame.origin.x = origin;
        frame.origin.y = self.contentInset.top;
        newOrigin += frame.size.width;
        self.maxSize = frame.size.height > self.maxSize ? frame.size.height : self.maxSize;
    }
    
    view.frame = frame;
    
    return (NSInteger) newOrigin;
}

- (void)setSize:(CGFloat)newSize
{
    CGRect frame = self.frame;
    
    if (self.resizeAfterLayout) {
        if (self.linearViewAlignType == CPLinearViewAlignTypeVertical) {
            frame.size.width = self.maxSize + (self.contentInset.left + self.contentInset.right);
            frame.size.height = newSize + self.contentInset.bottom;
        }
        else {
            frame.size.width = newSize + self.contentInset.right;
            frame.size.height = self.maxSize + (self.contentInset.top + self.contentInset.bottom);
        }
    }
    
    self.frame = frame;
}

- (void)setCenterSubviews
{
    NSArray *views = self.subviews;
    
    for (NSUInteger i=0; i<self.subviews.count; i++) {
        UIView *view = views[i];
        
        CGPoint center = view.center;

        if (self.linearViewAlignType == CPLinearViewAlignTypeVertical) {
            center.x = (CGFloat) (self.frame.size.width / 2.0);
        }
        else {
            center.y = (CGFloat) (self.frame.size.height / 2.0);
        }
        
        [view setCenter:center];
    }
}

@end
