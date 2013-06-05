//
//  UserViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/12/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "UserViewController.h"
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize selectedName, selectedDescription, selectedFollowers, selectedFriends, userFeed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
	[activityIndicator setCenter:CGPointMake(160.0f,274.0f)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
	[self.view addSubview:activityIndicator];
	
    [activityIndicator startAnimating];
   
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
             {
                 if (granted)
                 {
                     NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                     if (twitterAccounts != nil)
                     {
                         // Need to cast current information to an actual object in order to use it
                         ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                         if (currentAccount != nil)
                         {
                             
                             NSString *currentUserName = currentAccount.username;
                             
                             // Get USER Info using a DYNAMIC URL string
                             NSString *requestString = [NSString stringWithFormat:@"https://api.twitter.com/1/users/show.json?screen_name=%@", currentUserName];

                             
                             TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:requestString] parameters:nil requestMethod:TWRequestMethodGET];
                             if (request != nil)
                             {
                                 request.account = currentAccount;
                                 
                                 [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                  {
                                      if ([urlResponse statusCode] == 200) // 200 means successful request
                                      {
                                          NSError *jsonError = nil;
                                          userFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                          if (userFeed != nil)
                                          {
                                              [self setupUser];
                                          }
                                          
                                      }
                                  }];
                             }
                         }
                     }
                 }
                 else
                 {
                     NSLog(@"User did not grant access.");
                 }
             }];
        }

    }
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)setupUser
{
    //NSLog(@"Feed: %@", userFeed);
    //NSLog(@"%@", [userFeed objectForKey:@"followers_count"]);
    //NSLog(@"%@", [userFeed objectForKey:@"description"]);
    
    [userName setText:[userFeed objectForKey:@"name"]];
    [userDescription setText:[NSString stringWithFormat:@"%@", [userFeed objectForKey:@"description"]]];
    [userFriends setText:[NSString stringWithFormat:@"%@", [userFeed objectForKey:@"friends_count"]]];
    [userFollowers setText:[NSString stringWithFormat:@"%@",[userFeed objectForKey:@"followers_count"]]];

    NSString *requestString = [NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/:screen_name.format?screen_name=%@", [userFeed objectForKey:@"screen_name"]];
    
    NSURL *iconURL = [NSURL URLWithString:requestString];
    NSData *imageData = [NSData dataWithContentsOfURL:iconURL];
    UIImage *userIcon = [UIImage imageWithData:imageData];
    
    userIconView.image = userIcon;
    [activityIndicator stopAnimating];
   
    
}


-(IBAction)onBack:(id)sender
{
    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
