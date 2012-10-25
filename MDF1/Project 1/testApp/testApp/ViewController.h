//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 10/23/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *stringNames;
    NSMutableArray *stringLocation;
    NSMutableArray *stringWebsites;
    DetailViewController *detailView;
}
@property (nonatomic, retain) DetailViewController *detailView;

- (IBAction)onEdit:(id)sender;

@end
