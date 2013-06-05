//
//  SecondViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/14/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    NSURL *url;
    NSURLRequest *request;
    NSURLConnection *connection;
    IBOutlet UIWebView *myWebView;
}
- (IBAction)onClick:(id)sender;

@end
