//
//  MYViewController.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/04/28.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MY3DChartViewController.h"

#import "MY3DChartDataSource.h"

#import "FRD3DBarChartViewController.h"

@interface MY3DChartViewController ()

@property (weak, nonatomic) FRD3DBarChartViewController *chartViewController;

@property (nonatomic) id<FRD3DBarChartViewControllerDelegate> chartDataSource;

@end

@implementation MY3DChartViewController

#pragma mark - Lifecycle methods

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _chartDataSource = [MY3DChartDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.chartViewController updateChartAnimated:NO
                                animationDuration:0.0f
                                          options:kUpdateChartOptionsDoNotUpdateLegends];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.chartViewController updateChartAnimated:YES
                                animationDuration:1.0f
                                          options:kUpdateChartOptionsDoNotUpdateLegends];
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
        self.chartViewController = segue.destinationViewController;
        self.chartViewController.frd3dBarChartDelegate = self.chartDataSource;
    }
}

@end
