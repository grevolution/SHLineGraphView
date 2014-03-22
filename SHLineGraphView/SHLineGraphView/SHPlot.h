// SHPlot.h
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

#import <Foundation/Foundation.h>

@interface SHPlot : NSObject

/**
 *  Array of dictionaries, where the key is the same as the one which you specified in the `xAxisValues` in `SHLineGraphView`, 
 *  the value is the number which will determine the point location along the y-axis line. make sure the values are not 
 *  greater than the `yAxisRange` specified in `SHLineGraphView`.
 */
@property (nonatomic, strong) NSArray *plottingValues;

/**
 *  this is an optional array of `NSString` that specifies the labels to show on the particular points. when user clicks on
 *  a particular points, a popover view is shown and will show the particular label on for that point, that is specified 
 *  in this array.
 */
@property (nonatomic, strong) NSArray *plottingPointsLabels;

/**
 *  for internal use
 */
@property (nonatomic) CGPoint *xPoints;

/**
 *  the dictionary which you can use to assing the theme attributes of the plot. if this property is nil, a default theme
 *  is applied selected and the graph is plotted with those default settings.
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
