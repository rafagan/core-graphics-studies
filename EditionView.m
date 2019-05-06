//
//  EditionView.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 26/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "EditionView.h"
#import "DataSource.h"

@implementation EditionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initialize
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [DATA_SRC.selectedPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    self.fillSwitch.on = DATA_SRC.selectedPolygon.fill;
}

- (IBAction)onRedSliderChanged:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [DATA_SRC.selectedPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    DATA_SRC.selectedPolygon.color = [UIColor colorWithRed:self.redSlider.value green:green blue:blue alpha:1];
    
    [DATA_SRC.selectedPolygon.view setNeedsDisplay];
}

- (IBAction)onBlueSliderChanged:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [DATA_SRC.selectedPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    DATA_SRC.selectedPolygon.color = [UIColor colorWithRed:red green:self.greenSlider.value blue:blue alpha:1];
    
    [DATA_SRC.selectedPolygon.view setNeedsDisplay];
}

- (IBAction)onFillSwitchChanged:(id)sender {
    DATA_SRC.selectedPolygon.fill = self.fillSwitch.on;
    [DATA_SRC.selectedPolygon.view setNeedsDisplay];
}

- (IBAction)onGreenSliderChanged:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [DATA_SRC.selectedPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    DATA_SRC.selectedPolygon.color = [UIColor colorWithRed:red green:green blue:self.blueSlider.value alpha:1];
    
    [DATA_SRC.selectedPolygon.view setNeedsDisplay];
}
@end
