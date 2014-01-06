//
//  UILabel+ChopeResize.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChopeResize)

#pragma mark - Fit Width
- (void)sizeToFitMinWidth:(CGFloat)width;
- (void)sizeToFitMaxWidth:(CGFloat)width;
- (void)sizeToFitFixedWidth:(CGFloat)width;


#pragma mark - Fit SuperView Width
- (void)sizeToFitMinWith:(CGFloat)width forSuperView:(UIView*)superView;
- (void)sizeToFitMaxWith:(CGFloat)width forSuperView:(UIView*)superView;
- (void)sizeToFitFixedWidth:(CGFloat)width forSuperView:(UIView*)superView;

@end
