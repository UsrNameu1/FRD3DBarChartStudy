//
//  MY3DChartDataSourceBase.h
//  FRD3DBarChartStudy
//
//  Created by adachi yuichi on 2014/05/12.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FRD3DBarChartViewController.h"

/**
 *  3Dチャートの基底クラスです。
 */
@interface MY3DChartDataSourceBase : NSObject <FRD3DBarChartViewControllerDelegate>

/**
 *  3Dチャートの列の数です。
 */
@property (nonatomic) NSUInteger numberOfColumns;

/**
 *  3Dチャートの行の数です。
 */
@property (nonatomic) NSUInteger numberOfRows;

/**
 *  3Dチャートで表示する値の最大値です。
 */
@property (nonatomic) CGFloat maxValue;

@end
