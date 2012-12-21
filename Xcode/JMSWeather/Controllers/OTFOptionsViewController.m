//
//  OTFOptionsViewController.m
//  JMSWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import "OTFOptionsViewController.h"
#import "OTFConstants.h"

@implementation OTFOptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Cambiar color de fondo
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:BACKGROUND_IMAGE_FILENAME]];
    [self.view setBackgroundColor:bgColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
