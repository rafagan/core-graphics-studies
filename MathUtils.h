//
//  MathUtils.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 21/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MATH [MathUtils getMe]

@interface MathUtils : NSObject
+(MathUtils*)getMe;

- (double)toDegrees:(double)radians;
- (double)toRadians:(double)degrees;
@end
