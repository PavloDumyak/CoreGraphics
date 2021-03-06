//
//  ViewController.h
//  Drawing
//
//  Created by Pavlo Dumyak on 9/7/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FigureController.h"

 typedef enum myFigure{
    Triangle,
    Rectangle,
    Romb,
    Circle,
    Sixangle,
    Trapeze,
    Smile,
    Sinusoid
}figure;


@interface ViewController : UIViewController

-(void)panHandle:(UIPanGestureRecognizer*)myPan;

@end

