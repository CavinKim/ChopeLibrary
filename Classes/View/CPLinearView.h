//
//  CPLinearView.h
//  CPApplication
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

enum ChopeLinearViewAlignType {
    ChopeLinearViewAlignTypeVertical = 1,
    ChopeLinearViewAlignTypeHorizontal = 2
};


@interface CPLinearView : UIView

@property (nonatomic) enum ChopeLinearViewAlignType linearViewAlignType;
@property (nonatomic) BOOL resizeAfterLayout;
@property (nonatomic) BOOL centerAfterLayout;
@property (nonatomic) CGFloat interViewSpacing;
@property (nonatomic) CGFloat maxSize;

@end
