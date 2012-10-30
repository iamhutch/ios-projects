//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"
#import "SecondViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize clientDisplay, clientSelected;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Display data from selected client from SecondView
- (id)initWithTextSelected:(NSString *)text
{
    self.clientSelected = text;
    [clientDisplay setText:[self clientSelected]];
    return self;
}


-(IBAction)onBack:(id)sender
{
    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [clientDisplay setText:[self clientSelected]];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
