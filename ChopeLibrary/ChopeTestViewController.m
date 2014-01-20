//
//  ChopeTestViewController.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeTestViewController.h"
#import "ChopeToastView.h"

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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
