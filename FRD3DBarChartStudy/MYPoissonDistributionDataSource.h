//
//  MYPoissonDistributionDataSource.h
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartDataSourceBase.h"

/**
 *  ポアッソン分布3Dチャート表示のためのデータソースクラスです。
 */
@interface MYPoissonDistributionDataSource : MY3DChartDataSourceBase

/**
 *  ポアッソン分布の平均パラメータです。
 */
@property (nonatomic) CGFloat average;

@end
