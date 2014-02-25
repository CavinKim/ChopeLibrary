//
//  ChopeLibrary.h
//  ChopeLibrary
//
//  Created by Chope on 2014. 2. 25..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChopeLibrary;


@protocol ChopeLibraryDelegate <NSObject>

- (void)viewDidLoadInviewController:(UIViewController*)viewController;
- (void)viewWillAppearInViewController:(UIViewController*)viewController;
- (void)viewDidAppearInViewController:(UIViewController*)viewController;
- (void)viewWillDisappearInViewController:(UIViewController*)viewController;
- (void)viewDidDisappearInViewController:(UIViewController*)viewController;

@end


@interface ChopeLibrary : NSObject

@property (nonatomic, strong) id <ChopeLibraryDelegate> delegate;

+ (instancetype)SharedInstance;

- (UIWindow*)window;

@end
