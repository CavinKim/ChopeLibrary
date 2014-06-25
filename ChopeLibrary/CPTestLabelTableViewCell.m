//
// Created by Chope on 2014. 6. 2..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTestLabelTableViewCell.h"
#import "UIColor+ChopeColor.h"


@implementation CPTestLabelTableViewCell

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    [self.titleLabel setTextColor:[UIColor midnightBlueFlatColor]];
}

+ (CGFloat)heightForCell:(id)data indexPath:(NSIndexPath *)indexPath {
    return 30*(indexPath.row+1);
}

- (void)updateData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self.titleLabel setText:data];
    [self setNormalBackgroundColor:indexPath];
}

- (void)setNormalBackgroundColor:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        [self setBackgroundColor:[UIColor turquoiseFlatColor]];
    }
    else {
        [self setBackgroundColor:[UIColor emeraldFlatColor]];
    }
}

- (void)selectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor wisteriaFlatColor]];
}

- (void)deselectedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}

- (void)highlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor belizeHoleFlatColor]];
}

- (void)unhighlightedWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
}


@end