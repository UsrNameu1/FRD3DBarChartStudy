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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewController methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:NSStringFromClass([FRD3DBarChartViewController class])]) {
        MY3DChartDataSource *chartDataSource = self.chartDataSource;
        chartDataSource.valueFunction = ^CGFloat(CGFloat x, CGFloat y) {
            return GaussianDistribution(x, y, 2.0f, -4.0f, 3.0f);
        };
        
        self.chartViewController = segue.destinationViewController;
        self.chartViewController.frd3dBarChartDelegate = chartDataSource;
    }
}

#pragma mark - Private methods

CGFloat GaussianDistribution(CGFloat x, CGFloat y, CGFloat avarageX, CGFloat avarageY, CGFloat sigma)
{
    CGFloat sigmaSquare = sigma * sigma;
    CGFloat deltaXSquare = (x - avarageX) * (x - avarageX);
    CGFloat deltaYSquare = (y - avarageY) * (y - avarageY);
    return 1.0f / sqrtf(2 * M_PI * sigmaSquare) * exp2f(- (deltaXSquare + deltaYSquare) / 2.0f / sigmaSquare);
}

@end
