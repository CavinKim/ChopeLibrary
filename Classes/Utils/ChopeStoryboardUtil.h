//
//  ChopeStoryboardUtil.h
//  ChopeLibrary
//
//  Created by Chope on 13. 10. 18..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeStoryboardUtil : NSObject

+ (UIViewController*)initialViewControllerFromStoryBoard:(NSString*)storyboardName;
+ (UIViewController*)viewControllerFromStoryBoard:(NSString*)storyboardName identifier:(NSString*)identifier;

@end
