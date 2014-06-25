//
//  CPStoryboardUtil.m
//  CPApplication
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "CPStoryboardUtil.h"

@implementation CPStoryboardUtil

+ (UIViewController*)initialViewControllerFromStoryBoard:(NSString*)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    if (storyboard) {
        return storyboard.instantiateInitialViewController;
    }
    
    return  nil;
}

+ (UIViewController*)viewControllerFromStoryBoard:(NSString*)storyboardName identifier:(NSString*)identifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    if (storyboard) {
        return [storyboard instantiateViewControllerWithIdentifier:identifier];
    }
    
    return nil;
}

@end
