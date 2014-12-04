//
// Created by Chope on 2014. 6. 24..
// Copyright (c) 2014 Chope. All rights reserved.
//

#import "CPCoreTestViewController.h"
#import "CPLinearView.h"

@interface CPCoreTestViewController ()

@property (nonatomic, weak) IBOutlet CPLinearView *linearView;

@end


@implementation CPCoreTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.linearView.linearViewAlignType = CPLinearViewAlignTypeHorizontal;
//    self.linearView.centerAfterLayout = YES;
    self.linearView.resizeAfterLayout = YES;
    self.linearView.interViewSpacing = 10;
    self.linearView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
}


@end