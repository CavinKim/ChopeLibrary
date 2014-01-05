//
//  ChopeImageService.h
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 31..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChopeImageService : NSObject

@property (nonatomic, retain) UIImageView *imageView;

- (void)imageView:(UIImageView*)imageView url:(NSString*)url;

@end
