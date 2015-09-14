//
//  FigureController.h
//  Drawing
//
//  Created by Pavlo Dumyak on 9/14/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawFigure.h"
@interface FigureController : UIViewController

-(void)panHandle:(UIPanGestureRecognizer*)myPan;
-(void)figureRoute;
@property (nonatomic) NSMutableArray* figureArray;
@property (nonatomic) UIView* contView;

@end
