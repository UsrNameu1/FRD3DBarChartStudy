//
//  MYViewController.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/28.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartViewController.h"

#import "MYGaussianDistributionDataSource.h"

#import "FRD3DBarChartViewController.h"

@interface MY3DChartViewController ()

/**
 *  コンテナビューに入れられたチャート表示のためのViewControllerです。
 */
@property (weak, nonatomic) FRD3DBarChartViewController *chartViewController;

/**
 *  チャート表示に必要なデータを提供するデータソースオブジェクトです。
 */
@property (nonatomic) id<FRD3DBarChartViewControllerDelegate> chartDataSource;

- (IBAction)avarageXSliderValueChanged:(UISlider *)sender;

- (IBAction)avarageYSliderVallueChanged:(UISlider *)sender;

@end

@implementation MY3DChartViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _chartDataSource = [MYGaussianDistributionDataSource new];
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
        MYGaussianDistributionDataSource *chartDataSource = self.chartDataSource;
        chartDataSource.maxValue = 0.20f;
        
        self.chartViewController = segue.destinationViewController;
        self.chartViewController.frd3dBarChartDelegate = chartDataSource;
    }
}

- (IBAction)avarageXSliderValueChanged:(UISlider *)sender {
}

- (IBAction)avarageYSliderVallueChanged:(UISlider *)sender {
}
@end
