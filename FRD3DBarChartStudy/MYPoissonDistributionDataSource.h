//
//  MYPoissonDistributionDataSource.h
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartDataSourceBase.h"

@interface MYPoissonDistributionDataSource : MY3DChartDataSourceBase

/**
 *  ポアッソン分布のパラメータラムダです。
 */
@property (nonatomic) CGFloat lambda;

@end
