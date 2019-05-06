//
//  OptionsViewController.m
//  TrabalhoGrupoDraw
//
//  Created by Rafagan on 20/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "OptionsViewController.h"
#import "DataSource.h"

@interface OptionsViewController ()
{
    Polygon* currentPolygon;
}

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:CGSizeMake(200, 600)];
    
    const Polygon* polygonCopy = DATA_SRC.selectedPolygon;
    CGRect rect = CGRectMake(
                             _currentPolygonView.bounds.size.width/2 - polygonCopy.rect.size.width/2,
                             _currentPolygonView.bounds.size.height/2 - polygonCopy.rect.size.height/2,
                             polygonCopy.rect.size.width, polygonCopy.rect.size.height);
    
    if (currentPolygon != polygonCopy) {
        currentPolygon = [Polygon creatNewPolygonWithAngle:polygonCopy.angle
                                           andScale:polygonCopy.scale
                                            andRect:rect
                                   andVerticeNumber:polygonCopy.verticeNumber];
        currentPolygon.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        currentPolygon.color = polygonCopy.color;
        currentPolygon.isSelected = NO;
        
        [_currentPolygonView addSubview:currentPolygon.view];
        _currentPolygonView.currentPolygon = currentPolygon;
        [_currentPolygonView initialize];
    } else
        currentPolygon.angle = polygonCopy.angle;
        currentPolygon.verticeNumber = polygonCopy.verticeNumber;
        currentPolygon.scale = polygonCopy.scale;
    
    ////////////////////////////////////////////////////////////////////////////
    //carrega as sliders com a cor do Obejeto vindo da "fase" ...
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [currentPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    ////////////////////////////////////////////////////////////////////////////

    
    self.rotationLabel.text = [NSString stringWithFormat:@"%ld", (long)polygonCopy.angle];
    self.scaleLabel.text = [NSString stringWithFormat:@"%.2f", polygonCopy.scale];
    
    [currentPolygon.view setTransform:CGAffineTransformMake(
                                                            polygonCopy.view.transform.a,
                                                            polygonCopy.view.transform.b,
                                                            polygonCopy.view.transform.c,
                                                            polygonCopy.view.transform.d,
                                                            0, 0)];
    
    self.rotationSlider.minimumValue = 0;
    self.rotationSlider.maximumValue = 359;
    self.rotationSlider.value = polygonCopy.angle;
    self.scaleSlider.minimumValue = 0.1;
    self.scaleSlider.maximumValue = 2;
    self.scaleSlider.value = polygonCopy.scale;
    
    //////////////////////////////////////////////////////////////////////////////
    //seta a borda do Objeto que esta sendo atualizado na hora !!
    self.fillSwitch.on = polygonCopy.fill;
    currentPolygon.fill = polygonCopy.fill;
    //////////////////////////////////////////////////////////////////////////////
    
    [currentPolygon.view calculateAffineTransforms];
    [currentPolygon.view setNeedsDisplay];
}

- (void)viewDidDisappear:(BOOL)animated
{
    DATA_SRC.selectedPolygon.color = currentPolygon.color;
    DATA_SRC.selectedPolygon.angle = currentPolygon.angle;
    DATA_SRC.selectedPolygon.scale = currentPolygon.scale;
    DATA_SRC.selectedPolygon.fill = self.fillSwitch.on;
    DATA_SRC.selectedPolygon.verticeNumber = currentPolygon.verticeNumber;
    
    [DATA_SRC.selectedPolygon.view calculateAffineTransforms];
    [DATA_SRC.selectedPolygon.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onRedSliderValueChange:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [currentPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    currentPolygon.color = [UIColor colorWithRed:self.redSlider.value green:green blue:blue alpha:1];
    
    [currentPolygon.view setNeedsDisplay];
}

- (IBAction)onGreenSliderValueChange:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [currentPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    currentPolygon.color = [UIColor colorWithRed:red green:self.greenSlider.value blue:blue alpha:1];
    
    [currentPolygon.view setNeedsDisplay];
}
- (IBAction)onBlueSliderValueChange:(id)sender {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [currentPolygon.color getRed:&red green:&green blue:&blue alpha:&alpha];
    currentPolygon.color = [UIColor colorWithRed:red green:green blue:self.blueSlider.value alpha:1];
    
    [currentPolygon.view setNeedsDisplay];
}

- (IBAction)onRotationSliderChange:(id)sender {
    currentPolygon.angle = self.rotationSlider.value;
    self.rotationLabel.text = [NSString stringWithFormat:@"%ld", (long)currentPolygon.angle];
    
    [currentPolygon.view calculateAffineTransforms];
}

- (IBAction)onScaleSliderChange:(id)sender {
    currentPolygon.scale = self.scaleSlider.value;
    self.scaleLabel.text = [NSString stringWithFormat:@"%.2f", currentPolygon.scale];
    
    [currentPolygon.view calculateAffineTransforms];
}

- (IBAction)onFillSwitchValueChange:(id)sender {
    currentPolygon.fill = self.fillSwitch.on;
    [currentPolygon.view setNeedsDisplay];
}
@end
