//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CPTextField : UITextField <UITextFieldDelegate>

- (void)setLeftViewText:(NSString *)leftText color:(UIColor *)color font:(UIFont *)font;

@end