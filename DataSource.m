//
//  DataSource.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 20/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

static DataSource* me;

+ (DataSource *)getMe
{
    if (me == nil) {
        me = [[DataSource alloc]init];
    }
    return me;
}

@end
