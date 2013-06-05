//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize selectedTweet, selectedDate, selectedUser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



/* The tweet detail view will have a back button, the tweet text, date/time, 
    the name of the posting user (look in the user section of the JSON). 
    This page can have any layout you wish as long as all the content is displayed.

 ======================================================================================================== */

- (void)viewDidLoad
{
    self.title= @"Tweet Details";
    
    // Load up my tweet info
    [tweetText setText:[self selectedTweet]];
    [tweetDate setText:[self selectedDate]];
    tweetUser.text = selectedUser;
    
    NSString *requestString = [NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/:screen_name.format?screen_name=%@", selectedUser];
    
    NSURL *iconURL = [NSURL URLWithString:requestString];
    NSData *imageData = [NSData dataWithContentsOfURL:iconURL];
    UIImage *userIcon = [UIImage imageWithData:imageData];
    
    tweetIcon.image = userIcon;

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)onBack:(id)sender
{
    tweetIcon = nil;

    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
