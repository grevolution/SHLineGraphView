//
//  SHPlot.h
//  SHLineGraphView
//
//  Created by SHAN UL HAQ on 23/3/14.
//  Copyright (c) 2014 grevolution. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHPlot : NSObject

@property (nonatomic, strong) NSArray *plottingValues;
@property (nonatomic, strong) NSArray *plottingPointsLabels;

//for internal use
@property (nonatomic) CGPoint *xPoints;

/**
 *  the dictionary which you can use to assing the theme attributes of the plot
 */
@property (nonatomic, strong) NSDictionary *plotThemeAttributes;


//following are the theme keys that you will be using to create the theme of the your grpah plot

/**
 *  plot fill color key. use this to define the fill color of the plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kPlotFillColorKey;

/**
 *  plot stroke width key. use this to define the width of the plotting stroke line (in pixels)
 */
UIKIT_EXTERN NSString *const kPlotStrokeWidthKey;

/**
 *  plot stroke color key. use this to define the stroke color of the plotting line (UIColor*)
 */
UIKIT_EXTERN NSString *const kPlotStrokeColorKey;

/**
 *  plot point fill color key. use this to define the fill color of the point in plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kPlotPointFillColorKey;

/**
 *  plotting point value label font key. use this key to define the font of the plotting point label.
 */
UIKIT_EXTERN NSString *const kPlotPointValueFontKey;

@end
