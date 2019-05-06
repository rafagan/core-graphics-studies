//
//  DataSource.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 20/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Polygon.h"

#define DATA_SRC [DataSource getMe]

@interface DataSource : NSObject

@property NSMutableArray *polygons;
@property Polygon* selectedPolygon;

+ (DataSource*)getMe;

@end
