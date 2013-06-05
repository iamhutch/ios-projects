//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "CustomCellController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize alertView, detailView, userIcon, iconURL, userView, tweetDictionary;

- (void)viewDidLoad
{
    self.title = @"Tweets";

    [self getTweets];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


/* present the user with a list of tweets from their user timeline
 ======================================================================================================== */

 - (void)getTweets
{

    [self showLoading];
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
                             NSString *userTimelineURL = @"http://api.twitter.com/1/statuses/home_timeline.json";
                             
                             TWRequest *request = [[TWRequest alloc] initWithURL:[NSURL URLWithString:userTimelineURL] parameters:nil requestMethod:TWRequestMethodGET];
                             if (request != nil)
                             {
                                 request.account = currentAccount;
                                 
                                 [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                  {
                                      if ([urlResponse statusCode] == 200) // 200 means successful request
                                      {
                                          NSError *jsonError = nil;
                                          twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                          if (twitterFeed != nil)
                                          {
                                              // cause the tableView to trigger to reload
                                              [twitterTableView reloadData];                                              

                                          }
                                          
                                      }
                                  }];
                             }
                         }
                         //NSLog(@"Description: %@", [twitterAccounts description]);

                     }
                 }
                 else
                 {
                     NSLog(@"User did not grant access.");
                     [self showError];
                 }
             }];
        }
    }
    

}

- (void)showLoading
{
    /* Using a UIAlertView, display a loading message during timeline load and refresh. Close the alertview once the load is completed.
     ======================================================================================================== */
    
    alertView = [[UIAlertView alloc] initWithTitle:@"Loading Tweets" message:@"Please wait..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    if (alertView != nil)
    {
        [alertView show];
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        if (indicator != nil)
        {
            indicator.center = CGPointMake(alertView.bounds.size.width/2.0f, (alertView.bounds.size.height/2.0f) + 20.0f);
            [indicator startAnimating];
            [alertView addSubview:indicator];
        }
        
    }

}

- (void)showError
{
    alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Could not connect to account" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    if (alertView != nil)
    {
        [alertView show];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (twitterFeed != nil)
    {
        return [twitterFeed count];
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}



/* Each cell in the tableview will need to include the post text, the post date/time, and an icon.
 ======================================================================================================== */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellController" owner:self options:nil];
    CustomCellController *cell = (CustomCellController *)[nib objectAtIndex:0];
    if (cell != nil)
    {
        tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        if (tweetDictionary != nil)
        {
            cell.tweetLabel.text = (NSString*)[tweetDictionary objectForKey:@"text"];
            cell.dateLabel.text = (NSString*)[tweetDictionary objectForKey:@"created_at"];
            
            NSString *userName = (NSString*)[[tweetDictionary objectForKey:@"user"] objectForKey:@"screen_name"];
            NSString *requestString = [NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/:screen_name.format?screen_name=%@", userName];
            
            iconURL = [NSURL URLWithString:requestString];
            NSData *imageData = [NSData dataWithContentsOfURL:iconURL];
            userIcon = [UIImage imageWithData:imageData];
            cell.icon.image = userIcon;
            
            // Get number of visible cells and dismiss alert when done
            NSArray *visibleCells = [twitterTableView visibleCells];
            if (indexPath.row == visibleCells.count) {
                //end of loading
                [alertView dismissWithClickedButtonIndex:0 animated:TRUE];
            }
            
            
        }
        return cell;
 
    }
    return nil;

}


/* When the user clicks on a tweet cell in the tableview, the user should go to a tweet detail view.
 ======================================================================================================== */

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
    if (tweetDictionary != nil)
    {
        // setup detail function
        NSString *selectedTweet = [tweetDictionary objectForKey:@"text"];
        NSString *selectedDate = [tweetDictionary objectForKey:@"created_at"];
        NSString *selectedUser = [[tweetDictionary objectForKey:@"user"] objectForKey:@"screen_name"];

        // Setup detail view
        DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
        self.detailView = myDetailView;

        // Setup information for display
        detailView.selectedTweet = selectedTweet;
        detailView.selectedDate = selectedDate;
        detailView.selectedUser = selectedUser;
        
        // Pull up my detail view
        [self presentViewController:myDetailView animated:YES completion:nil];
        
    }
}



/* A refresh button should be at the top of the view allowing you to refresh the user's timeline.
======================================================================================================== */

-(IBAction)onClick:(id)sender
{
    UIBarButtonItem *item = (UIBarButtonItem*)sender;
    
    if(item !=nil)
    {
        // Post Button
        if (item.tag == 0)
        {
            //NSLog(@"Posting to Twitter");
            [self postToTwitter];
        }
        // Refresh Button
        else if (item.tag ==1)
        {
            //NSLog(@"Reloading TableView");
            [self getTweets];
        }
        else if (item.tag ==2)
        {
            //NSLog(@"Presenting User View");
            [self showUserView];
        }
   }
}


/* Clicking on the post button will display the TWTweetComposeViewController allowing the user to post to their account. ======================================================================================================== */

- (void)postToTwitter
{
    TWTweetComposeViewController *controller = [[TWTweetComposeViewController alloc] init];
    if (controller != nil)
    {
        // set default text for user to tweet, its pre-filled in
        [controller setInitialText:@"Posted from "];
        
        // present the add tweet view to the user
        [self presentViewController:controller animated:true completion:nil];
        
        controller.completionHandler = ^(TWTweetComposeViewControllerResult res)
        {
            if (res == TWTweetComposeViewControllerResultDone)
            {
                // the user posted to twitter successfully
                //NSLog(@"Successful twitter post");
                [self dismissViewControllerAnimated:YES completion:nil];
                alertView = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Tweet was successfull posted." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                if (alertView != nil)
                {
                    [alertView show];
                }
          }
            else if (res == TWTweetComposeViewControllerResultCancelled)
            {
                // the user clicked cancel button
                alertView = [[UIAlertView alloc] initWithTitle:@"Post Cancelled" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                if (alertView != nil)
                {
                    [alertView show];                    
                }
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        };
    }

}


- (void)showUserView
{
    // Setup user view
    UserViewController *myUserView = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:[NSBundle mainBundle]];
    self.userView = myUserView;
    
    // Pull up my detail view
    [self presentViewController:myUserView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
