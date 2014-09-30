//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTextViewDelegator.h"
#import "CPTextView.h"

@interface CPTextViewDelegator ()

@property (nonatomic, weak) CPTextView *textView;

@end


@implementation CPTextViewDelegator

- (id)initWithTextView:(CPTextView *)textView {
    self = [super init];
    if (self) {
        [self setTextView:textView];
    }
    return self;
}

- (void)setTextView:(CPTextView *)textView {
    _textView = textView;
    [_textView setDelegate:self];
}


#pragma mark - IumTextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (self.shouldBeginEditingBlock) {
        self.shouldBeginEditingBlock((CPTextView *) textView);
    }

    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (self.shouldEndEditingBlock) {
        self.shouldEndEditingBlock((CPTextView *) textView);
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.textView.placeholderLabel.hidden = textView.text.length > 0;

    if (self.didChangeTextBlock) {
        self.didChangeTextBlock((CPTextView *) textView);
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (self.maxLength > 0) {
        return textView.text.length + (text.length - range.length) <= self.maxLength;
    }
    return YES;
}


@end