//
//  SecondViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/14/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"XML View", @"XML View");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // create url
    url = [[NSURL alloc] initWithString:@"http://dl.dropbox.com/u/47516348/forecast.xml"];

    request = [[NSURLRequest alloc] initWithURL:url];
        if (request != nil)
        {
            connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        }
        myWebView.scalesPageToFit = YES;
        [myWebView loadRequest:request];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(id)sender
{
    [myWebView stopLoading];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
