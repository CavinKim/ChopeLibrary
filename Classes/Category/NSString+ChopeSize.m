//
//  NSString+ChopeSize.m
//  ChopeLibrary
//
//  Created by Hyun Gook Yoon on 2013. 12. 6..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "NSString+ChopeSize.h"

@implementation NSString (ChopeSize)

- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont*)font
{
    CGSize resultSize = [self boundingRectWithSize:size
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{ NSFontAttributeName:font }
                                           context:nil].size;
    
    resultSize.width = ceil(resultSize.width);
    resultSize.height = ceil(resultSize.height);
    
    return resultSize;
}

- (CGSize)boundingRectWithMaxWidth:(CGFloat)width font:(UIFont*)font
{
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        font:font];
    return size;
}

- (CGSize)boundingRectWithMinWidth:(CGFloat)width font:(UIFont*)font
{
    CGSize size = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                        font:font];
    size.width = size.width < width ? width : size.width;
    return size;
}

@end
