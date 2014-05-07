//
//  ChopeTestViewController.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeTestViewController.h"
#import "ChopeToastView.h"
#import "UIViewController+Chope.h"
#import "ChopeAppDelegate.h"
#import "ChopeLoadingView.h"

@implementation ChopeTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    [self.linearView setLinearViewAlignType:ChopeLinearViewAlignTypeVertical];
//    [self.linearView setResizeAfterLayout:YES];
//    [self.linearView setCenterAfterLayout:YES];
    
//    NSLog(@"navigationController : %@", self.navigationController);
//    NSLog(@"navigationItem : %@", self.navigationItem);
//    NSLog(@"tabBarController : %@", self.tabBarController);
//    NSLog(@"tabBarItem : %@", self.tabBarItem);
//
//    [self.navigationItem setTitle:@"A"];
//    [self.tabBarItem setTitle:@"B"];
    
//    NSLog(@"navigationController : %@", self.reiterationNavigationController);
//    NSLog(@"navigationItem : %@", self.reiterationNavigationItem);
//    NSLog(@"tabBarController : %@", self.reiterationTabBarController);
//    NSLog(@"tabBarItem : %@", self.reiterationTabBarItem);
//    
//    [self.reiterationNavigationItem setTitle:@"A"];
//    [self.reiterationTabBarItem setTitle:@"B"];
    
//    [self setTitle:@"A"];
    
    NSLog(@"%@", [UIApplication sharedApplication].windows.firstObject);
    
    ChopeAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSLog(@"%@", delegate.window);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ChopeLoadingView *loadingView = [[ChopeLoadingView alloc] init];
    [loadingView show];
    
    [[ChopeToastView appearance] setTextColor:[UIColor blackColor]];
    [[ChopeToastView appearance] setBackgroundColor:[UIColor whiteColor]];
    [[ChopeToastView appearance] setFont:[UIFont systemFontOfSize:20.0]];
    
//    [[ChopeToastView ToastViewWithMessage:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890"] show];
    ChopeToastView *toastView = [ChopeToastView ToastViewWithMessage:@"가나다라마바사아자차카타파하 가나다라 마바사아 자차카타 파하"];
    UIEdgeInsets margin = toastView.margin;
    margin.bottom = 200;
    toastView.margin = margin;
    
    toastView.padding = UIEdgeInsetsMake(30.0, 30.0, 30.0, 30.0);
    
    [toastView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
