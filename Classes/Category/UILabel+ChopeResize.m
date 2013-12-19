//
//  UILabel+ChopeResize.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "UILabel+ChopeResize.h"
#import "NSString+ChopeSize.h"
#import "UIView+ChopeView.h"

@implementation UILabel (ChopeResize)

#pragma mark -
#pragma mark Fit Width
- (void)sizeToFitMinWidth:(CGFloat)width
{
    CGSize size = [self.text boundingRectWithMaxWidth:CGFLOAT_MAX font:self.font];
    
    CGRect frame = self.frame;
    frame.size = size;
    frame.size.width = frame.size.width < width ? width : frame.size.width;
    frame.size.height = size.height;
    self.frame = frame;
}

- (void)sizeToFitMaxWidth:(CGFloat)width
{
    CGSize size = [self.text boundingRectWithMaxWidth:width font:self.font];
    
    CGRect frame = self.frame;
    frame.size = size;
    frame.size.width = frame.size.width > width ? width : frame.size.width;
    frame.size.height = size.height;
    self.frame = frame;
}

- (void)sizeToFitFixedWidth:(CGFloat)width
{
    CGSize size = [self.text boundingRectWithMaxWidth:width font:self.font];
    
    CGRect frame = self.frame;
    frame.size = size;
    frame.size.width = width;
    frame.size.height = size.height;
    self.frame = frame;
}


#pragma mark -
#pragma mark Fit SuperView Width
- (void)sizeToFitMinWith:(CGFloat)width forSuperView:(UIView*)superView
{
    CGFloat superViewHeight = superView.frame.size.height;
    CGSize size = [self.text boundingRectWithMaxWidth:width font:self.font];
    
    CGFloat diffX = self.frame.size.width - size.width;
    CGFloat diffY = self.frame.size.height - size.height;
    
    CGRect frame = superView.frame;
    frame.size.width -= diffX;
    frame.size.width = frame.size.width < width ? width : frame.size.width;
    frame.size.height -= diffY;
    frame.size.height = frame.size.height < superViewHeight ? superViewHeight : frame.size.height;
    superView.frame = frame;
}

- (void)sizeToFitMaxWith:(CGFloat)width forSuperView:(UIView*)superView
{
    [superView setWidth:width];
    
    CGSize size = [self.text boundingRectWithMaxWidth:self.frame.size.width font:self.font];
    
    if (size.width > width) {
        size = [self.text boundingRectWithMaxWidth:width font:self.font];
    }
    
    CGFloat diffX = self.frame.size.width - size.width;
    CGFloat diffY = self.frame.size.height - size.height;
    
    CGRect frame = superView.frame;
    frame.size.width -= diffX;
    frame.size.width = frame.size.width > width ? width : frame.size.width;
    frame.size.height -= diffY;
    superView.frame = frame;
}

- (void)sizeToFitFixedWidth:(CGFloat)width forSuperView:(UIView*)superView
{
    [superView setWidth:width];
    
    CGSize size = [self.text boundingRectWithMaxWidth:self.frame.size.width font:self.font];
    
    CGFloat diffY = self.frame.size.height - size.height;
    
    CGRect frame = superView.frame;
    frame.size.width = width;
    frame.size.height -= diffY;
    superView.frame = frame;
}

@end
