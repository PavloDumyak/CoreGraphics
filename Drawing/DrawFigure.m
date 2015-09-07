//
//  DrawFigure.m
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import "DrawFigure.h"

@implementation DrawFigure


-(id)initWithFigure:(int)figureType
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 320, 320)])
    {
         self.currentFigureType = figureType;
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


- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [self setBackground:currentContext];
   // [self drawTriangle:currentContext :rect];
    //[self drawRectangle:currentContext :rect];
    [self drawRomb:currentContext :rect];
}


@end
