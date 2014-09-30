//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CPTextView : UITextView

@property (nonatomic, strong) UILabel *placeholderLabel;
@property (nonatomic, retain) NSString *placeholder;

- (void)setPlaceholderTextFont:(UIFont *)font;
- (void)setPlaceholderTextColor:(UIColor *)color;

@end