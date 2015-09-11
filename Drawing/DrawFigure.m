//
//  DrawFigure.m
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import "DrawFigure.h"


@interface DrawFigure ()
- (void)figureHub:(DrawFigure*)DFObject :(CGContextRef)currentContext :(CGRect)rect;
- (void)setBackground: (CGContextRef)currentContext;
- (void)drawTriangle: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawRectangle: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawRomb: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawCircle: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawSixangle: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawTrapeze: (CGContextRef)currentContext: (CGRect)rect;
- (void)drawSmile: (CGContextRef)currentContext :(CGRect)rect;
- (void)drawSinusoid :(CGContextRef)currentContext :(CGRect)rect;
- (void)createButtonToReturn;
- (void)drawNAngle:(CGContextRef)currentContext :(CGRect)rect;
- (NSArray*)setPointsForNAngles:(CGRect)rect;
- (UIColor*)getRandomColor;
@end


@implementation DrawFigure


- (id)initWithFigure:(NSInteger)figureType :(CGRect)currentRect
{
  
    UISwipeGestureRecognizer *currentSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    currentSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:currentSwipe];
    UIPanGestureRecognizer *currentPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:currentPan];
    [self setLastLocation:currentRect.origin];
    [self setBasicRect:currentRect];
   
    if (self = [super initWithFrame:currentRect])
    {
         self.currentFigureType = figureType;
    }
    return self;
}

- (id)initWithType:(NSInteger)countOfAngles :(CGRect)currentRect
{
    if(self==[super initWithFrame:currentRect])
    {
       self.countForAngles = countOfAngles;
       self.currentFigureType = 89;
    }
    return self;
}

- (void)setBackground:(CGContextRef) currentContext
{
    CGContextSetRGBFillColor(currentContext, 0,0,0,10);
    CGContextFillRect(currentContext, CGRectMake(0, 0, 320, 320));
}

- (void)drawTriangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[3] = { CGPointMake(rect.size.width-rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width/2, rect.size.height-rect.size.height)};
    CGContextBeginPath(currentContext);
    CGContextSetLineWidth(currentContext, 4);
    CGContextMoveToPoint(currentContext, 0,0);
    CGContextAddLines(currentContext, arrayOfPoints, 3);
}


- (void)drawRectangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextBeginPath(currentContext);
    CGContextAddRect(currentContext, rect);
}

- (void)drawRomb:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[4] = { CGPointMake(rect.size.width/2, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height/2),
                                 CGPointMake(rect.size.width/2, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width, rect.size.height/2)};
    CGContextBeginPath(currentContext);
    CGContextMoveToPoint(currentContext, 0,0);
    CGContextAddLines(currentContext, arrayOfPoints, 4);
}

- (void)drawCircle:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextBeginPath(currentContext);
    CGContextSetLineWidth(currentContext, 3.0);
    CGContextFillEllipseInRect(currentContext, rect);
}

- (void)drawSixangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[6] = { CGPointMake(rect.size.width-rect.size.width+60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width-60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height/2),
                                 CGPointMake(rect.size.width-60, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width+60, rect.size.height),
                                 CGPointMake(rect.size.width- rect.size.width ,rect.size.height/2)};
    CGContextBeginPath(currentContext);
    CGContextAddLines(currentContext, arrayOfPoints, 6);
}

- (void)drawTrapeze:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[4] = { CGPointMake(rect.size.width-rect.size.width+60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width-60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width ,rect.size.height)};
    CGContextBeginPath(currentContext);
    CGContextAddLines(currentContext, arrayOfPoints, 4);
}

- (void)drawSmile:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextSetLineWidth(currentContext, 3);
    CGContextBeginPath(currentContext);
    CGContextAddArc(currentContext, 100, 100, 10, 36, 360, 0);
    CGContextFillPath(currentContext);
    CGContextAddArc(currentContext, 150, 100, 10, 36, 360, 0);
    CGContextFillPath(currentContext);
    CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    CGContextMoveToPoint(currentContext, 100, 140);
    CGContextAddCurveToPoint(currentContext, 100, 140, 140, 140,180, 120);
    CGContextStrokePath(currentContext);
}

- (void)drawSinusoid:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    int y;
    for(int x=rect.origin.x; x < rect.size.width; x++)
    {
        y = ((rect.size.height/2) * sin(((x*2) % 360) * M_PI/180)) + 30;
        if (x == 0)
        {
            CGContextMoveToPoint(currentContext, x, y);
        }
        else
        {
        CGContextAddLineToPoint(currentContext, x, y);
        }
    }
    CGContextStrokePath(currentContext);
}

- (void)figureHub:(DrawFigure *)DFObject :(CGContextRef)currentContext :(CGRect)rect
{
    switch(DFObject.currentFigureType)
    {
        case 0:
            [self drawTriangle:currentContext :rect];
            break;
        case 1:
            [self drawRectangle:currentContext :rect];
            break;
        case 2:
            [self drawRomb:currentContext :rect];
            break;
        case 3:
            [self drawCircle:currentContext :rect];
            break;
        case 4:
            [self drawSixangle:currentContext :rect];
            break;
        case 5:
            [self drawTrapeze:currentContext :rect];
            break;
        case 6:
            [self drawSinusoid:currentContext :rect];
            break;
        case 7:
            [self drawSmile:currentContext :rect];
            break;
        case 89:
            [self drawNAngle:currentContext :rect];
            break;
    }
}



- (NSArray*)setPointsForNAngles:(CGRect)rect
{
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    float radius = 0.90 * center.x;
    NSMutableArray *result = [NSMutableArray array];
    float angle = (2.0 * M_PI) / self.countForAngles;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    for (int currentAngle = 0; currentAngle < self.countForAngles; currentAngle++) {
        float newAngle = (angle * currentAngle) - rotationDelta;
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX,
                                                                center.y + curY)]];
    }
    return result;
}

- (void)drawNAngle:(CGContextRef)currentContext :(CGRect)rect
{
    NSArray *arr =[self setPointsForNAngles:rect];
    CGContextBeginPath (currentContext);
    CGContextSetLineWidth(currentContext,5);
    for(NSValue * point in arr) {
        CGPoint val = [point CGPointValue];
        if([arr indexOfObject:point]==0)
        {
            CGContextMoveToPoint (currentContext, val.x, val.y);
        }
        else
        {
            CGContextAddLineToPoint (currentContext, val.x, val.y);
        }
    }

}

- (UIColor*)getRandomColor
{
    UIColor* currentColor = [UIColor alloc];
    int randomRed = random()%10;
    int randomGreen = random()%10;
    int randomBlue = random()%10;
    NSLog(@"red%f  green%i   blue%i",0.1*randomRed,randomGreen,randomBlue);
    currentColor = [UIColor colorWithRed:randomRed*0.1
                                   green:randomGreen*0.1
                                    blue:randomBlue*0.1
                                   alpha:1.0f];
    return currentColor;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.superview bringSubviewToFront:self];
    CGRect frameRect = self.frame;
    frameRect.size.width = 200;
    frameRect.size.height= 200;
    self.frame = frameRect;
    
}



- (void)handlePan:(UIPanGestureRecognizer *)newPan
{
    
    CGPoint translation = [newPan translationInView:self.superview];
    self.center = CGPointMake(_lastLocation.x + translation.x,
                             _lastLocation.y + translation.y);
    
     if(newPan.state == UIGestureRecognizerStateEnded)
     {
         _lastLocation = self.center;
         CGRect frameRect = _basicRect;
         frameRect.origin.x= self.frame.origin.x+translation.x;
         frameRect.origin.y=self.frame.origin.y+translation.y;
         self.frame = frameRect;
     }
    
}



- (void)handleSwipe:(UIPanGestureRecognizer*)newSwipe
{
    //неробоче, треба спершу пан вимикати
    [self removeFromSuperview];

}


- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [[self getRandomColor] setFill];
    [self figureHub:self :currentContext :rect];
    CGContextRotateCTM(currentContext,1);
    
    int angle = -200 *M_PI/180;
    
    // rotate
   CGContextRotateCTM(currentContext, angle);
    
    CGContextClosePath(currentContext);
    
    CGContextFillPath(currentContext);
   
    
}


@end
