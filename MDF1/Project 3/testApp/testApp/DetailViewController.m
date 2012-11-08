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


@synthesize clientDisplay;
@synthesize clientSelected;


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
    self.clientSelected = text;
    [clientDisplay setText:[self clientSelected]];
    return self;
}


-(IBAction)onBack:(id)sender
{
    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [clientDisplay setText:[self clientSelected]];

    
    MKCoordinateSpan span;
    span.latitudeDelta = 50.0f;
    span.longitudeDelta = 50.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 28.55f;
    location.longitude = -81.33f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    mapView.region = region;
    
    CLLocationCoordinate2D orlandoLocation;
    orlandoLocation.latitude = 28.55f;
    orlandoLocation.longitude = -81.33f;
    
    CLLocationCoordinate2D boiseLocation;
    boiseLocation.latitude = 43.56444f;
    boiseLocation.longitude = -116.22277f;
    
    CLLocationCoordinate2D tokyoLocation;
    tokyoLocation.latitude = 35.6833f;
    tokyoLocation.longitude = 139.7667f;

    MyMapAnnotation *annotation =[[MyMapAnnotation alloc] initWithTitle:@"Orlando" coord:orlandoLocation];
    
    MyMapAnnotation *annotation2 =[[MyMapAnnotation alloc] initWithTitle:@"Boise" coord:boiseLocation];
    
    MyMapAnnotation *annotation3 =[[MyMapAnnotation alloc] initWithTitle:@"Boise" coord:tokyoLocation];
    
    MyMapAnnotations = [[NSArray alloc] initWithObjects:annotation, annotation2, annotation3, nil];
    
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
