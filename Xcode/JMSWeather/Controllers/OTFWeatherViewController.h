//
//  OTFWeatherViewController.h
//  JMSWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTFWeatherViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelCiudad;
@property (weak, nonatomic) IBOutlet UIImageView *imagenClima;

- (IBAction)obtenerClima:(id)sender;
@end
