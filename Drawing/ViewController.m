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

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toDraw:(id)sender {
    DrawFigure * DFObject = [[DrawFigure alloc]initWithFigure:[sender tag]];
    [self.view addSubview:DFObject];

}
- (IBAction)setNAngle:(id)sender {
    
    NSInteger tmp;
    tmp = [self.inputData.text integerValue];
    
      DrawFigure * DFObject = [[DrawFigure alloc]initWithType:tmp];
     [self.view addSubview:DFObject];
}


@end
