//
//  UIView+ChopeView.h
//  CPApplication
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ChopeView)

- (void)setSize:(CGSize)size;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setOrigin:(CGPoint)origin;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setCenterX:(CGFloat)x;
- (void)setCenterY:(CGFloat)y;

- (void)setRound:(CGFloat)radius;
- (void)setBorder:(CGFloat)width color:(UIColor*)color;

- (UIImage*)toImage;

@end
