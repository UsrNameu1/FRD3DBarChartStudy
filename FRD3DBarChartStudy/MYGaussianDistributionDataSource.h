//
//  MYGaussianDistributionDataSource.h
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/29.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MY3DChartDataSourceBase.h"

/**
 *  正規分布3Dチャート表示のためのデータソースクラスです。
 */
@interface MYGaussianDistributionDataSource : MY3DChartDataSourceBase

/**
 *  Xの平均値です
 */
@property (nonatomic) float averageX;

/**
 *  Yの平均値です
 */
@property (nonatomic) float averageY;

/**
 *  分散です
 */
@property (nonatomic) float sigma;

@end
