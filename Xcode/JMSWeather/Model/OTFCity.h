//
//  OTFCity.h
//  OTFWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface OTFCity : NSObject
{
    NSInteger   _grados;
    double      _decimal;
    NSInteger   _minutos;
    double      _segundos;
    CLLocation  *_location;
}

@property NSString *latitude;
@property NSString *longitude;
@property NSString *ciudad;

-(id)initWithCLLocation:(CLLocation *)location;
-(void)obtenCiudad;
@end
