//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 10/23/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *stringArray;
}

- (IBAction)onEdit:(id)sender;

@end
