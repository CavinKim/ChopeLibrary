//
// Created by Chope on 2014. 6. 25..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <objc/runtime.h>
#import "CPTextFieldDelegator.h"
#import "CPTextField.h"

#define OBJ_KEY_SHOULD_BEGIN_EDITING    @"shouldBeginEditing"
#define OBJ_KEY_DID_END_EDITING         @"didEndEditing"


@implementation CPTextFieldDelegator

- (id)initWithTextField:(CPTextField *)textField {
    self = [super init];
    if (self) {
        [self setTextField:textField];
    }
    return self;
}

- (void)setTextField:(CPTextField *)textField {
    _textField = textField;
    [textField setDelegate:self];
}

- (void)addBlock:(id)block key:(void const *)key {
    NSMutableArray *blocks = [self getBlock:key];

    if (!blocks) {
        blocks = [[NSMutableArray alloc] init];
    }

    [blocks addObject:block];
    objc_setAssociatedObject(self, key, blocks, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSMutableArray *)getBlock:(void const *)key {
    return [NSMutableArray arrayWithArray:objc_getAssociatedObject(self, key)];
}

- (BOOL)callBlocks:(void const *)key textField:(UITextField*)textField {
    NSArray *blocks = [self getBlock:key];

    for (void (^block)(UITextField *) in blocks) {
        block(textField);
    }

    return YES;
}


#pragma mark - Add Block
- (void)addShouldBeginEditing:(void(^)(UITextField *textField))block {
    [self addBlock:block key:OBJ_KEY_SHOULD_BEGIN_EDITING];
}

- (void)addDidEndEditing:(void(^)(UITextField *textField))block {
    [self addBlock:block key:OBJ_KEY_DID_END_EDITING];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return [self callBlocks:OBJ_KEY_SHOULD_BEGIN_EDITING textField:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self callBlocks:OBJ_KEY_DID_END_EDITING textField:textField];
}

@end