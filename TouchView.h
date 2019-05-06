//
//  TouchView.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 19/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"

@interface TouchView : UIView

@property (strong, nonatomic) EditionView *editionView;

- (void)initialize;
- (void)removePolygon;
- (void)editPolygonStart;

@end
