//
//  SHPlot.m
//  SHLineGraphView
//
//  Created by SHAN UL HAQ on 23/3/14.
//  Copyright (c) 2014 grevolution. All rights reserved.
//

#import "SHPlot.h"

@implementation SHPlot

- (instancetype)init {
  if((self = [super init])) {
    [self loadDefaultTheme];
  }
  return self;
}

- (void)loadDefaultTheme {
  _plotThemeAttributes = @{
                           kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                           kPlotStrokeWidthKey : @2,
                           kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                           kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                           kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
  };
}

#pragma mark - Theme Key Extern Keys

NSString *const kPlotFillColorKey           = @"kPlotFillColorKey";
NSString *const kPlotStrokeWidthKey         = @"kPlotStrokeWidthKey";
NSString *const kPlotStrokeColorKey         = @"kPlotStrokeColorKey";
NSString *const kPlotPointFillColorKey      = @"kPlotPointFillColorKey";
NSString *const kPlotPointValueFontKey      = @"kPlotPointValueFontKey";
@end
