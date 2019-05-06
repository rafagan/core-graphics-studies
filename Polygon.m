//
//  Polygon.m
//  TrabalhoGrupoDraw
//
//  Created by Carlos Guimaraes on 14/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "Polygon.h"

@implementation Polygon

@synthesize angle,view,scale,rect,color,fill,verticeNumber,isSelected,position,size;

+(Polygon *)creatNewPolygonWithAngle:(float)angle andScale:(float)scale andRect:(CGRect)rect andVerticeNumber:(int)num
{
    Polygon *p = [[Polygon alloc] init];
    
    p.size = [[RaVec2 alloc]init];
    p.position = [[RaVec2 alloc]init];
    
    p.view = [[PolygonView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    [p.view setBackgroundColor:[UIColor whiteColor]];

    p.angle = angle;
    p.scale = scale;
    p.rect = rect;
    p.verticeNumber = num;
    p.isSelected = YES;

    p.fill = YES;
    
    return p;
}

- (void)setAngle:(float)_angle
{
    angle = (int)_angle % 360;
    
    if(angle < 0)
        angle += 360;
    
    view.angle = angle;
}

- (void)setRect:(CGRect)_rect
{
    rect = _rect;
    
    size.x = _rect.size.width;
    size.y = _rect.size.height;
    position.x = _rect.origin.x;
    position.y = _rect.origin.y;
    view.position = position;
    view.size = size;
    
    [view calculateAffineTransforms];
}

- (void)setScale:(float)_scale
{
    _scale = MAX(0.1, MIN(_scale, 2));
    
    view.scale = _scale;
    scale = _scale;
}

- (void)setColor:(UIColor *)_color
{
    view.color = _color;
    color = _color;
}

- (void)setVerticeNumber:(int)_verticeNumber
{
    verticeNumber = _verticeNumber;
    view.verticeNumber = _verticeNumber;
}

- (void)setSelected:(BOOL)_isSelected
{
    isSelected = _isSelected;
    view.isSelected = isSelected;
}

- (void)setFill:(BOOL)_fill
{
    fill = _fill;
    view.fill = fill;
}

- (void)setPosition:(RaVec2 *)_position
{
    position = _position;
    view.position = position;
}

- (void)setSize:(RaVec2 *)_size
{
    size = _size;
    view.size = _size;
}
@end
