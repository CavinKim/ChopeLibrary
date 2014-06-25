//
//  CPTableViewCell.m
//  CPApplication
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "CPTableViewCell.h"

@implementation CPTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

@end
