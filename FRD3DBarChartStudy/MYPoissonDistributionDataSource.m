//
//  MYPoissonDistributionDataSource.m
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYPoissonDistributionDataSource.h"

#import "NSBundle+MYBundle.h"

static const CGFloat InitialLambda = 3.5f;

@implementation MYPoissonDistributionDataSource

#pragma mark - Lifecyle methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lambda = InitialLambda;
        self.numberOfColumns = 10;
        self.numberOfRows = 2;
        
        NSLog(@"%@", [[NSBundle mainBundle] myDataSetArray]);
    }
    return self;
}



@end
