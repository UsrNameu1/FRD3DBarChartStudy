//
//  MY3DChartDataSource.h
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FRD3DBarChartViewController.h"

/**
 *  x, y に対応する値を返す関数のブロックです
 *
 *  @param x xの入力値
 *  @param y yの入力値
 *
 *  @return 値に対応する関数
 */
typedef CGFloat(^MY3DChartValueFunction)(CGFloat x, CGFloat y);

/**
 *  3Dチャート表示のためのデータソースクラスです。
 */
@interface MY3DChartDataSource : NSObject <FRD3DBarChartViewControllerDelegate>

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

/**
 *  3Dチャートで表示する関数です。
 */
@property (nonatomic, copy) MY3DChartValueFunction valueFunction;

@end
