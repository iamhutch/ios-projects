//
//  FirstViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Accounts/Accounts.h>
#import "CustomTableCell.h"
#import "EditViewController.h"
#import "SecondViewController.h"
#import <MessageUI/MessageUI.h>

@class Controller;

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, MFMailComposeViewControllerDelegate, CLLocationManagerDelegate, EditViewControllerDelegate>
{
    IBOutlet UITableView *reminderTableView;
    CustomTableCell *customCell;
    Controller *controller;
    NSDictionary *myNewData;
    NSMutableArray *savedData;
    NSMutableDictionary *dataDictionary;
    NSMutableDictionary *edittedDictionary;
    UIBarButtonItem *edit;
    NSMutableArray *shareLinks;
    NSString *shareReminder;
    NSString *shareDate;
    UIAlertView *alertView;
    NSDictionary *jsonWeather;
    IBOutlet UILabel *weather;
    IBOutlet UILabel *location;
    CLLocationManager *locationManager;
    NSString *lat;
    NSString *lon;
    NSUserDefaults *defaults;
   
}

@property (nonatomic, retain) NSMutableArray *savedData;
@property (strong, nonatomic) NSDictionary *myNewData;
@property (strong, nonatomic) NSMutableDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableDictionary *edittedDictionary;
@property (nonatomic, strong) NSMutableArray *shareLinks;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end
