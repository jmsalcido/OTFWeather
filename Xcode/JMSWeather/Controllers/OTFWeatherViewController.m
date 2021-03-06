//
//  OTFWeatherViewController.m
//  JMSWeather
//
//  Created by Jose Miguel Salcido on 12/21/12.
//  Copyright (c) 2012 OTFusion. All rights reserved.
//

#import "OTFWeatherViewController.h"
#import "OTFConstants.h"

@implementation OTFWeatherViewController
@synthesize imagenClima;
@synthesize labelCiudad;

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
    
    // LocationManager
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone; // Cuando nos movamos?
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    // Poner imagen de esperando
    UIImage *imagenEsperando = [UIImage imageNamed:@"espera.png"];
    imagenClima.image = imagenEsperando;
    
	// Cambiar color de fondo
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:BACKGROUND_IMAGE_FILENAME]];
    [self.view setBackgroundColor:bgColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)obtenerClima:(id)sender
{
    // Location Manager used once?
    [_locationManager startUpdatingLocation];
    
    // Mostrar mensaje
    NSString *alertaTitle = @"Obteniendo Ciudad";
    NSString *alertaMessage = @"Espera un momento mientras se obtiene la locacion geografica donde te encuentras.";
    UIAlertView *alertaEsperaView = [[UIAlertView alloc] initWithTitle:alertaTitle message:alertaMessage delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    
    // Se debe mostrar la alerta primero para obtener bien los valores del tamaño
    [alertaEsperaView show];
    NSLog(@"centro(%f,%f);", alertaEsperaView.bounds.size.width/2, alertaEsperaView.bounds.size.height-50);
    
    // Creamos el spinner que se agregara al mensaje
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(alertaEsperaView.bounds.size.width/2, alertaEsperaView.bounds.size.height - 50);
    
    // Agregamos el spinner al mensaje y lo ponemos a girar.
    [alertaEsperaView addSubview:spinner];
    [spinner startAnimating];
    
    // Se realizara la accion de cerrar en 5 segundos (en el release 0, pues tardara lo que tenga que tardar)
    [self performSelector:@selector(closeAlertaView:) withObject:alertaEsperaView afterDelay:10];
}

- (void) closeAlertaView:(UIAlertView *)view
{
    // Dejar de usar el location manager
    [_locationManager stopUpdatingLocation];
    
    [view dismissWithClickedButtonIndex:0 animated:YES];
    labelCiudad.text = _otfcity.ciudad;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", locations);
    _otfcity = [[OTFCity alloc] initWithCLLocation:[locations objectAtIndex:0]];
    [_otfcity obtenCiudad];
    NSLog(@"%@, %@", _otfcity.latitude, _otfcity.longitude);
}
@end
