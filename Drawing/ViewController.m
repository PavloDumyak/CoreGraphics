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
    DrawFigure * DFObject = [[DrawFigure alloc]initWithFigure:1];
    [self.view addSubview:DFObject];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
