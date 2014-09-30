//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CPTextField;


@interface CPTextFieldDelegator : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) CPTextField *textField;

- (id)initWithTextField:(CPTextField *)textField;

#pragma mark - Add Block
- (void)addShouldBeginEditing:(void(^)(UITextField *textField))block;
- (void)addDidEndEditing:(void(^)(UITextField *textField))block;

@end