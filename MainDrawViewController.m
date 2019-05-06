//
//  MainDrawViewController.m
//  TrabalhoGrupoDraw
//
//  Created by Carlos Guimaraes on 14/11/13.
//  Copyright (c) 2013 Carlos Guimaraes. All rights reserved.
//

#import "MainDrawViewController.h"
#import "PolygonView.h"

@interface MainDrawViewController ()

@end

@implementation MainDrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.drawView initialize];
    [self.drawView setEditionView:self.editionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchRemoveBtn:(id)sender
{
    [self.drawView removePolygon];
}

- (UIView *)editionView
{
    if (!_editionView)
        [[NSBundle mainBundle] loadNibNamed:@"EditionView" owner:self options:nil];
    
    return _editionView;
}

- (IBAction)onTouchEditBtn:(id)sender {
    [self.drawView editPolygonStart];
}

@end
