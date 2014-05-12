//
//  MYGaussianDistributionDataSource.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYGaussianDistributionDataSource.h"

#import "UIColor+Hex.h"

static const float InitialAvarageX = 2.0f;

static const float InitialAvarageY = -4.0f;

static const float InitialSigma = 4.0f;

@implementation MYGaussianDistributionDataSource

#pragma mark - Lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _avarageX = InitialAvarageX;
        _avarageY = InitialAvarageY;
        _sigma = InitialSigma;
    }
    return self;
}

#pragma mark - FRD3DBarChartViewControllerDelegate

- (float)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                    valueForBarAtRow:(int)row
                              column:(int)column
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    CGFloat y = column - self.numberOfColumns / 2.0f;
    
    return GaussianDistribution(x, y, self.avarageX, self.avarageY, self.sigma);
}

- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController legendForRow:(int)row
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    NSNumber *xNumber = (NSInteger)x % 5 == 0 ?
    @(x) : nil;
    return [xNumber stringValue];
}

- (NSString *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController legendForColumn:(int)column
{
    CGFloat y = column - self.numberOfColumns / 2.0f;
    NSNumber *yNumber = (NSInteger)y % 5 == 0 ?
    @(y) : nil;
    return [yNumber stringValue];
}

- (UIColor *)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                        colorForBarAtRow:(int)row
                                  column:(int)column
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    CGFloat y = column - self.numberOfColumns / 2.0f;
    CGFloat colorDepth = GaussianDistribution(x, y, self.avarageX, self.avarageY, self.sigma) / self.maxValue;
    NSUInteger colorValue = (NSUInteger)(0xff * colorDepth) * 0x10000 + 0x0000ff * (1 - colorDepth);
    return [UIColor colorWithHexInteger:colorValue];
}

#pragma mark - Private methods

/**
 *  ガウシアンを返す関数です
 *
 *  @param x        xの入力値
 *  @param y        yの入力値
 *  @param avarageX xの平均値
 *  @param avarageY yの平均値
 *  @param sigma    分散
 *
 *  @return ガウシアンの値
 */
CGFloat GaussianDistribution(CGFloat x, CGFloat y, CGFloat avarageX, CGFloat avarageY, CGFloat sigma)
{
    CGFloat sigmaSquare = sigma * sigma;
    CGFloat deltaXSquare = (x - avarageX) * (x - avarageX);
    CGFloat deltaYSquare = (y - avarageY) * (y - avarageY);
    return 1.0f / sqrtf(2 * M_PI * sigmaSquare) * exp2f(- (deltaXSquare + deltaYSquare) / 2.0f / sigmaSquare);
}

@end
