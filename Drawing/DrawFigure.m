//
//  DrawFigure.m
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import "DrawFigure.h"

@implementation DrawFigure


-(id)initWithFigure:(NSInteger)figureType
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 320, 320)])
    {
         self.currentFigureType = figureType;
    }
    return self;
}

-(id)initWithType:(NSInteger)countOfAngles
{
    if(self==[super initWithFrame:CGRectMake(0, 0, 320, 320)])
    {
       self.countForAngles = countOfAngles;
       self.currentFigureType = 89;
    }
    return self;
}

-(void)setBackground:(CGContextRef) currentContext
{
    CGContextSetRGBFillColor(currentContext, 0,0,0,10);
    CGContextFillRect(currentContext, CGRectMake(0, 0, 320, 320));
}

-(void)drawTriangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[3] = { CGPointMake(rect.size.width-rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width/2, rect.size.height-rect.size.height)};
    CGContextBeginPath(currentContext);
    CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextSetLineWidth(currentContext, 4);
    CGContextMoveToPoint(currentContext, 0,0);
    CGContextAddLines(currentContext, arrayOfPoints, 3);
    CGContextClosePath(currentContext);
    CGContextFillPath(currentContext);
}


-(void)drawRectangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextBeginPath(currentContext);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextAddRect(currentContext, rect);
    CGContextFillPath(currentContext);
}

-(void)drawRomb:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[4] = { CGPointMake(rect.size.width/2, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height/2),
                                 CGPointMake(rect.size.width/2, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width, rect.size.height/2)};
    CGContextBeginPath(currentContext);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextMoveToPoint(currentContext, 0,0);
    CGContextAddLines(currentContext, arrayOfPoints, 4);
    CGContextFillPath(currentContext);
}

-(void)drawCircle:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextBeginPath(currentContext);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextSetLineWidth(currentContext, 3.0);
    CGContextFillEllipseInRect(currentContext, rect);
    CGContextFillPath(currentContext);
}

-(void)drawSixangle:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[6] = { CGPointMake(rect.size.width-rect.size.width+60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width-60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height/2),
                                 CGPointMake(rect.size.width-60, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width+60, rect.size.height),
                                 CGPointMake(rect.size.width- rect.size.width ,rect.size.height/2)};
    CGContextBeginPath(currentContext);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextAddLines(currentContext, arrayOfPoints, 6);
    CGContextClosePath(currentContext);
    CGContextFillPath(currentContext);
}

-(void)drawTrapeze:(CGContextRef)currentContext :(CGRect)rect
{
    CGPoint arrayOfPoints[4] = { CGPointMake(rect.size.width-rect.size.width+60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width-60, rect.size.height-rect.size.height),
                                 CGPointMake(rect.size.width, rect.size.height),
                                 CGPointMake(rect.size.width-rect.size.width ,rect.size.height)};
    CGContextBeginPath(currentContext);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextAddLines(currentContext, arrayOfPoints, 4);
    CGContextClosePath(currentContext);
    CGContextFillPath(currentContext);
}

-(void)drawSmile:(CGContextRef)currentContext :(CGRect)rect
{
    CGContextSetLineWidth(currentContext, 3);
    CGContextSetFillColor(currentContext,CGColorGetComponents([UIColor blueColor].CGColor));
    CGContextBeginPath(currentContext);
    CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    CGContextAddArc(currentContext, 100, 100, 10, 36, 360, 0);
    CGContextFillPath(currentContext);
    CGContextAddArc(currentContext, 150, 100, 10, 36, 360, 0);
    CGContextFillPath(currentContext);
    CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    CGContextMoveToPoint(currentContext, 100, 140);
    CGContextAddCurveToPoint(currentContext, 100, 140, 140, 140,180, 120);
    CGContextStrokePath(currentContext);
}

-(void)drawSinusoid:(CGContextRef)currentContext :(CGRect)rect
{CGContextSetRGBStrokeColor(currentContext, 32, 50, 45, 10);
    int y;
    for(int x=rect.origin.x; x < rect.size.width; x++)
    {
        y = ((rect.size.height/2) * sin(((x*2) % 360) * M_PI/180)) + 30;
        if (x == 0)
        {
            CGContextMoveToPoint(currentContext, x, y);
        }
        else {
            
        CGContextAddLineToPoint(currentContext, x, y);
        }
    }
    CGContextStrokePath(currentContext);
}

-(void)figureHub:(DrawFigure *)DFObject :(CGContextRef)currentContext :(CGRect)rect
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

-(void)createButtonToReturn
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Return:" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(iWantReturn:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 100, 30);
    button.backgroundColor = [UIColor whiteColor];
    [self addSubview:button];
}


-(void)iWantReturn:(UIButton*)button
{
    [self removeFromSuperview];
}

-(NSArray*)setPointsForNAngles:(CGRect)rect
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

-(void)drawNAngle:(CGContextRef)currentContext :(CGRect)rect
{
    NSArray *arr =[self setPointsForNAngles:rect];
    CGContextBeginPath (currentContext);
    CGContextSetLineWidth(currentContext,5);
    [[UIColor blueColor] setFill];
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
    
    CGContextClosePath(currentContext);
    CGContextFillPath(currentContext);
    
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //[self setBackground:currentContext];
    [self figureHub:self :currentContext :rect];
    
    
}


@end
