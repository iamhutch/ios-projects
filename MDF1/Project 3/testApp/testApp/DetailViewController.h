//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DetailViewController : UIViewController
{
    // setup
    IBOutlet UITextView *clientDisplay;
    NSString *selectedLocationText;
    NSString *selectedLocation;
    NSString *selectedLatitude;
    NSString *selectedLongitude;
    IBOutlet MKMapView *mapView;
    NSArray *MyMapAnnotations;
}

@property (nonatomic, retain) IBOutlet UITextView *clientDisplay;
@property (nonatomic, retain) NSString *selectedLocationText;
@property (nonatomic, retain) NSString *selectedLocation;
@property (nonatomic, retain) NSString *selectedLatitude;
@property (nonatomic, retain) NSString *selectedLongitude;

-(IBAction)onBack:(id)sender;
-(id)initWithTextSelected:(NSString*)text;


@end
