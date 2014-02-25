//
//  ChopeTableViewController.m
//  ChopeLibrary
//
//  Created by Chope on 2014. 2. 25..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "ChopeTableViewController.h"
#import "ChopeLibrary.h"

@interface ChopeTableViewController ()

@end

@implementation ChopeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

@end
