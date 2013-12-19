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
    CGSize resultSize;
    
#ifdef __IPHONE_7_0
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:context:)]) {
        resultSize = [self boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{ NSFontAttributeName:font }
                                        context:nil].size;
    }
    else {
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wdeprecated-declarations"
        resultSize = [self sizeWithFont:font
                      constrainedToSize:size
                          lineBreakMode:NSLineBreakByWordWrapping];
#   pragma clang diagnostic pop
    }
#else
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wdeprecated-declarations"
    resultSize = [self sizeWithFont:font
                  constrainedToSize:size
                      lineBreakMode:NSLineBreakByWordWrapping];
#   pragma clang diagnostic pop
#endif
    resultSize.width = ceil(resultSize.width);
    resultSize.height = ceil(resultSize.height);
    
    return resultSize;
}

@end
