
#import "PolygonView.h"
#import "RaVec2.h"

@interface PolygonView ()
{
    UIBezierPath *primitive;
}

@end

@implementation PolygonView

@synthesize verticeNumber,angle,scale,color,position,size,isSelected;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.size = [[RaVec2 alloc]init];
        self.position = [[RaVec2 alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    primitive = [[UIBezierPath alloc] init];
    
    const float GRAUS_360 = 2 * M_PI;
    
    RaVec2* pos[self.verticeNumber];
    int raio = size.x / 2;
    
    for(int i=0;i<self.verticeNumber;i++){
        pos[i] = [[RaVec2 alloc]init];
        
        float a = (i * GRAUS_360)/self.verticeNumber;
        pos[i].x = (raio * cos(a));
        pos[i].y = (raio * sin(a));
    }
    
    [primitive moveToPoint:CGPointMake(pos[0].x + size.x / 2,pos[0].y + size.x / 2)];
    for (int i=1; i<self.verticeNumber; i++) {
        [primitive addLineToPoint:CGPointMake(pos[i].x + size.x / 2,pos[i].y + size.x / 2)];
    }
    
    //Cores do rect
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    if(self.isSelected) {
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        color = [UIColor colorWithRed:red green:green blue:blue alpha:0.3];
    } else {
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }
    
    [color set];
    [color setFill];
    [color setStroke];
    
    [primitive closePath];
    self.fill ? [primitive fill] : [primitive stroke];
}

-(void)setIsSelected:(BOOL)_isSelected
{
    isSelected = _isSelected;
    [self setNeedsDisplay];
}

- (void)setAngle:(float)_angle
{
    angle = _angle;
}

- (void)setPosition:(RaVec2 *)_position
{
    position = _position;
}

- (void)setScale:(float)_scale
{
    scale = _scale;
}

- (void)calculateAffineTransforms
{
    [self setTransform:CGAffineTransformIdentity];
    [self setTransform:CGAffineTransformTranslate(self.transform,position.x, position.y)];
    [self setTransform:CGAffineTransformRotate(self.transform,[MATH toRadians:angle])];
    [self setTransform:CGAffineTransformScale(self.transform, scale, scale)];
    
    if (self.editionView != nil) {
        [self.editionView setTransform:CGAffineTransformMakeTranslation(position.x -size.x/2 - 20, position.y - 20)];
    }
}

@end
