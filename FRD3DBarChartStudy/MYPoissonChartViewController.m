//
//  MYPoissonChartViewController.m
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYPoissonChartViewController.h"

#import "MYPoissonDistributionDataSource.h"

#import "FRD3DBarChartViewController.h"

@interface MYPoissonChartViewController ()

/**
 *  コンテナビューに入れられたチャート表示のためのViewControllerです。
 */
@property (weak, nonatomic) FRD3DBarChartViewController *chartViewController;

/**
 *  チャート表示に必要なデータを提供するデータソースオブジェクトです。
 */
@property (nonatomic) id<FRD3DBarChartViewControllerDelegate> chartDataSource;

@end

@implementation MYPoissonChartViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _chartDataSource = [MYPoissonDistributionDataSource new];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewController methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:NSStringFromClass([FRD3DBarChartViewController class])]) {
        
//        MYGaussianDistributionDataSource *chartDataSource = self.chartDataSource;
//        chartDataSource.maxValue = 0.20f;
//        
//        self.chartViewController = segue.destinationViewController;
//        self.chartViewController.frd3dBarChartDelegate = chartDataSource;
    }
}

@end
