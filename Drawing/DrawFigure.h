//
//  DrawFigure.h
//  Drawing
//
//  Created by Admin on 07.09.15.
//  Copyright © 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawFigure : UIView
@property CGPoint lastLocation;
@property (nonatomic,assign) NSInteger currentFigureType;
@property (nonatomic,assign) NSInteger countForAngles;
@property (nonatomic, assign)NSArray* pointsOfNAngle;
- (id)initWithFigure: (NSInteger)figureType :(CGRect)currentRect;
- (id)initWithType: (NSInteger)countOfAngles :(CGRect)currentRect;
@end
