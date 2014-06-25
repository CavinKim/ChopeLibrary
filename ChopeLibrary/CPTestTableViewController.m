//
// Created by Chope on 2014. 6. 2..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPTestTableViewController.h"
#import "ChopeTableController.h"
#import "CPTestLabelTableViewCell.h"
#import "ChopeTableInfo.h"
#import "CPParseAccount.h"

#define CELL_IDENTIFIER_LABEL @"labelCell"


@implementation CPTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableController = [[ChopeTableController alloc] init];
    ChopeTableInfo *chopeTableInfo = [self.tableController addTableInfo:self.tableView paging:NO];

    Class cellClass = [CPTestLabelTableViewCell class];

    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"Core"];
    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"Appearance"];
    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"섹션 테스트"];
    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"로딩 테스트"];
    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"섹션 테스트"];
    [chopeTableInfo addCellClass:cellClass identifier:CELL_IDENTIFIER_LABEL data:@"로딩 테스트"];

    [chopeTableInfo setDidSelectRow:^(ChopeTableInfo *tableViewInfo, NSIndexPath *indexPath) {
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"CoreIdentifier" sender:nil];
        }
    }];
}

- (IBAction)signin:(id)sender {
    [CPParseAccount login:ChopeThirdpartyLoginTypeKakao success:^(ChopeThirdpartyLoginType loginType) {
        NSLog(@"success");
    }             failure:^(NSError *error) {
        NSLog(@"Error : %@", error);
    }];
}


@end