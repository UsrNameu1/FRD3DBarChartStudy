//
//  MYGaussianChartViewController.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/28.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYGaussianChartViewController.h"

#import "MYGaussianDistributionDataSource.h"

#import "FRD3DBarChartViewController.h"

static NSString *const AverageXLabelFormatString = @"avX:%.1f";
static NSString *const AverageYLabelFormatString = @"avY:%.1f";
static NSString *const SigmaLabelFormatString = @"σ:%.1f";

static const NSTimeInterval AnimationTimeInterval = 2.0f;

@interface MYGaussianChartViewController ()

/**
 *  コンテナビューに入れられたチャート表示のためのViewControllerです。
 */
@property (weak, nonatomic) FRD3DBarChartViewController *chartViewController;

/**
 *  チャート表示に必要なデータを提供するデータソースオブジェクトです。
 */
@property (nonatomic) id<FRD3DBarChartViewControllerDelegate> chartDataSource;

@property (weak, nonatomic) IBOutlet UILabel *averageXLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageYLabel;
@property (weak, nonatomic) IBOutlet UILabel *sigmaLabel;

- (IBAction)averageXSliderValueChanged:(UISlider *)sender;
- (IBAction)averageXSliderDidTouchUp:(UISlider *)sender;

- (IBAction)averageYSliderValueChanged:(UISlider *)sender;
- (IBAction)averageYSliderDidTouchUp:(UISlider *)sender;

- (IBAction)sigmaSliderValueChanged:(UISlider *)sender;
- (IBAction)sigmaSliderDidTouchUp:(UISlider *)sender;

@end

@implementation MYGaussianChartViewController

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

#pragma mark - Handler methods

- (IBAction)averageXSliderValueChanged:(UISlider *)sender
{
    self.averageXLabel.text =
    [NSString stringWithFormat:AverageXLabelFormatString, sender.value];
}

- (IBAction)averageYSliderValueChanged:(UISlider *)sender
{
    self.averageYLabel.text =
    [NSString stringWithFormat:AverageYLabelFormatString, sender.value];
}

- (IBAction)sigmaSliderValueChanged:(UISlider *)sender
{
    self.sigmaLabel.text =
    [NSString stringWithFormat:SigmaLabelFormatString, sender.value];
}


- (IBAction)averageYSliderDidTouchUp:(UISlider *)sender
{
    MYGaussianDistributionDataSource *dataSource = self.chartDataSource;
    dataSource.averageX = sender.value;
    
    // データソースの値に応じてグラフをアニメーション付きでアップデートします。
    [self.chartViewController updateChartAnimated:YES
                                animationDuration:AnimationTimeInterval
                                          options:kUpdateChartOptionsDoNotUpdateValueLegend];
}

- (IBAction)averageXSliderDidTouchUp:(UISlider *)sender
{
    MYGaussianDistributionDataSource *dataSource = self.chartDataSource;
    dataSource.averageY = sender.value;
    
    // データソースの値に応じてグラフをアニメーション付きでアップデートします。
    [self.chartViewController updateChartAnimated:YES
                                animationDuration:AnimationTimeInterval
                                          options:kUpdateChartOptionsDoNotUpdateValueLegend];
}

- (IBAction)sigmaSliderDidTouchUp:(UISlider *)sender
{
    MYGaussianDistributionDataSource *dataSource = self.chartDataSource;
    dataSource.sigma = sender.value;
    
    [self.chartViewController updateChartAnimated:YES
                                animationDuration:AnimationTimeInterval
                                          options:kUpdateChartOptionsDoNotUpdateValueLegend];
}

@end
