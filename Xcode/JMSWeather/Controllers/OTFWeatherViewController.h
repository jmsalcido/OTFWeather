//
//  OTFWeatherViewController.h
//  JMSWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "OTFCity.h"
@interface OTFWeatherViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    OTFCity *_otfcity;
}

@property (weak, nonatomic) IBOutlet UILabel *labelCiudad;
@property (weak, nonatomic) IBOutlet UIImageView *imagenClima;

- (IBAction)obtenerClima:(id)sender;
@end
