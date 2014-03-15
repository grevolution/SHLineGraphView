// SHLineGraphView.m
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

#import "SHLineGraphView.h"
#import <math.h>
#import "PopoverView.h"

#define BOTTOM_MARGIN_TO_LEAVE 30
#define TOP_MARGIN_TO_LEAVE 30
#define INTERVAL_COUNT 9
#define LEFT_MARGIN_TO_LEAVE 100
#define PLOT_WIDTH 699.0F

#define FONT_WITH_SIZE(val) [UIFont fontWithName:@"TrebuchetMS" size:val]


@implementation SHLineGraphView
{
  CGPoint *xPoints;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupTheView {
  //draw x-labels
  [self drawXLabels];
  
  //draw y-axis labels
  [self drawYLabels];
  
  //draw the grey lines
  [self drawLines];
  
  /*
   actual plot drawing
   */
  [self drawPlot];
  
}

- (int)getIndexForValue:(NSNumber *)value {
  for(int i=0; i< _xAxisValues.count; i++) {
    NSDictionary *d = [_xAxisValues objectAtIndex:i];
    __block BOOL foundValue = NO;
    [d enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      NSNumber *k = (NSNumber *)key;
      if([k doubleValue] == [value doubleValue]) {
        foundValue = YES;
        *stop = foundValue;
      }
    }];
    if(foundValue){
      return i;
    }
  }
  return -1;
}

- (void)drawPlot {
  //
  CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
  backgroundLayer.frame = self.bounds;
  backgroundLayer.fillColor = [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5].CGColor;
  backgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
  [backgroundLayer setStrokeColor:[UIColor clearColor].CGColor];
  [backgroundLayer setLineWidth:2];

  CGMutablePathRef backgroundPath = CGPathCreateMutable();

  //
  CAShapeLayer *circleLayer = [CAShapeLayer layer];
  circleLayer.frame = self.bounds;
  circleLayer.fillColor = [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1].CGColor;
  circleLayer.backgroundColor = [UIColor clearColor].CGColor;
  [circleLayer setStrokeColor:[UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1].CGColor];
  [circleLayer setLineWidth:2];
  
  CGMutablePathRef circlePath = CGPathCreateMutable();

  //
  CAShapeLayer *graphLayer = [CAShapeLayer layer];
  graphLayer.frame = self.bounds;
  graphLayer.fillColor = [UIColor clearColor].CGColor;
  graphLayer.backgroundColor = [UIColor clearColor].CGColor;
  [graphLayer setStrokeColor:[UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1].CGColor];
  [graphLayer setLineWidth:2];
  
  CGMutablePathRef graphPath = CGPathCreateMutable();
  
  double yRange = [_yAxisRange doubleValue]; // this value will be in dollars
  double yIntervalValue = yRange / INTERVAL_COUNT;
  
  //logic to fill the graph path, ciricle path, background path.
  //230 - ((230 / 58) * 22)
  [_plottingValues enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSDictionary *dic = (NSDictionary *)obj;
    
    __block NSNumber *_key = nil;
    __block NSNumber *_value = nil;
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      _key = (NSNumber *)key;
      _value = (NSNumber *)obj;
    }];
    
    int xIndex = [self getIndexForValue:_key];
    
    //x value
    double height = self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE;
    double y = height - ((height / ([_yAxisRange intValue] + yIntervalValue)) * [_value doubleValue]);
    (xPoints[xIndex]).x = ceil((xPoints[xIndex]).x);
    (xPoints[xIndex]).y = ceil(y);
  }];
  
  //move to initial point for path and background.
  CGPathMoveToPoint(graphPath, NULL, LEFT_MARGIN_TO_LEAVE, xPoints[0].y);
  CGPathMoveToPoint(backgroundPath, NULL, LEFT_MARGIN_TO_LEAVE, xPoints[0].y);
  
  int count = _xAxisValues.count;
  for(int i=0; i< count; i++){
    CGPoint point = xPoints[i];
    CGPathAddLineToPoint(graphPath, NULL, point.x, point.y);
    CGPathAddLineToPoint(backgroundPath, NULL, point.x, point.y);
    CGPathAddEllipseInRect(circlePath, NULL, CGRectMake(point.x - 5, point.y - 5, 10, 10));
  }
  
  //move to initial point for path and background.
  CGPathAddLineToPoint(graphPath, NULL, LEFT_MARGIN_TO_LEAVE + PLOT_WIDTH, xPoints[count -1].y);
  CGPathAddLineToPoint(backgroundPath, NULL, LEFT_MARGIN_TO_LEAVE + PLOT_WIDTH, xPoints[count - 1].y);
  
  //additional points for background.
  CGPathAddLineToPoint(backgroundPath, NULL, LEFT_MARGIN_TO_LEAVE + PLOT_WIDTH, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
  CGPathAddLineToPoint(backgroundPath, NULL, LEFT_MARGIN_TO_LEAVE, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
  CGPathCloseSubpath(backgroundPath);
  
  backgroundLayer.path = backgroundPath;
  graphLayer.path = graphPath;
  circleLayer.path = circlePath;
  
  //animation
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  animation.duration = 1;
  animation.fromValue = @(0.0);
  animation.toValue = @(1.0);
  [graphLayer addAnimation:animation forKey:@"strokeEnd"];
  
  backgroundLayer.zPosition = 0;
  graphLayer.zPosition = 1;
  circleLayer.zPosition = 2;
  
  [self.layer addSublayer:graphLayer];
  [self.layer addSublayer:circleLayer];
  [self.layer addSublayer:backgroundLayer];
	
	NSUInteger count2 = _xAxisValues.count;
	for(int i=0; i< count2; i++){
		CGPoint point = xPoints[i];
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = [UIColor clearColor];
		btn.tag = i;
		btn.frame = CGRectMake(point.x - 10, point.y - 10, 20, 20);
		[btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:btn];
	}
}

- (void)clicked:(id)sender
{
	@try {
		UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
		lbl.backgroundColor = [UIColor clearColor];
		NSUInteger tag = ((UIButton *)sender).tag;
		NSString *text = [_plottingPointsLabels objectAtIndex:tag];
		
		lbl.text = text;
		lbl.textColor = [UIColor whiteColor];
		lbl.textAlignment = NSTextAlignmentCenter;
		lbl.font = FONT_WITH_SIZE(18);
		[lbl sizeToFit];
		lbl.frame = CGRectMake(0, 0, lbl.frame.size.width + 5, lbl.frame.size.height);
		
		CGPoint point =((UIButton *)sender).center;
		point.y -= 15;
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[PopoverView showPopoverAtPoint:point
									 inView:self
							withContentView:lbl
								   delegate:nil];
		});
	}
	@catch (NSException *exception) {
		NSLog(@"plotting label is not available for this point");
	}
}


- (void)drawXLabels {
  int xIntervalCount = _xAxisValues.count;
  double xIntervalInPx = PLOT_WIDTH / _xAxisValues.count;
  
  //initialize actual x points values where the circle will be
  xPoints = calloc(sizeof(CGPoint), xIntervalCount);
  
  for(int i=0; i < xIntervalCount; i++){
    CGPoint currentLabelPoint = CGPointMake((xIntervalInPx * i) + LEFT_MARGIN_TO_LEAVE, self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE);
    CGRect xLabelFrame = CGRectMake(currentLabelPoint.x , currentLabelPoint.y, xIntervalInPx, BOTTOM_MARGIN_TO_LEAVE);
    
    xPoints[i] = CGPointMake((int) xLabelFrame.origin.x + (xLabelFrame.size.width /2) , (int) 0);
    
    UILabel *yAxisLabel = [[UILabel alloc] initWithFrame:xLabelFrame];
    yAxisLabel.backgroundColor = [UIColor clearColor];
    yAxisLabel.font = FONT_WITH_SIZE(10);
    
    yAxisLabel.textColor = [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4];
    yAxisLabel.textAlignment = NSTextAlignmentCenter;
    
    NSDictionary *dic = [_xAxisValues objectAtIndex:i];
    __block NSString *xLabel = nil;
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      xLabel = (NSString *)obj;
    }];
    
    yAxisLabel.text = [NSString stringWithFormat:@"%@", xLabel];
    [self addSubview:yAxisLabel];
    
  }
}

- (void)drawYLabels {
  double yRange = [_yAxisRange doubleValue]; // this value will be in dollars
  double yIntervalValue = yRange / INTERVAL_COUNT;
  double intervalInPx = (self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE ) / (INTERVAL_COUNT +1);
  for(int i= INTERVAL_COUNT + 1; i >= 0; i--){
    CGPoint currentLinePoint = CGPointMake(LEFT_MARGIN_TO_LEAVE, i * intervalInPx);
    CGRect lableFrame = CGRectMake(0, currentLinePoint.y - (intervalInPx / 2), 100, intervalInPx);
    
    if(i != 0) {
      UILabel *yAxisLabel = [[UILabel alloc] initWithFrame:lableFrame];
      yAxisLabel.backgroundColor = [UIColor clearColor];
      yAxisLabel.font = FONT_WITH_SIZE(10);
      yAxisLabel.textColor = [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4];
      yAxisLabel.textAlignment = NSTextAlignmentCenter;
      yAxisLabel.text = [NSString stringWithFormat:@"%.1f%@", (yIntervalValue * (10 - i)), _yAxisSuffix];
      [self addSubview:yAxisLabel];
    }
  }
}

- (void)drawLines {

  CAShapeLayer *linesLayer = [CAShapeLayer layer];
  linesLayer.frame = self.bounds;
  linesLayer.fillColor = [UIColor clearColor].CGColor;
  linesLayer.backgroundColor = [UIColor clearColor].CGColor;
  linesLayer.strokeColor = [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4].CGColor;
  linesLayer.lineWidth = 1;
  
  CGMutablePathRef linesPath = CGPathCreateMutable();
  
  double intervalInPx = (self.bounds.size.height - BOTTOM_MARGIN_TO_LEAVE) / (INTERVAL_COUNT + 1);
  for(int i= INTERVAL_COUNT + 1; i >=0; i--){
    
    CGPoint currentLinePoint = CGPointMake(LEFT_MARGIN_TO_LEAVE, (i * intervalInPx));
    
    CGPathMoveToPoint(linesPath, NULL, currentLinePoint.x, currentLinePoint.y);
    CGPathAddLineToPoint(linesPath, NULL, currentLinePoint.x + PLOT_WIDTH, currentLinePoint.y);
  }
  
  linesLayer.path = linesPath;
  [self.layer addSublayer:linesLayer];
}

- (void)awakeFromNib {
  
}

@end
