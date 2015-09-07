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
-(id)initWithFigure: (NSInteger)figureType;
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
-(void)buttonPressed:(UIButton*)button;
@end
