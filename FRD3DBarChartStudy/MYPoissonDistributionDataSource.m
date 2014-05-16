//
//  MYPoissonDistributionDataSource.m
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYPoissonDistributionDataSource.h"

#import "NSBundle+MYBundle.h"
#import "NSArray+Histgram.h"

/**
 *  底の部分を除いた線の数です
 */
static const int NumberOfLines = 3;

@interface MYPoissonDistributionDataSource ()

/**
 *  データセットをNSNumberのNSArrayに置き換えたものです。
 */
@property (nonatomic) NSArray *dataSetArray;

@end

@implementation MYPoissonDistributionDataSource

#pragma mark - Lifecyle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataSetArray = [[NSBundle mainBundle] myDataSetArray];
        _average = self.dataSetArray.average;
        
        self.numberOfColumns = self.dataSetArray.histgramArray.count;
        self.numberOfRows = 2;
    }
    return self;
}

#pragma mark - FRD3DBarChartViewControllerDelegate

- (float)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                    valueForBarAtRow:(int)row
                              column:(int)column
{
    BOOL valueForDataSet = row == 1;
    return valueForDataSet ?
    [self.dataSetArray.histgramArray[column] integerValue] / (CGFloat)self.dataSetArray.count :
    PoissonDistribution(column, self.average);
}

- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                             legendForRow:(int)row
{
    BOOL valueForDataSet = row == 1;
    return valueForDataSet ?
    @"DataSet" : @"Poisson Distribution";
}

- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                          legendForColumn:(int)column
{
    CGFloat count = column;
    return @(count).stringValue;
}

- (UIColor *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                        colorForBarAtRow:(int)row
                                  column:(int)column
{
    BOOL valueForDataSet = row == 1;
    return valueForDataSet ?
    [UIColor blueColor] : [UIColor greenColor];
}

/**
 *  3Dチャートの底を除いた線の数を決定します。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *
 *  @return 線の数
 */
- (int)frd3DBarChartViewControllerNumberHeightLines:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return NumberOfLines;
}

/**
 *  3Dチャートの各線につけるラベル文字列を決定できます。nilで何も表示しないようにできます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *  @param line                        ラインのインデックス
 *
 *  @return 各線のラベル文字列
 */
- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                       legendForValueLine:(int)line
{
    CGFloat valueForLine = self.maxValue * (line + 1) / (CGFloat)NumberOfLines;
    return @(valueForLine).stringValue;
}

#pragma mark - Private methods

/**
 *  ポアッソン分布を返す関数です。
 *
 *  @param x      xの入力値
 *  @param lambda ポアッソン分布の平均パラメータです。
 *
 *  @return ポアッソン分布の値
 */
CGFloat PoissonDistribution(NSInteger x, CGFloat lambda)
{
    return powf(lambda, x) * expf( - lambda ) / tgammaf(x + 1);
}

@end
