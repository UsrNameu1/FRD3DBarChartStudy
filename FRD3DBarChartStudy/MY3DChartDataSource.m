//
//  MY3DChartDataSource.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartDataSource.h"

static const NSUInteger InitialNumberOfColumns = 30;

static const NSUInteger InitialNumberOfRows = 30;

static const CGFloat InitialMaxValue = 10.0f;

@implementation MY3DChartDataSource

#pragma mark - Lifecycle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfColumns = InitialNumberOfColumns;
        _numberOfRows = InitialNumberOfRows;
        _maxValue = InitialMaxValue;
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
    
    return (1.0f + cosf(sqrtf(x * x + y * y)));
}


@end
