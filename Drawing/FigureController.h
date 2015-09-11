//
//  FigureController.h
//  Drawing
//
//  Created by Admin on 11.09.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawFigure.h"
@interface FigureController : NSObject
@property (nonatomic, retain) NSMutableArray* generalArrayOfFigure;
+(id)figureControllerSingleton;
-(void)addViewToMainDisplay:(UIView*)currentView;
-(void)setGeneralArray;

@end
