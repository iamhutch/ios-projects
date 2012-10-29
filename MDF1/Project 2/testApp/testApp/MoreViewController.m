//
//  MoreViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "MoreViewController.h"
#import "ContactViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)onClick:(id)sender
{
    ContactViewController *contactView = [[ContactViewController alloc] initWithNibName:@"ContactView" bundle:nil];
    if (contactView != nil)
    {
        [self.navigationController pushViewController:contactView animated:true];
    }
}

- (void)viewDidLoad
{
    self.title= @"About Me";
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
