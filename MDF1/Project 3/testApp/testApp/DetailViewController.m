//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"
#import "MyMapAnnotation.h"
#import "MyAnnotationView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


@synthesize clientDisplay, selectedLocationText, selectedLocation, selectedLatitude, selectedLongitude;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithTextSelected:(NSString *)text
{
    self.selectedLocationText = text;
    [clientDisplay setText:[self selectedLocationText]];
    return self;
}


-(IBAction)onBack:(id)sender
{
    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    
    [clientDisplay setText:[self selectedLocationText]];
    
    NSString *myLatitude = selectedLatitude;
    float latitudeFloat = [myLatitude floatValue];

    NSString *myLongitude = selectedLongitude;
    float longitudeFloat = [myLongitude floatValue];

    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.5f;
    span.longitudeDelta = 0.5f;
    
    CLLocationCoordinate2D location;
    location.latitude = latitudeFloat;
    location.longitude = longitudeFloat;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitudeFloat;
    coordinate.longitude = longitudeFloat;
    

    NSString *displayName = [[NSString alloc] initWithFormat: @"Just a Hutch Designs, %@", selectedLocation];

    
    MyMapAnnotation *annotation =[[MyMapAnnotation alloc] initWithTitle:displayName coord:coordinate];
    
    
    
    MyMapAnnotations = [[NSArray alloc] initWithObjects:annotation, nil];
    
    if (MyMapAnnotations != nil)
    {
        [mapView addAnnotations:MyMapAnnotations];
    }
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
     MKPinAnnotationView *annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPin"];
     annView.animatesDrop = TRUE;
     annView.pinColor = MKPinAnnotationColorPurple;
         
    
    annView.canShowCallout = TRUE;
    // location of the callout
    annView.calloutOffset = CGPointMake(-5, 5);
    
        
    return annView;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
