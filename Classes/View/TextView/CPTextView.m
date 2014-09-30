//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTextView.h"

@interface CPTextView ()



@end


@implementation CPTextView

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configure];
    }

    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }

    return self;
}

- (void)configure {
    self.textContainerInset = UIEdgeInsetsMake(11, 9, 11, 9);

    CGRect placeholderFrame = CGRectMake(self.textContainerInset.left + self.textContainer.lineFragmentPadding, self.textContainerInset.top, 0, 0);
    placeholderFrame.size.width = self.bounds.size.width - (placeholderFrame.origin.x * 2);
    placeholderFrame.size.height = self.bounds.size.height - (placeholderFrame.origin.y * 2);

    self.placeholderLabel = [[UILabel alloc] initWithFrame:placeholderFrame];
    [self.placeholderLabel setNumberOfLines:0];
    [self.placeholderLabel setBackgroundColor:[UIColor clearColor]];
    [self.placeholderLabel setUserInteractionEnabled:NO];
    [self.placeholderLabel setFont:self.font];
    [self.placeholderLabel setTextColor:[UIColor lightGrayColor]];
    [self addSubview:self.placeholderLabel];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    [self.placeholderLabel setText:_placeholder];
    [self.placeholderLabel sizeToFit];
}

- (void)setPlaceholderTextFont:(UIFont *)font {
    [self.placeholderLabel setFont:font];
}

- (void)setPlaceholderTextColor:(UIColor *)color {
    [self.placeholderLabel setTextColor:color];
}


@end