//
//  CPLinearView.h
//  CPApplication
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

enum CPLinearViewAlignType {
    CPLinearViewAlignTypeVertical = 1,
    CPLinearViewAlignTypeHorizontal = 2
};


@interface CPLinearView : UIView

@property (nonatomic) enum CPLinearViewAlignType linearViewAlignType;
@property (nonatomic) BOOL resizeAfterLayout;
@property (nonatomic) BOOL centerAfterLayout;
@property (nonatomic) CGFloat interViewSpacing;
@property (nonatomic) CGFloat maxSize;
@property (nonatomic) UIEdgeInsets contentInset;

@end
