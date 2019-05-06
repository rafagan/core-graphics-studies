//
//  Polygon.h
//  TrabalhoGrupoDraw
//
//  Created by Carlos Guimaraes on 14/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolygonView.h"
#import "RaVec2.h"

@interface Polygon : NSObject

@property (nonatomic, setter = setAngle:) float angle;
@property (nonatomic, setter = setScale:) float scale;
@property (nonatomic, setter = setPosition:) RaVec2* position;
@property (nonatomic, setter = setSize:) RaVec2* size;
@property (nonatomic, setter = setRect:) CGRect rect;
@property (nonatomic, strong, setter = setColor:) UIColor *color;
@property (nonatomic, setter = setFill:) BOOL fill;
@property (nonatomic, setter = setVerticeNumber:) int verticeNumber;
@property (nonatomic, setter = setSelected:) BOOL isSelected;

@property (nonatomic, strong) PolygonView *view;

+(Polygon*)creatNewPolygonWithAngle:(float)angle andScale:(float)scale andRect:(CGRect)rect andVerticeNumber:(int)num;

@end
