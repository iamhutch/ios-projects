//
//  SecondViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "SecondViewController.h"
#import "MyMapAnnotation.h"
#import "MyAnnotationView.h"

@interface SecondViewController ()

@end


@implementation SecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Map", @"Map");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{

    stringLocation = [[NSMutableArray alloc] initWithObjects:
                      @"Pearl City, Hawaii",
                      @"Harker Heights, Texas",
                      @"Tamuning, Guam",
                      @"Pearl City, Hawaii",
                      @"Killeen, Texas",
                      @"Lampasas, Texas",
                      @"Harker Heights, Texas",
                      @"Tamuning, Guam",
                      @"Austin, Texas",
                      @"Harker Heights, Texas",
                      nil];
    

    stringLatitude = [[NSMutableArray alloc] initWithObjects:
                      @"21.388352",
                      @"31.075469",
                      @"13.510645",
                      @"21.388352",
                      @"31.127764",
                      @"31.064846",
                      @"31.083510",
                      @"13.476263",
                      @"30.267153",
                      @"31.082399",
                      nil];
    
    stringLongitude = [[NSMutableArray alloc] initWithObjects:
                       @"-157.953836",
                       @"-97.653306",
                       @"144.813237",
                       @"-157.953836",
                       @"-97.734482",
                       @"-98.152801",
                       @"-97.659738",
                       @"144.799584",
                       @"-97.743061",
                       @"-97.654709",
                       nil];

    
    MKCoordinateSpan span;
    span.latitudeDelta = 100.0f;
    span.longitudeDelta = 100.0f;
    
    CLLocationCoordinate2D location;
    location.latitude = 38.55f;
    location.longitude = -120.33f;
    
    MKCoordinateRegion region;
    region.center = location;
    region.span = span;
    fullMapView.region = region;
    
    int i;
    for (i = 0; i < [stringLocation count]; i++) {
        NSString *myLatitude = [stringLatitude objectAtIndex:i];
        NSString *myLongitude = [stringLongitude objectAtIndex:i];
        
        float latitudeFloat = [myLatitude floatValue];
        float longitudeFloat = [myLongitude floatValue];

       
        CLLocationCoordinate2D location;
        location.latitude = latitudeFloat;
        location.longitude = longitudeFloat;
        
        
        MyMapAnnotation *annotation =[[MyMapAnnotation alloc] initWithTitle:@"Just A Hutch" coord:location];
        if (annotation != nil)
        {
            [fullMapView addAnnotation:annotation];
        }

    }




    


    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
