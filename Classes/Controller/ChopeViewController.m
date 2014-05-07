//
//  ChopeViewController.m
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 17..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeViewController.h"
#import "ChopeLibrary.h"
#import "ChopeLoadingView.h"

@interface ChopeViewController ()

@property (nonatomic, retain) ChopeLoadingView *loadingView;

@end


@implementation ChopeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([[ChopeLibrary SharedInstance].delegate respondsToSelector:@selector(viewDidLoadInviewController:)]) {
        [[ChopeLibrary SharedInstance].delegate viewDidLoadInviewController:self];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([[ChopeLibrary SharedInstance].delegate respondsToSelector:@selector(viewWillAppearInViewController:)]) {
        [[ChopeLibrary SharedInstance].delegate viewWillAppearInViewController:self];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([[ChopeLibrary SharedInstance].delegate respondsToSelector:@selector(viewDidAppearInViewController:)]) {
        [[ChopeLibrary SharedInstance].delegate viewDidAppearInViewController:self];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ([[ChopeLibrary SharedInstance].delegate respondsToSelector:@selector(viewWillDisappearInViewController:)]) {
        [[ChopeLibrary SharedInstance].delegate viewWillDisappearInViewController:self];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if ([[ChopeLibrary SharedInstance].delegate respondsToSelector:@selector(viewDidDisappearInViewController:)]) {
        [[ChopeLibrary SharedInstance].delegate viewDidDisappearInViewController:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoadingView {
    [self.loadingView show];
}

- (void)hideLoadingView {
    [self.loadingView hide];
}

@end
