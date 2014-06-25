//
//  UIColor+ChopeColor.h
//  CPApplication
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ChopeColor)

+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;


#pragma mark - Flat Color (http://flatuicolors.com)
+ (UIColor *)turquoiseFlatColor;
+ (UIColor *)greenSeaFlatColor;
+ (UIColor *)emeraldFlatColor;
+ (UIColor *)nephritisFlatColor;
+ (UIColor *)peterRiverFlatColor;
+ (UIColor *)belizeHoleFlatColor;
+ (UIColor *)sunFlowerFlatColor;
+ (UIColor *)orangeFlatColor;
+ (UIColor *)carrotFlatColor;
+ (UIColor *)pumpkinFlatColor;
+ (UIColor *)alizarinFlatColor;
+ (UIColor *)pomegranateFlatColor;
+ (UIColor *)amethystFlatColor;
+ (UIColor *)wisteriaFlatColor;
+ (UIColor *)cloudsFlatColor;
+ (UIColor *)silverFlatColor;
+ (UIColor *)concreteFlatColor;
+ (UIColor *)asbestosFlatColor;
+ (UIColor *)wetAsphaltFlatColor;
+ (UIColor *)midnightBlueFlatColor;

@end
