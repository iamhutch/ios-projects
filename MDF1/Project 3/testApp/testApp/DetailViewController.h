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
    NSString *clientSelected;
    IBOutlet MKMapView *mapView;
    NSArray *MyMapAnnotations;
}

@property (nonatomic, retain) IBOutlet UITextView *clientDisplay;
@property (nonatomic, retain) NSString *clientSelected;

-(IBAction)onBack:(id)sender;
-(id)initWithTextSelected:(NSString*)text;


@end
