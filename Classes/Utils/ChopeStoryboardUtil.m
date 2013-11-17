//
//  ChopeStoryboardUtil.m
//  Cauin
//
//  Created by Hyun Gook Yoon on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeStoryboardUtil.h"

@implementation ChopeStoryboardUtil

+ (UIViewController*)initialViewControllerFromStoryBoard:(NSString*)storyboardName
{
    UIStoryboard *storyboard = [ChopeStoryboardUtil storyboardFromName:storyboardName];
    
    if (storyboard) {
        return storyboard.instantiateInitialViewController;
    }
    
    return  nil;
}

+ (UIViewController*)viewControllerFromStoryBoard:(NSString*)storyboardName identifier:(NSString*)identifier
{
    UIStoryboard *storyboard = [ChopeStoryboardUtil storyboardFromName:storyboardName];
    
    if (storyboard) {
        return [storyboard instantiateViewControllerWithIdentifier:identifier];
    }
    
    return nil;
}

+ (UIStoryboard*)storyboardFromName:(NSString*)storyboardName
{
    return [UIStoryboard storyboardWithName:storyboardName bundle:nil];
}

@end
