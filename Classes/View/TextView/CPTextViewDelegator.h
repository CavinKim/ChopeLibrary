//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPTextView;


@interface CPTextViewDelegator : NSObject <UITextViewDelegate>

@property (nonatomic, copy) void (^shouldBeginEditingBlock)(CPTextView *textView);
@property (nonatomic, copy) void (^shouldEndEditingBlock)(CPTextView *textView);
@property (nonatomic, copy) void (^didChangeTextBlock)(CPTextView *textView);

@property (nonatomic) NSUInteger maxLength;

- (id)initWithTextView:(CPTextView *)textView;

@end