//
//  ListViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "ListViewController.h"
#import "AddViewController.h"

@interface ListViewController : UIViewController <UITableViewDelegate, AddViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *firstName;
    NSMutableArray *lastName;
    NSMutableArray *email;
    NSMutableArray *phone;
    NSMutableArray *photo;
    DetailViewController *detailView;
}
@property(nonatomic, strong) IBOutlet UIButton *addButton;

@property(nonatomic, retain) DetailViewController *detailView;

-(IBAction)onClick:(id)sender;


@end
