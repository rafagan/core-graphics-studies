//
//  RaVec2.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 19/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathUtils.h"

@interface RaVec2 : NSObject

@property double x;
@property double y;

+ (RaVec2*)newByCGPoint:(CGPoint)point;

- (CGPoint)ToCGPoint;

@end
