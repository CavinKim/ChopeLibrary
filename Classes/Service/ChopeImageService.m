//
//  ChopeImageService.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "ChopeImageService.h"
#import "TMCache.h"
#import <WebP/decode.h>
#import "UIImageView+AFNetworking.h"

@implementation ChopeImageService


- (void)imageView:(UIImageView*)imageView url:(NSString*)url
{
    if (!self.imageView) {
        self.imageView = [[UIImageView alloc] init];
    }
    
    NSString *key = [NSString stringWithFormat:@"image_%@",url];
    
    [[TMCache sharedCache] objectForKey:key
                                  block:^(TMCache *cache, NSString *key, id object) {
                                      if (object) {
                                          UIImage *image = (UIImage *)object;
//                                          [imageView setImage:image];
                                          NSLog(@"image scale: %f", image.scale);
                                          
                                          [imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
                                      }
                                      else {
                                          NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
                                          [self.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                              [imageView setImage:image];
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [[TMCache sharedCache] setObject:image forKey:key];
                                              });
                                          } failure:nil];
                                      }
                                  }];
}


#pragma mark - WebP Format
static void free_image_data(void *info, const void *data, size_t size)
{
    if (info != NULL) {
        WebPFreeDecBuffer(&(((WebPDecoderConfig *)info)->output));
    }
    else {
        free((void *)data);
    }
}

- (UIImage*)decodeWebp:(NSData*)myData
{
    NSLog(@"* * * * * * * * * * *");
    
    NSDate *startTime = [NSDate date];
    
    // Find the path of the selected WebP image in the bundle and read it into memory
    //    NSData *myData = UIImagePNGRepresentation(webpImage);
    
    NSLog(@"Time to read data: %0.2fms", [startTime timeIntervalSinceNow] * -1000.0);
    
    // Get the current version of the WebP decoder
    int rc = WebPGetDecoderVersion();
    
    NSLog(@"Version: %d", rc);
    
    startTime = [NSDate date];
    
    // Get the width and height of the selected WebP image
    int width = 0;
    int height = 0;
    WebPGetInfo([myData bytes], [myData length], &width, &height);
    
    NSLog(@"Time to read info: %0.2fms", [startTime timeIntervalSinceNow] * -1000.0);
    
    NSLog(@"Image Width: %d Image Height: %d", width, height);
    
    CGDataProviderRef provider;
    
    startTime = [NSDate date];
    
    // Decode the WebP image data into a RGBA value array
    uint8_t *data = WebPDecodeRGBA([myData bytes], [myData length], &width, &height);
    
    NSLog(@"Time to decode WebP data: %0.2fms", [startTime timeIntervalSinceNow] * -1000.0);
    
    startTime = [NSDate date];
    
    // Construct a UIImage from the decoded RGBA value array
    provider = CGDataProviderCreateWithData(NULL, data, width*height*4, free_image_data);
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    CGImageRef imageRef = CGImageCreate(width, height, 8, 32, 4*width, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    
    NSLog(@"Time to contruct UIImage from RGBA: %0.2fms", [startTime timeIntervalSinceNow] * -1000.0);
    
    CGImageRelease(imageRef);
    CGColorSpaceRelease(colorSpaceRef);
    CGDataProviderRelease(provider);
    
    return newImage;
}

@end
