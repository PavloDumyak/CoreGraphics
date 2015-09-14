//
//  FigureController.m
//  Drawing
//
//  Created by Pavlo Dumyak on 9/14/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FigureController.h"

@interface FigureController ()

@end

@implementation FigureController
- (IBAction)start:(id)sender {
    
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    _figureArray = [[NSMutableArray alloc]initWithCapacity:10];
    DrawFigure* DFObject;
    for(int i = 0; i<20;i++)
    {
        DFObject = [[DrawFigure alloc]initWithFigure:i :CGRectMake(rand()%320, rand()%480, 50, 50)];
        
        [_figureArray addObject:DFObject];
    }

    
    
 
    UIPanGestureRecognizer *myPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandle:)];
    [self.view addGestureRecognizer:myPan];
    
    
        for(int i = 1; i< [self.figureArray count];i++)
        {
        
    
            
           [self.view addSubview:[self.figureArray objectAtIndex:i]];
            
      
    
        
        }
        
    
    
    
   // for(int i = 0; [self.figureArray count]; i++)
    
        
        
        
    //    [self.view addSubview:[self.figureArray objectAtIndex:i]];
        
   

    
    
}



-(void)setFigureArray:(NSMutableArray *)figureArray
{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)panHandle:(UIPanGestureRecognizer *)myPan
{
    
    static int selectedBox=0;
    
        if (myPan.state == UIGestureRecognizerStateBegan)
        {
            CGPoint location = [myPan locationInView:myPan.view];
            for(int i=0; i<self.figureArray.count;i++)
            {
                if(CGRectContainsPoint([self.figureArray[i] frame], location))
                {
                    selectedBox=i;
                    self.contView = self.figureArray[i];
                //self.originSize  = self.contView.frame.size.width;
                    
                    [UIView animateWithDuration:0.1 animations:^{
                        self.contView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
                    }];
                    
                    break;
                }
            }
            
            
        }
        
        if (myPan.state == UIGestureRecognizerStateChanged)
        {
            CGPoint center = self.contView.center;
            CGPoint translation = [myPan translationInView:self.view];
            
            center.x += translation.x;
            center.y += translation.y;
            
            self.contView.center = center;
            
            [myPan setTranslation:CGPointZero inView:self.view];
        }
        
        if (myPan.state == UIGestureRecognizerStateEnded)
       {
            [UIView animateWithDuration:0.1 animations:^{
               self.contView.transform = CGAffineTransformIdentity;
           } completion:^(BOOL finished) {
               self.contView = nil;
                
           }];
           
           
           for(int i=0; i< [self.figureArray count];i++){
               if(selectedBox==i){
                   i++;
               }
               [UIView animateWithDuration: 1.0f animations: ^{
                   [[self.figureArray objectAtIndex:i] setCenter:CGPointMake(rand()%320, rand()%480)];
               } ];

        }
    
    
    
        }
    
    
}




@end
