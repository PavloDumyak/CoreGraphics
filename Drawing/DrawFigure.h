//
//  DrawFigure.h
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawFigure : UIView
@property (nonatomic,assign) int currentFigureType;
-(id)initWithFigure: (int)figureType;
-(void)setBackground: (CGContextRef)currentContext;
-(void)drawTriangle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawRectangle: (CGContextRef)currentContext :(CGRect)rect;
-(void)drawRomb: (CGContextRef)currentContext :(CGRect)rect;
@end
