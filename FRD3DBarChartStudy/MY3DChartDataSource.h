//
//  MY3DChartDataSource.h
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FRD3DBarChartViewController.h"


@interface MY3DChartDataSource : NSObject <FRD3DBarChartViewControllerDelegate>

@property (nonatomic) NSUInteger numberOfColumns;

@property (nonatomic) NSUInteger numberOfRows;

@property (nonatomic) CGFloat maxValue;

@end
