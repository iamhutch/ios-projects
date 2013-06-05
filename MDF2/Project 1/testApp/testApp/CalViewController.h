//
//  CalViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 1/10/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ViewController.h"

typedef void (^CloseHandler)(NSString*);

@interface CalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CloseHandler handlerCal;
    IBOutlet UITableView *myTableView;
    NSMutableArray *stringLocation;
    NSArray *calendars;
    NSString *selectedCal;
    NSString *calIdentifier;
    EKCalendar *myDefaultCal;
    ViewController *viewControlR;
}

@property (nonatomic, strong) CloseHandler handlerCal;
@property (nonatomic, retain) NSArray *calendars;
@property (nonatomic, retain) NSString *calIdentifier;
@property (nonatomic, retain) EKCalendar *myDefaultCal;
@property (nonatomic, retain) ViewController *viewControlR;


-(IBAction)onClick:(id)sender;


@end
