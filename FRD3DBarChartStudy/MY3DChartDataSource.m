//
//  MY3DChartDataSource.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartDataSource.h"

/**
 *  列数の初期値です。
 */
static const NSUInteger InitialNumberOfColumns = 30;

/**
 *  行数の初期値です。
 */
static const NSUInteger InitialNumberOfRows = 30;

/**
 *  表示最大値の初期値です。
 */
static const CGFloat InitialMaxValue = 1.0f;

@implementation MY3DChartDataSource

#pragma mark - Lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfColumns = InitialNumberOfColumns;
        _numberOfRows = InitialNumberOfRows;
        _maxValue = InitialMaxValue;
        _valueFunction = ^CGFloat(CGFloat x, CGFloat y) {
            return 1.0f;
        };
    }
    return self;
}

#pragma mark - FRD3DBarChartViewControllerDelegate

- (int)frd3DBarChartViewControllerNumberColumns:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return (int)self.numberOfColumns;
}

- (int)frd3DBarChartViewControllerNumberRows:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return (int)self.numberOfRows;
}

- (float)frd3DBarChartViewControllerMaxValue:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return self.maxValue;
}

- (float)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                    valueForBarAtRow:(int)row
                              column:(int)column
{
    CGFloat x = row - self.numberOfRows / 2.0f;
    CGFloat y = column - self.numberOfColumns / 2.0f;
    
    return self.valueFunction(x, y);
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

@end
