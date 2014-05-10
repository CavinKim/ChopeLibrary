//
//  UIImage+ChopeImage.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ChopeImage)

- (UIImage*)blurWithRadius:(NSUInteger)radius;
- (UIImage*)scaledImageToSize:(CGSize)newSize;
- (UIImage*)croppedImageToRect:(CGRect)cropRect;
- (UIImage*)aspectFilledImageToSize:(CGSize)size;
- (UIImage*)resizeImageWithMaxWidth:(CGFloat)width;
- (UIImage*)resizeImageWithMaxHeight:(CGFloat)height;

+ (UIImage *)ImageWithColor:(UIColor*)color size:(CGSize)size;

@end
