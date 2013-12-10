//
//  ChopeImageUtil.m
//  LibrarySeat
//
//  Created by Hyun Gook Yoon on 2013. 11. 30..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeImageUtil.h"
#import "UIImage+StackBlur.h"

@implementation ChopeImageUtil

+ (UIImage*)blurredImage:(UIImage*)image
{
    return [image stackBlur:10.0];
}

+ (UIImage*)capturedImageFromView:(UIView*)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
