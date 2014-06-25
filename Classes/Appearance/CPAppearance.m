//
// Created by Chope on 2014. 6. 23..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPAppearance.h"
#import "UIImage+ChopeImage.h"


@implementation CPAppearance


#pragma mark - Button
+ (void)applyBackgroundImageToButton:(UIButton *)button
                              normal:(UIImage *)normalImage
                         highlighted:(UIImage *)highlightedImage {
    [CPAppearance applyBackgroundImageToButton:button
                                        normal:normalImage
                                   highlighted:highlightedImage
                                      disabled:nil];
}

+ (void)applyBackgroundImageToButton:(UIButton *)button
                              normal:(UIImage *)normalImage
                         highlighted:(UIImage *)highlightedImage
                            disabled:(UIImage *)disabledImage {
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:disabledImage forState:UIControlStateDisabled];
}

+ (void)applyBackgroundColorToButton:(UIButton *)button
                              normal:(UIColor *)normalColor
                         highlighted:(UIColor *)highlightedColor {
    [CPAppearance applyBackgroundImageToButton:button
                                        normal:[CPAppearance colorImage:normalColor]
                                   highlighted:[CPAppearance colorImage:highlightedColor]
                                      disabled:nil];
}

+ (void)applyBackgroundColorToButton:(UIButton *)button
                              normal:(UIColor *)normalColor
                         highlighted:(UIColor *)highlightedColor
                            disabled:(UIColor *)disabledColor {
    [CPAppearance applyBackgroundImageToButton:button
                                        normal:[CPAppearance colorImage:normalColor]
                                   highlighted:[CPAppearance colorImage:highlightedColor]
                                      disabled:[CPAppearance colorImage:disabledColor]];
}

+ (void)applyTitleColorToButton:(UIButton *)button
                         normal:(UIColor *)normalColor
                    highlighted:(UIColor *)highlightedColor {
    [CPAppearance applyTitleColorToButton:button
                                   normal:normalColor
                              highlighted:highlightedColor
                                 disabled:nil];
}

+ (void)applyTitleColorToButton:(UIButton *)button
                         normal:(UIColor *)normalColor
                    highlighted:(UIColor *)highlightedColor
                       disabled:(UIColor *)disabledColor {
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [button setTitleColor:disabledColor forState:UIControlStateDisabled];
}

+ (void)applyImageToButton:(UIButton *)button
                    normal:(UIImage *)normalImage
               highlighted:(UIImage *)highlightedImage {
    [CPAppearance applyImageToButton:button
                              normal:normalImage
                         highlighted:highlightedImage
                            disabled:nil];
}

+ (void)applyImageToButton:(UIButton *)button
                    normal:(UIImage *)normalImage
               highlighted:(UIImage *)highlightedImage
                  disabled:(UIImage *)disabledImage {
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    [button setImage:disabledImage forState:UIControlStateDisabled];
}


#pragma mark - Private util method
+ (UIImage *)colorImage:(UIColor *)color {
    return color ? [UIImage imageWithColor:color size:CGSizeMake(1.0, 1.0)] : nil;
}

@end