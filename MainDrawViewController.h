//
//  MainDrawViewController.h
//  TrabalhoGrupoDraw
//
//  Created by Carlos Guimaraes on 14/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Polygon.h"
#import "TouchView.h"

@interface MainDrawViewController : UIViewController
@property (weak, nonatomic) IBOutlet TouchView *drawView;

@property (strong, nonatomic) IBOutlet EditionView *editionView;

- (IBAction)onTouchEditBtn:(id)sender;
- (IBAction)onTouchRemoveBtn:(id)sender;
@end
