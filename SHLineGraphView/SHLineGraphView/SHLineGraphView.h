// SHLineGraphView.h
//
// Copyright (c) 2014 Shan Ul Haq (http://grevolution.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <UIKit/UIKit.h>

@class SHPlot;

@interface SHLineGraphView : UIView

/**
 *  an Array of dictionaries specifying the key/value pair where key is the object which will identify a particular
 *  x point on the x-axis line. and the value is the label which you want to show on x-axis against that point on x-axis.
 *  the keys are important here as when plotting the actual points on the graph, you will have to use the same key to
 *  specify the point value for that x-axis point.
 */
@property (nonatomic, strong) NSArray *xAxisValues;

/**
 *  the maximum y-value possible in the graph. make sure that the y-value is not in the plotting points is not greater
 *  then this number. otherwise the graph plotting will show wrong results.
 */
@property (nonatomic, strong) NSNumber *yAxisRange;

/**
 *  y-axis values are calculated according to the yAxisRange passed. so you do not have to pass the explicit labels for 
 *  y-axis, but if you want to put any suffix to the calculated y-values, you can mention it here (e.g. K, M, Kg ...)
 */
@property (nonatomic, strong) NSString *yAxisSuffix;

/**
 *  readyonly dictionary that stores all the plots in the graph.
 */
@property (nonatomic, readonly, strong) NSMutableArray *plots;

/**
 *  theme attributes dictionary. you can specify graph theme releated attributes in this dictionary. if this property is 
 *  nil, then a default theme setting is applied to the graph.
 */
@property (nonatomic, strong) NSDictionary *themeAttributes;

/**
 *  this method will add a Plot to the graph.
 *
 *  @param newPlot the Plot that you want to draw on the Graph.
 */
- (void)addPlot:(SHPlot *)newPlot;

/**
 *  this method is the actual method which starts the drawing of the graph and does all the magic. call this method when
 *  you are ready and want to show the graph.
 */
- (void)setupTheView;


//===== Theme Attribute Keys =====

/**
 *  x-axis label color key. use this to define the x-axis color of the plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kXAxisLabelColorKey;

/**
 *  x-axis label font key. use this to define the font of the x-axis labels. (UIFont*)
 */
UIKIT_EXTERN NSString *const kXAxisLabelFontKey;

/**
 *  y-axis label color key. use this to define the y-axis label color of the plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kYAxisLabelColorKey;

/**
 *  y-axis label font key. use this to define the font of the y-axis labels. (UIFont*)
 */
UIKIT_EXTERN NSString *const kYAxisLabelFontKey;

/**
 *  y-axis label side margin key. use this to define the font of the y-axis labels side margin. the value will
 *  be equally divided into the both sides of the label. (NSNumber*)
 */
UIKIT_EXTERN NSString *const kYAxisLabelSideMarginsKey;

/**
 *  plot background line stroke color key. use this to define the stroke color of the background lines in plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kPlotBackgroundLineColorKye;

@end
