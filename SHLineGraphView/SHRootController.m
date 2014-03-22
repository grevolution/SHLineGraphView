//
//  SHRootController.m
//  SHLineGraphView
//
//  Created by SHAN UL HAQ on 23/3/14.
//  Copyright (c) 2014 grevolution. All rights reserved.
//

#import "SHRootController.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"

@interface SHRootController ()

@end

@implementation SHRootController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  //initate the graph view
  SHLineGraphView *_lineGraph = [[SHLineGraphView alloc] initWithFrame:CGRectMake(0, 0, 568, 320)];
  
  //set the main graph area theme attributes
  NSDictionary *_themeAttributes = @{
                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                       kPlotBackgroundLineColorKye : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4]
                       };
  _lineGraph.themeAttributes = _themeAttributes;
  
  //set the line graph attributes
  _lineGraph.yAxisRange = @(98);
  _lineGraph.yAxisSuffix = @"K";
  _lineGraph.xAxisValues = @[
                             @{ @1 : @"JAN" },
                             @{ @2 : @"FEB" },
                             @{ @3 : @"MAR" },
                             @{ @4 : @"APR" },
                             @{ @5 : @"MAY" },
                             @{ @6 : @"JUN" },
                             @{ @7 : @"JUL" },
                             @{ @8 : @"AUG" },
                             @{ @9 : @"SEP" },
                             @{ @10 : @"OCT" },
                             @{ @11 : @"NOV" },
                             @{ @12 : @"DEC" }
                             ];
  
  //create a plot
  SHPlot *_plot1 = [[SHPlot alloc] init];
  
  //set the plot attributes
  _plot1.plottingValues = @[
                                  @{ @1 : @65.8 },
                                  @{ @2 : @20 },
                                  @{ @3 : @23 },
                                  @{ @4 : @22 },
                                  @{ @5 : @12.3 },
                                  @{ @6 : @45.8 },
                                  @{ @7 : @56 },
                                  @{ @8 : @97 },
                                  @{ @9 : @65 },
                                  @{ @10 : @10 },
                                  @{ @11 : @67 },
                                  @{ @12 : @23 }
                                  ];
  NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
  _plot1.plottingPointsLabels = arr;
  
  //set plot theme attributes
  NSDictionary *_plotThemeAttributes = @{
                           kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                           kPlotStrokeWidthKey : @2,
                           kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                           };
  
  _plot1.plotThemeAttributes = _plotThemeAttributes;
  
  [_lineGraph addPlot:_plot1];
  
  
  //create another plot
  SHPlot *_plot2 = [[SHPlot alloc] init];
  
  //set the plot attributes
  _plot2.plottingValues = @[
                            @{ @1 : @22 },
                            @{ @2 : @12.3 },
                            @{ @3 : @45.8 },
                            @{ @4 : @65.8 },
                            @{ @5 : @23 },
                            @{ @6 : @56 },
                            @{ @7 : @20 },
                            @{ @8 : @10 },
                            @{ @9 : @67 },
                            @{ @10 : @97 },
                            @{ @11 : @65 },
                            @{ @12 : @23 }
                            ];

  NSArray *arr2 = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
  _plot2.plottingPointsLabels = arr2;
  
  //set plot themeing attributes.
  NSDictionary *_plotThemeAttributes2 = @{
                           kPlotFillColorKey : [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3],
                           kPlotStrokeWidthKey : @2,
                           kPlotStrokeColorKey : [UIColor colorWithRed:0 green:0 blue:1 alpha:1],
                           kPlotPointFillColorKey : [UIColor colorWithRed:0 green:0 blue:1 alpha:1],
                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                           };

  _plot2.plotThemeAttributes = _plotThemeAttributes2;
  [_lineGraph addPlot:_plot2];

  
  [_lineGraph setupTheView];
  
  [self.view addSubview:_lineGraph];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
	return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationLandscapeLeft;
}


- (NSUInteger)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

@end
