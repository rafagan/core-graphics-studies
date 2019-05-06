//
//  OpPolygonView.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 21/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "OpPolygonView.h"
#import "MathUtils.h"

@implementation OpPolygonView
{
    BOOL waitNextGesture;
}
@synthesize currentPolygon;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)initialize
{
    UIRotationGestureRecognizer *rotGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rot:)];
    [self addGestureRecognizer:rotGR];
    
    waitNextGesture = NO;
}

- (void)rot:(UIRotationGestureRecognizer *)recognizer
{
    if (recognizer.state != UIGestureRecognizerStateChanged) {
        waitNextGesture = NO;
        return;
    }
    
    if (waitNextGesture == YES) {
        return;
    }
    
    int degrees = [MATH toDegrees:recognizer.rotation];
    if (degrees >= 1) {
        currentPolygon.verticeNumber++;
    }
    if (degrees <= 1) {
        currentPolygon.verticeNumber--;
    }
    
    
    if (currentPolygon.verticeNumber < 3) {
        currentPolygon.verticeNumber = 3;
    }
    
    [currentPolygon.view setNeedsDisplay];
    [recognizer setRotation:0.0];
    waitNextGesture = YES;
}

@end
