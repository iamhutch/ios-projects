//
//  FirstViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"


@interface FirstViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    IBOutlet UIButton *editButton;
    NSMutableArray *stringLocation;
    NSMutableArray *stringLatitude;
    NSMutableArray *stringLongitude;
    DetailViewController *detailView;
}
@property (nonatomic, retain) DetailViewController *detailView;

- (IBAction)onEdit:(id)sender;


@end
