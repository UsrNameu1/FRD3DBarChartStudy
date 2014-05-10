//
//  UIColor+Hex.h
//  FRD3DBarChartStudy
//
//  Created by adachi yuichi on 2014/05/10.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  六桁の16進数表現整数 (cf. 0xff0000 : 赤) から UIColor を生成します。
 *
 *  @param hexInteger UIColorを16進数表現したもの
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexInteger:(NSUInteger)hexInteger;

@end
