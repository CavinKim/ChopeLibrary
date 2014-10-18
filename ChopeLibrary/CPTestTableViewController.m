//
// Created by Chope on 2014. 6. 2..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTestTableViewController.h"
#import "ChopeTableController.h"
#import "CPTestLabelTableViewCell.h"
#import "ChopeTableInfo.h"

#define CELL_IDENTIFIER_LABEL @"labelCell"


@implementation CPTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableController = [[ChopeTableController alloc] init];

    ChopeTableInfo *chopeTableInfo = [self.tableController addTableView:self.tableView paging:NO];
    [chopeTableInfo addCellClass:[CPTestLabelTableViewCell class] cellIdentifier:CELL_IDENTIFIER_LABEL];

    [chopeTableInfo addData:@"Core" cellIdentifier:CELL_IDENTIFIER_LABEL];
    [chopeTableInfo addData:@"Appearance" cellIdentifier:CELL_IDENTIFIER_LABEL];
    [chopeTableInfo addData:@"Custom View" cellIdentifier:CELL_IDENTIFIER_LABEL];

    [chopeTableInfo setDidSelectRowBlock:^(ChopeTableInfo *cpTableInfo, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"CoreIdentifier" sender:nil];
        }
    }];
}

- (IBAction)signin:(id)sender {

}


@end