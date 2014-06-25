//
// Created by Chope on 2014. 6. 2..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ChopeTableCellDelegate.h>
#import "CPTableViewCell.h"


@interface CPTestLabelTableViewCell : CPTableViewCell <ChopeTableCellDelegate>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end