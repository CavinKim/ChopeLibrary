//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTextField.h"

@interface CPTextField ()



@end


@implementation CPTextField

- (id)init {
    self = [super init];
    if (self) {
        [self configure];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configure];
    }

    return self;
}

- (void)configure {
    [self setDelegate:self];
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    bounds.origin.x = 8;
    bounds.size.width = self.leftView.frame.size.width;
    return bounds;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    return CGRectMake(self.frame.size.width-27, 15, 17, 17);
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    if (self.leftView) {
        bounds.origin.x = (8 + self.leftView.frame.size.width + 20);
    }
    else {
        bounds.origin.x = 9;
    }

    if (self.rightView) {
        bounds.size.width = 320 - bounds.origin.x - 30;
    }
    else {
        bounds.size.width = 320 - bounds.origin.x - 9;
    }

    return bounds;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (void)setLeftViewText:(NSString *)leftText color:(UIColor *)color font:(UIFont *)font {
    UILabel *leftTextView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 15)];
    [leftTextView setText:leftText];
    [leftTextView setTextColor:color];
    [leftTextView setFont:font];
    [leftTextView sizeToFit];
    [self setLeftView:leftTextView];
    [self setLeftViewMode:UITextFieldViewModeAlways];

    [self setNeedsLayout];
}

@end