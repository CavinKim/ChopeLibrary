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

- (UIImage*)scaledImageToSize:(CGSize)newSize
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(newSize);
    }
    
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)croppedImageToRect:(CGRect)cropRect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], cropRect);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return newImage;
}

- (UIImage*)aspectFilledImageToSize:(CGSize)size
{
    CGSize viewSize = size;
    CGSize imageSize = self.size;
    UIImage *resizedImage = nil;
    CGFloat ratioWidth = imageSize.width / viewSize.width;
    CGFloat ratioHeight = imageSize.height / viewSize.height;
    CGSize newSize;
    CGFloat scale;
    
    if (ratioWidth > ratioHeight) {
        scale = viewSize.height / imageSize.height;
    }
    else {
        scale = viewSize.width / imageSize.width;
    }
    
    newSize = CGSizeMake(imageSize.width * scale, imageSize.height * scale);
    resizedImage = [self scaledImageToSize:newSize];
    
    UIImage *cropedImage = nil;
    
    if (ratioWidth > ratioHeight) {
        cropedImage = [resizedImage croppedImageToRect:CGRectMake((resizedImage.size.width-viewSize.width)/2.0, 0, viewSize.width, viewSize.height)];
    }
    else {
        [cropedImage = resizedImage croppedImageToRect:CGRectMake(0, (resizedImage.size.height-viewSize.height)/2.0, viewSize.width, viewSize.height)];
    }
    
    return cropedImage;
}

- (UIImage*)resizeImageWithMaxWidth:(CGFloat)width
{
    CGSize imageSize = self.size;
    UIImage *resizedImage = nil;
    CGFloat ratio = width / imageSize.width;
    CGSize newSize = CGSizeMake(imageSize.width * ratio, imageSize.height * ratio);
    resizedImage = [self scaledImageToSize:newSize];
    
    return resizedImage;
}

- (UIImage*)resizeImageWithMaxHeight:(CGFloat)height
{
    CGSize imageSize = self.size;
    UIImage *resizedImage = nil;
    CGFloat ratio = height / imageSize.height;
    CGSize newSize = CGSizeMake(imageSize.width * ratio, imageSize.height * ratio);
    resizedImage = [self scaledImageToSize:newSize];
    
    return resizedImage;
}

+ (UIImage *)ImageWithColor:(UIColor*)color size:(CGSize)size
{
    //Create a context of the appropriate size
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    //Build a rect of appropriate size at origin 0,0
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    
    //Set the fill color
    CGContextSetFillColorWithColor(currentContext, color.CGColor);
    
    //Fill the color
    CGContextFillRect(currentContext, fillRect);
    
    //Snap the picture and close the context
    UIImage *retval = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retval;
}

@end
