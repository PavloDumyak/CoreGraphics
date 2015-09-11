//
//  FigureController.m
//  Drawing
//
//  Created by Admin on 11.09.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FigureController.h"

@implementation FigureController
@synthesize generalArrayOfFigure;

+(id)figureControllerSingleton
{
   static FigureController* FCSingleton;
   static dispatch_once_t predicat;
   dispatch_once(&predicat, ^{FCSingleton = [[FigureController alloc]init];});
   return FCSingleton;
}

-(void)setGeneralArray
{
    DrawFigure* DFObject;
    for(int i = 0; i<7;i++)
    {
        DFObject = [[DrawFigure alloc]initWithFigure:i :CGRectMake(100, 100, 100, 100)];
        [generalArrayOfFigure addObject:DFObject];
    }
    
}

-(void)addViewToMainDisplay:(UIView*)currentView
{
    for(int i = 0; i<7;i++)
    {
        [currentView addSubview:[self.generalArrayOfFigure objectAtIndex:i]];
    }

}





@end
