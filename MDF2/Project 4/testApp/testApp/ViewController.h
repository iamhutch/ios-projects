//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/25/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    DetailViewController *detailView;
    NSMutableArray *movieList;
}

@property (nonatomic, retain) DetailViewController *detailView;
@property (nonatomic, retain) NSMutableArray *movieList;


@end
