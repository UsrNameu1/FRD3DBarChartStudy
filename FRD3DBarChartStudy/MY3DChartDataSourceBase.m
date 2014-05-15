//
//  MY3DChartDataSourceBase.m
//  FRD3DBarChartStudy
//
//  Created by adachi yuichi on 2014/05/12.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartDataSourceBase.h"

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

@implementation MY3DChartDataSourceBase

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        
        if ([self isMemberOfClass:[MY3DChartDataSourceBase class]]) {
            @throw
            [NSException exceptionWithName:NSInternalInconsistencyException
                                    reason:[NSString stringWithFormat:@"You can't instantiate this abstract class : %@",
                                            NSStringFromClass([self class])]
                                  userInfo:nil];
        }
        
        _numberOfColumns = InitialNumberOfColumns;
        _numberOfRows = InitialNumberOfRows;
        _maxValue = InitialMaxValue;
    }
    return self;
}

/**
 *  3Dチャートのバーの列の個数を決定できます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *
 *  @return バーの列の個数
 */
- (int)frd3DBarChartViewControllerNumberColumns:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return (int)self.numberOfColumns;
}

/**
 *  3Dチャートのバーの行の個数を決定できます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *
 *  @return バーの行の個数
 */
- (int)frd3DBarChartViewControllerNumberRows:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return (int)self.numberOfRows;
}

/**
 *  3Dチャートの表示するバーの最大値を決定できます。
 *
 *  @param frd3DBarChartViewController 3Dチャート表示のためのViewController
 *
 *  @return バーの最大値
 */
- (float)frd3DBarChartViewControllerMaxValue:(FRD3DBarChartViewController *)frd3DBarChartViewController
{
    return (float)self.maxValue;
}

- (float)frd3DBarChartViewController:(FRD3DBarChartViewController *)frd3DBarChartViewController
                    valueForBarAtRow:(int)row
                              column:(int)column
{
    @throw
    [NSException exceptionWithName:NSInternalInconsistencyException
                            reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                          userInfo:nil];
}

@end
