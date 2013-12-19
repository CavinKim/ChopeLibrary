//
//  UIImage+ChopeImage.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "UIImage+ChopeImage.h"
#import "UIImage+StackBlur.h"

@implementation UIImage (ChopeImage)

- (UIImage*)blurWithRadius:(NSUInteger)radius
{
    UIImage *image = [self normalize];
    return [image stackBlur:radius];
}

@end
