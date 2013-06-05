//
//  FirstViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/14/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface FirstViewController : UIViewController <NSURLConnectionDelegate, NSXMLParserDelegate, UITableViewDelegate>
{
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    
    NSMutableData *requestData;
    NSData *xmlData;
    NSInteger numItems;
    NSMutableArray *forecasts;
    
    IBOutlet UITableView *myTableView;
    NSMutableArray *stringNames;
    NSMutableArray *stringLocation;
    NSMutableArray *stringWebsites;
    DetailViewController *detailView;

}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (NSData*)GetFileDataFromFile:(NSString*)filename;


@property (nonatomic, retain) DetailViewController *detailView;

@end
