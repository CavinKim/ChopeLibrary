//
// Created by Chope on 2014. 5. 21..
// Copyright (c) 2014 iumsocius. All rights reserved.
//

#import "CPLabel.h"
#import "NSString+ChopeSize.h"
#import "UIView+ChopeView.h"


@implementation CPLabel

- (void)drawTextInRect:(CGRect)rect {
    CGRect textRect;
    textRect.origin.x = self.contentEdgeInsets.left;
    textRect.origin.y = self.contentEdgeInsets.top;
    textRect.size.width = [self drawTextRectWidth];
    textRect.size.height = self.bounds.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom;
    [super drawTextInRect:textRect];
}

- (void)sizeToFitHeight {
    CGSize size = [self.text boundingRectWithMaxWidth:[self drawTextRectWidth] font:self.font];
    [self setHeight:size.height + self.contentEdgeInsets.top + self.contentEdgeInsets.bottom];
}

- (CGFloat)drawTextRectWidth {
    return self.bounds.size.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right;
}

@end