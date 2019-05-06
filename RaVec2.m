//
//  RaVec2.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 19/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "RaVec2.h"

@implementation RaVec2
@synthesize x,y;

+ (RaVec2 *)newByCGPoint:(CGPoint)point
{
    RaVec2* v = [RaVec2 new];
    v.x = point.x;
    v.y = point.y;
    return v;
}

- (CGPoint)ToCGPoint
{
    return CGPointMake(x, y);
}

@end
