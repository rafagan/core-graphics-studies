//
//  EditionView.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditionView : UIView
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISwitch *fillSwitch;

-(void)initialize;

- (IBAction)onRedSliderChanged:(id)sender;
- (IBAction)onBlueSliderChanged:(id)sender;
- (IBAction)onFillSwitchChanged:(id)sender;
- (IBAction)onGreenSliderChanged:(id)sender;

@end
