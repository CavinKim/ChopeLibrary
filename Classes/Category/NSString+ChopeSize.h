//
//  NSString+ChopeSize.h
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ChopeSize)

- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font;

- (CGSize)boundingRectWithMaxWidth:(CGFloat)width font:(UIFont*)font;
- (CGSize)boundingRectWithMinWidth:(CGFloat)width font:(UIFont*)font;

@end
