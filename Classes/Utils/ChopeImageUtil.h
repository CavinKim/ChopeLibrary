//
//  ChopeImageUtil.h
//  LibrarySeat
//
//  Created by Hyun Gook Yoon on 2013. 11. 30..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeImageUtil : NSObject

+ (UIImage*)blurredImage:(UIImage*)image;
+ (UIImage*)capturedImageFromView:(UIView*)view;

@end
