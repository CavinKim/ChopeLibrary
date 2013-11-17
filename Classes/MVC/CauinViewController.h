//
//  CauinViewController.h
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 17..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChopeLoadingView.h"

@interface CauinViewController : UIViewController

@property (nonatomic, retain) ChopeLoadingView *loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

@end
