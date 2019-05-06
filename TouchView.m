//
//  TouchView.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 19/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "TouchView.h"
#import "DataSource.h"
#import "RaVec2.h"

@interface TouchView ()

- (void)setNewCurrentPolygon:(Polygon*)p;

@end

@implementation TouchView

- (void)initialize
{
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tapGR];
    
    UILongPressGestureRecognizer *lpGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:lpGR];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGR];
    
    UIPinchGestureRecognizer *pinGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self addGestureRecognizer:pinGR];
    
    UIRotationGestureRecognizer *rotGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rot:)];
    [self addGestureRecognizer:rotGR];
    
     DATA_SRC.polygons = [[NSMutableArray alloc]init];
}

- (void)didMoveToWindow
{
    [self addSubview:self.editionView];
    [self.editionView setHidden:YES];
}

- (void)tap:(UITapGestureRecognizer *)recognizer
{
    if (self.editionView.isHidden == NO) {
        [self.editionView setHidden:YES];
        //Animação do options
        CGRect rct = CGRectMake(0, 0, 320, 570);
        [self setFrame:rct];
        return;
    }
    
    CGPoint location = [recognizer locationInView:self];
    
    for (Polygon *polygon in DATA_SRC.polygons) {
        if (CGRectContainsPoint([polygon.view frame], location)) {
            [self setNewCurrentPolygon:polygon];
            return;
        }
    }
    
    RaVec2* defaultSize = [RaVec2 new];
    defaultSize.x = defaultSize.y = 100;
    
    Polygon* p = [Polygon creatNewPolygonWithAngle:0 andScale:1 andRect:CGRectMake(location.x - defaultSize.x/2, location.y - defaultSize.y/2, defaultSize.x, defaultSize.y) andVerticeNumber:4];
    p.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    p.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    [DATA_SRC.polygons addObject:p];
    [self addSubview:p.view];
    
    [self setNewCurrentPolygon:p];
}

- (void)longPress:(UILongPressGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:self];
    
    for (Polygon *polygon in DATA_SRC.polygons) {
        if (CGRectContainsPoint([polygon.view frame], location))
        {
            CGRect rct = CGRectMake(0, -30, 320, 570);
            [self setFrame:rct];
            
            [self setNewCurrentPolygon:polygon];
            
            [self.editionView initialize];
            [self.editionView setHidden:NO];
            DATA_SRC.selectedPolygon.view.editionView = self.editionView;
            [DATA_SRC.selectedPolygon.view calculateAffineTransforms];
        }
    }
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    static BOOL enablePan = YES;
    if (recognizer.state != UIGestureRecognizerStateChanged) {
        enablePan = YES;
        return;
    }
    
    if (!enablePan) {
        return;
    }

    for (Polygon *polygon in DATA_SRC.polygons) {
        if (CGRectContainsPoint([polygon.view frame], [recognizer locationInView:self])) {
            
            if(polygon != DATA_SRC.selectedPolygon) {
                [self setNewCurrentPolygon:polygon];
            }
            
            CGPoint translation = [recognizer translationInView:self];
            DATA_SRC.selectedPolygon.position.x += translation.x;
            DATA_SRC.selectedPolygon.position.y += translation.y;
            [DATA_SRC.selectedPolygon.view calculateAffineTransforms];
            [recognizer setTranslation:CGPointZero inView:self];
            
            return;
        }
    }
    enablePan = NO;
}

- (void)pinch:(UIPinchGestureRecognizer *)recognizer
{
    if (recognizer.state != UIGestureRecognizerStateChanged)
        return;
    
    DATA_SRC.selectedPolygon.scale += recognizer.scale - 1;
    [DATA_SRC.selectedPolygon.view calculateAffineTransforms];
    [recognizer setScale:1];
}

- (void)rot:(UIRotationGestureRecognizer *)recognizer
{
    if (recognizer.state != UIGestureRecognizerStateChanged)
        return;
    
    DATA_SRC.selectedPolygon.angle += [MATH toDegrees:recognizer.rotation];
    [DATA_SRC.selectedPolygon.view calculateAffineTransforms];
    [recognizer setRotation:0.0];
}

- (void)removePolygon
{
    [DATA_SRC.selectedPolygon.view removeFromSuperview];
    [DATA_SRC.polygons removeObject:DATA_SRC.selectedPolygon];
    DATA_SRC.selectedPolygon = Nil;
    [self.editionView setHidden:YES];
}
- (void)setNewCurrentPolygon:(Polygon*)p
{
    DATA_SRC.selectedPolygon.isSelected = NO;
    DATA_SRC.selectedPolygon.view.editionView = nil;
    DATA_SRC.selectedPolygon = p;
    DATA_SRC.selectedPolygon.isSelected = YES;
}

- (void)editPolygonStart
{
    [self.editionView setHidden:YES];
    CGRect rct = CGRectMake(0, 0, 320, 570);
    [self setFrame:rct];
}

@end
