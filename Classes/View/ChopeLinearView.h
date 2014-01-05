//
//  ChopeLinearView.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

enum ChopeLinearViewAlignType {
    ChopeLinearViewAlignTypeVertical = 1,
    ChopeLinearViewAlignTypeHorizontal = 2
};


@interface ChopeLinearView : UIView

@property (nonatomic) enum ChopeLinearViewAlignType alignType;
@property (nonatomic) BOOL resize;
@property (nonatomic) CGFloat interViewSpacing;
@property (nonatomic) CGFloat maxSize;

@end
