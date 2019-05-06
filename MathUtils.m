//
//  MathUtils.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 21/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "MathUtils.h"

@implementation MathUtils

static MathUtils* me;
+ (MathUtils *)getMe
{
    if (me == nil) {
        me = [[MathUtils alloc]init];
    }
    return me;
}

- (double)toRadians:(double)degrees
{
    return degrees / (180 / M_PI);
}

- (double)toDegrees:(double)radians
{
    return radians * (180 / M_PI);
}

@end
