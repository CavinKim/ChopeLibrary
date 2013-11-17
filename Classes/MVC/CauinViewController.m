//
//  CauinViewController.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 17..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "CauinViewController.h"


@implementation CauinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoadingView
{
    if (!self.loadingView) {
        self.loadingView = [[ChopeLoadingView alloc] init];
    }
    
    [self.loadingView showInView:self.view];
}

- (void)hideLoadingView
{
    if (self.loadingView) {
        [self.loadingView hide];
    }
}

@end
