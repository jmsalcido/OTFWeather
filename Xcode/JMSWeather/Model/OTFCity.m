//
//  OTFCity.m
//  OTFWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import "OTFCity.h"

@implementation OTFCity
@synthesize latitude, longitude, ciudad;

-(id)initWithCLLocation:(CLLocation *)location
{
    self = [super init];
    if(self) {
        // Guardamos location!!!
        _location = location;
        
        // latitud
        _grados = location.coordinate.latitude;
        _decimal = fabs(location.coordinate.latitude - _grados);
        _minutos = _decimal*60;
        _segundos = _decimal * 3600 - _minutos * 60;
        latitude = [NSString stringWithFormat:@"%d° %d' %1.4f\"", _grados, _minutos, _segundos];
        
        // longitud
        _grados = location.coordinate.longitude;
        _decimal = fabs(location.coordinate.latitude - _grados);
        _minutos = _decimal*60;
        _segundos = _decimal * 3600 - _minutos * 60;
        longitude = [NSString stringWithFormat:@"%d° %d' %1.4f\"", _grados, _minutos, _segundos];
    }
    return(self);
}

-(void)obtenCiudad
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:_location completionHandler:^(NSArray *placemarks, NSError *error) {
            dispatch_async(dispatch_get_main_queue(),^ {
                // do stuff with placemarks on the main thread
                
                if (placemarks.count == 1) {
                    
                    CLPlacemark *place = [placemarks objectAtIndex:0];
                    
                    
                    NSString *cityString = place.locality;
                    NSLog(@"%@", cityString);
                    [self performSelector:@selector(setCiudad:) withObject:cityString];
                }
            });
    }];
}

@end
