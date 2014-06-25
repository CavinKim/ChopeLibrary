//
//  UIColor+ChopeColor.m
//  CPApplication
//
//  Created by Chope on 2014. 6. 5..
//  Copyright (c) 2014년 Chope. All rights reserved.
//

#import "UIColor+ChopeColor.h"

@implementation UIColor (ChopeColor)

#pragma mark - Color Tools
+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)colorWithIntegerRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
    return [UIColor colorWithIntegerRed:red green:green blue:blue alpha:1.0];
}


#pragma mark - Flat Color (http://flatuicolors.com)
+ (UIColor *)turquoiseFlatColor {
    return [UIColor colorWithIntegerRed:26 green:188 blue:156];
}

+ (UIColor *)greenSeaFlatColor {
    return [UIColor colorWithIntegerRed:22 green:160 blue:133];
}

+ (UIColor *)emeraldFlatColor {
    return [UIColor colorWithIntegerRed:46 green:204 blue:113];
}

+ (UIColor *)nephritisFlatColor {
    return [UIColor colorWithIntegerRed:39 green:174 blue:96];
}

+ (UIColor *)peterRiverFlatColor {
    return [UIColor colorWithIntegerRed:52 green:152 blue:219];
}

+ (UIColor *)belizeHoleFlatColor {
    return [UIColor colorWithIntegerRed:41 green:128 blue:185];
}

+ (UIColor *)sunFlowerFlatColor {
    return [UIColor colorWithIntegerRed:241 green:196 blue:15];
}

+ (UIColor *)orangeFlatColor {
    return [UIColor colorWithIntegerRed:243 green:156 blue:18];
}

+ (UIColor *)carrotFlatColor {
    return [UIColor colorWithIntegerRed:230 green:126 blue:34];
}

+ (UIColor *)pumpkinFlatColor {
    return [UIColor colorWithIntegerRed:211 green:84 blue:0];
}

+ (UIColor *)alizarinFlatColor {
    return [UIColor colorWithIntegerRed:231 green:76 blue:60];
}

+ (UIColor *)pomegranateFlatColor {
    return [UIColor colorWithIntegerRed:192 green:57 blue:43];
}

+ (UIColor *)amethystFlatColor {
    return [UIColor colorWithIntegerRed:155 green:89 blue:182];
}

+ (UIColor *)wisteriaFlatColor {
    return [UIColor colorWithIntegerRed:142 green:68 blue:173];
}

+ (UIColor *)cloudsFlatColor {
    return [UIColor colorWithIntegerRed:236 green:240 blue:241];
}

+ (UIColor *)silverFlatColor {
    return [UIColor colorWithIntegerRed:189 green:195 blue:199];
}

+ (UIColor *)concreteFlatColor {
    return [UIColor colorWithIntegerRed:149 green:165 blue:166];
}

+ (UIColor *)asbestosFlatColor {
    return [UIColor colorWithIntegerRed:127 green:140 blue:141];
}

+ (UIColor *)wetAsphaltFlatColor {
    return [UIColor colorWithIntegerRed:52 green:73 blue:94];
}

+ (UIColor *)midnightBlueFlatColor {
    return [UIColor colorWithIntegerRed:44 green:62 blue:80];
}

@end
