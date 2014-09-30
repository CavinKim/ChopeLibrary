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

- (void)selectWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor wisteriaFlatColor]];
    NSLog(@"select cell : %d",indexPath.row);
}

- (void)deselectWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
    NSLog(@"deselected cell : %d",indexPath.row);
}

- (void)highlightWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setBackgroundColor:[UIColor belizeHoleFlatColor]];
    NSLog(@"highlight cell : %d",indexPath.row);
}

- (void)unhighlightWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    [self setNormalBackgroundColor:indexPath];
    NSLog(@"unhighlight cell : %d",indexPath.row);
}


@end