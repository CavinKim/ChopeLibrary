//
// Created by Chope on 2014. 6. 23..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CPAppearance : NSObject

#pragma mark - Button
+ (void)applyBackgroundImageToButton:(UIButton *)button
                              normal:(UIImage *)normalImage
                         highlighted:(UIImage *)highlightedImage;
+ (void)applyBackgroundImageToButton:(UIButton *)button
                              normal:(UIImage *)normalImage
                         highlighted:(UIImage *)highlightedImage
                            disabled:(UIImage *)disabledImage;
+ (void)applyBackgroundColorToButton:(UIButton *)button
                              normal:(UIColor *)normalColor
                         highlighted:(UIColor *)highlightedColor;
+ (void)applyBackgroundColorToButton:(UIButton *)button
                              normal:(UIColor *)normalColor
                         highlighted:(UIColor *)highlightedColor
                            disabled:(UIColor *)disabledColor;
+ (void)applyTitleColorToButton:(UIButton *)button
                         normal:(UIColor *)normalColor
                    highlighted:(UIColor *)highlightedColor;
+ (void)applyTitleColorToButton:(UIButton *)button
                         normal:(UIColor *)normalColor
                    highlighted:(UIColor *)highlightedColor
                       disabled:(UIColor *)disabledColor;
+ (void)applyImageToButton:(UIButton *)button
                    normal:(UIImage *)normalImage
               highlighted:(UIImage *)highlightedImage;
+ (void)applyImageToButton:(UIButton *)button
                    normal:(UIImage *)normalImage
               highlighted:(UIImage *)highlightedImage
                  disabled:(UIImage *)disabledImage;


#pragma mark - Navigation
+ (void)setNavigationBackgroundColor:(UIColor *)backgroundColor
                           textColor:(UIColor *)textColor;
+ (void)setFlatNavigationBackgroundColor:(UIColor *)backgroundColor
                               textColor:(UIColor *)textColor;
+ (void)addNavigationTitleAttributes:(NSDictionary *)attributes;

@end