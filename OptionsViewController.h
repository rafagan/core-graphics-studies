//
//  OptionsViewController.h
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 20/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpPolygonView.h"
#import "TouchView.h"


@interface OptionsViewController : UIViewController

@property (weak, nonatomic) IBOutlet OpPolygonView *currentPolygonView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *rotationSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISwitch *fillSwitch;
@property (weak, nonatomic) IBOutlet UILabel *rotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *scaleLabel;


- (IBAction)onRedSliderValueChange:(id)sender;
- (IBAction)onGreenSliderValueChange:(id)sender;
- (IBAction)onBlueSliderValueChange:(id)sender;
- (IBAction)onRotationSliderChange:(id)sender;
- (IBAction)onScaleSliderChange:(id)sender;
- (IBAction)onFillSwitchValueChange:(id)sender;
@end
