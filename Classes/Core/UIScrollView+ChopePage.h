//
//  UIScrollView+ChopePage.h
//  CPApplication
//
//  Created by Chope on 2013. 12. 19..
//  Copyright (c) 2013년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ChopePage)

- (CGRect)frameAtPage:(NSUInteger)page;
- (NSUInteger)currentPage;
- (void)setPage:(NSUInteger)page;
- (void)setPrevPage;
- (void)setNextPage;

@end
