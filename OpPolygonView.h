//
//  OpPolygonView.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 21/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"

@interface OpPolygonView : UIView

@property (nonatomic,strong)Polygon* currentPolygon;

- (void)initialize;
@end
