//
//  SecondViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DetailViewController.h"

@interface SecondViewController : UIViewController
{
    IBOutlet MKMapView *fullMapView;
    NSMutableArray *stringLocation;
    NSMutableArray *stringLatitude;
    NSMutableArray *stringLongitude;
}



@end
