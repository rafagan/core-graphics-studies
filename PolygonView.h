

#import <UIKit/UIKit.h>
#import "RaVec2.h"
#import "EditionView.h"

@interface PolygonView : UIView

@property (nonatomic, setter = setIsSelected:) BOOL isSelected;
@property (nonatomic) int verticeNumber;
@property (nonatomic, setter = setAngle:) float angle;
@property (nonatomic, setter = setScale:) float scale;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong, setter = setPosition:) RaVec2 *position;
@property (nonatomic, strong) RaVec2 *size;
@property (nonatomic) BOOL fill;

@property (nonatomic,strong) EditionView* editionView;

- (void)calculateAffineTransforms;

@end
