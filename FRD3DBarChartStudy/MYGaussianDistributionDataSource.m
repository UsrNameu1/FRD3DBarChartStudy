//
//  MYGaussianDistributionDataSource.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYGaussianDistributionDataSource.h"

#import "UIColor+Hex.h"

/**
 *  Xの平均値の初期値です。
 */
static const float InitialaverageX = 0.0f;

/**
 *  Yの平均値の初期値です。
 */
static const float InitialaverageY = 0.0f;

/**
 *  分散の初期値です。
 */
static const float InitialSigma = 6.0f;

@implementation MYGaussianDistributionDataSource

#pragma mark - Lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _averageX = InitialaverageX;
        _averageY = InitialaverageY;
        _sigma = InitialSigma;
    }
    return self;
}

#pragma mark - FRD3DBarChartViewControllerDelegate

/**
 *  3Dチャートの各バーの値を決定します。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *  @param row                         バーの行
 *  @param column                      バーの列
 *
 *  @return 各バーの値
 */
- (float)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                    valueForBarAtRow:(int)row
                              column:(int)column
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    CGFloat y = column - self.numberOfColumns / 2.0f;
    
    return GaussianDistribution(x, y, self.averageX, self.averageY, self.sigma);
}

/**
 *  3Dチャートの各行につけるラベル文字列を決定できます。nilで何も表示しないようにできます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *  @param row                         バーの行
 *
 *  @return 各行のラベル文字列
 */
- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController legendForRow:(int)row
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    NSNumber *xNumber = (NSInteger)x % 5 == 0 ?
    @(x) : nil;
    return [xNumber stringValue];
}

/**
 *  3Dチャートの各列につけるラベル文字列を決定できます。nilで何も表示しないようにできます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *  @param row                         バーの列
 *
 *  @return 各列のラベル文字列
 */
- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController legendForColumn:(int)column
{
    CGFloat y = column - self.numberOfColumns / 2.0f;
    NSNumber *yNumber = (NSInteger)y % 5 == 0 ?
    @(y) : nil;
    return [yNumber stringValue];
}

/**
 *  3Dチャートの各バーのUIColorを決定できます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *  @param row                         バーの行
 *  @param column                      バーの列
 *
 *  @return 各バーのUIColor
 */
- (UIColor *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                        colorForBarAtRow:(int)row
                                  column:(int)column
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    CGFloat y = column - self.numberOfColumns / 2.0f;
    CGFloat colorDepth = GaussianDistribution(x, y, self.averageX, self.averageY, self.sigma) / self.maxValue;
    NSUInteger colorValue = (NSUInteger)(0xff * colorDepth) * 0x10000 + 0x0000ff * (1 - colorDepth);
    return [UIColor colorWithHexInteger:colorValue];
}

#pragma mark - Private methods

/**
 *  ガウシアンを返す関数です
 *
 *  @param x        xの入力値
 *  @param y        yの入力値
 *  @param averageX xの平均値
 *  @param averageY yの平均値
 *  @param sigma    分散
 *
 *  @return ガウシアンの値
 */
CGFloat GaussianDistribution(CGFloat x, CGFloat y, CGFloat averageX, CGFloat averageY, CGFloat sigma)
{
    CGFloat sigmaSquare = sigma * sigma;
    CGFloat deltaXSquare = (x - averageX) * (x - averageX);
    CGFloat deltaYSquare = (y - averageY) * (y - averageY);
    return 1.0f / sqrtf(2 * M_PI * sigmaSquare) * exp2f(- (deltaXSquare + deltaYSquare) / 2.0f / sigmaSquare);
}

@end
