//
//  MYBarChartViewController.m
//  PlotStudy
//
//  Created by adachi yuichi on 2014/05/01.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "MYBarChartViewController.h"

#import "JBBarChartView.h"

@interface MYBarChartViewController () <JBBarChartViewDataSource, JBBarChartViewDelegate>

@property (weak, nonatomic) IBOutlet JBBarChartView *barChartView;

@end

@implementation MYBarChartViewController

#pragma mark - Lifecycle methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.barChartView.dataSource = self;
    self.barChartView.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JBBarChartViewDataSource



#pragma mark - JBBarChartViewDelegate



@end
