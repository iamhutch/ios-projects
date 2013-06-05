//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "UserViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
{
    NSArray *twitterFeed;
    IBOutlet UITableView *twitterTableView;
    UIAlertView *alertView;
    DetailViewController *detailView;
    UIImage *userIcon;
    NSURL *iconURL;
    UserViewController *userView;
    NSDictionary *tweetDictionary;
}

@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, retain) DetailViewController *detailView;
@property (nonatomic, strong) UIImage *userIcon;
@property (nonatomic, strong) NSURL *iconURL;
@property (nonatomic, retain) UserViewController *userView;
@property (nonatomic, strong) NSDictionary *tweetDictionary;

-(IBAction)onClick:(id)sender;

@end
