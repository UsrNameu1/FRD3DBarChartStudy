//
//  UIColor+Hex.m
//  FRD3DBarChartStudy
//
//  Created by adachi yuichi on 2014/05/10.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexInteger:(NSUInteger)hexInteger
{
    NSUInteger redInteger = hexInteger >> 4 * 4;
    NSUInteger greenInteger = (hexInteger >> 4 * 2) & 0x0000ff;
    NSUInteger blueInteger = hexInteger & 0x0000ff;
    CGFloat redFloat = redInteger / (CGFloat)0x100;
    CGFloat greenFloat = greenInteger / (CGFloat)0x100;
    CGFloat blueFloat = blueInteger / (CGFloat)0x100;
    
    return [UIColor colorWithRed:redFloat
                           green:greenFloat
                            blue:blueFloat
                           alpha:1.0f];
}

@end
