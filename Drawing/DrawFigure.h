//
//  DrawFigure.h
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawFigure : UIView
@property (nonatomic,assign) NSInteger currentFigureType;
@property (nonatomic,assign) NSInteger countForAngles;
@property (nonatomic, assign)NSArray* pointsOfNAngle;
-(id)initWithFigure: (NSInteger)figureType;
-(id)initWithType: (NSInteger)countOfAngles;
-(void)figureHub:(DrawFigure*)DFObject :(CGContextRef)currentContext :(CGRect)rect;
-(void)setBackground: (CGContextRef)currentContext;
-(void)drawTriangle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawRectangle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawRomb: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawCircle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawSixangle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawTrapeze: (CGContextRef)currentContext: (CGRect)rect;
-(void)drawSmile: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawSinusoid :(CGContextRef)currentContext :(CGRect)rect;
-(void)createButtonToReturn;
-(void)drawNAngle:(CGContextRef)currentContext :(CGRect)rect;
-(NSArray*)setPointsForNAngles:(CGRect)rect;
@end
