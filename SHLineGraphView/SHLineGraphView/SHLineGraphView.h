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

@property (nonatomic, strong) NSArray *xAxisValues;
@property (nonatomic, strong) NSNumber *yAxisRange;
@property (nonatomic, strong) NSString *yAxisSuffix;

/**
 *  readyonly dictionary that stores all the plots in the graph.
 */
@property (nonatomic, readonly, strong) NSMutableArray *plots;

/**
 *  theme attributes dictionary. you can specify graph theme releated attributes in this dictionary.
 */
@property (nonatomic, strong) NSDictionary *themeAttributes;

- (void)addPlot:(SHPlot *)newPlot;
- (void)setupTheView;


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
 *  plot background line stroke color key. use this to define the stroke color of the background lines in plot (UIColor*)
 */
UIKIT_EXTERN NSString *const kPlotBackgroundLineColorKye;

@end
