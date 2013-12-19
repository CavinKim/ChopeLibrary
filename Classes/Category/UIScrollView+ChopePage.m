//
//  UIScrollView+ChopePage.m
//  ChopeLibrary
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import "UIScrollView+ChopePage.h"

@implementation UIScrollView (ChopePage)

- (CGRect)frameAtPage:(NSUInteger)page
{
    CGRect frame = self.frame;
    frame.origin.x = frame.size.width * page;
    return frame;
}

- (NSUInteger)currentPage
{
    CGFloat pageWidth = self.frame.size.width;
    NSInteger page = floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
    return page;
}

- (void)setPage:(NSUInteger)page
{
    self.contentOffset = CGPointMake(self.frame.size.width * page, 0);
}

- (void)setPrevPage
{
    NSInteger page = [self currentPage] - 1;
    [self setPage:page];
}

- (void)setNextPage
{
    NSInteger page = [self currentPage] + 1;
    [self setPage:page];
}

@end
