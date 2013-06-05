//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 1/9/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    IBOutlet UITableView *eventTableView;
    NSMutableArray *eventTitle;
    NSMutableArray *eventLocation;
    NSMutableArray *eventTime;
    NSMutableArray *eventDate;
    DetailViewController *detailView;
    IBOutlet UILabel *selectedCal;
    EKEventStore *eventStore;
    
}
@property (nonatomic, retain) DetailViewController *detailView;
@property (nonatomic, strong) EKEventStore *eventStore;

- (void)saveEvent:(NSArray *)array;

-(IBAction)onClick:(id)sender;

@end
