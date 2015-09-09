//
//  ViewController.m
//  Drawing
//
//  Created by Pavlo Dumyak on 9/7/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toDraw:(id)sender {
    DrawFigure * DFObject = [[DrawFigure alloc]initWithFigure:[sender tag] :CGRectMake(0, 0, 320, 320)];
    [self.view addSubview:DFObject];
}

- (IBAction)setNAngle:(id)sender
{
    NSInteger tmp;
    tmp = [self.inputData.text integerValue];
    DrawFigure * DFObject = [[DrawFigure alloc]initWithType:tmp :CGRectMake(0, 0, 320, 320)];
    [self.view addSubview:DFObject];
}


@end
