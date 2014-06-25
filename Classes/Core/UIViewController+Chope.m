//
//  UIViewController+Chope.m
//  CPApplication
//
//  Created by Chope on 2014. 2. 25..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "UIViewController+Chope.h"

@implementation UIViewController (Chope)

- (UINavigationController*)reiterationNavigationController
{
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        return self.navigationController;
    }
    return self.tabBarController.navigationController;
}

- (UINavigationItem*)reiterationNavigationItem
{
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        return self.navigationItem;
    }
    return self.tabBarController.navigationItem;
}

- (UITabBarController*)reiterationTabBarController
{
    if ([self.parentViewController isKindOfClass:[UITabBarController class]]) {
        return self.tabBarController;
    }
    return self.navigationController.tabBarController;
}

- (UITabBarItem*)reiterationTabBarItem
{
    if ([self.parentViewController isKindOfClass:[UITabBarController class]]) {
        return self.tabBarItem;
    }
    return self.navigationController.tabBarItem;
}

@end
