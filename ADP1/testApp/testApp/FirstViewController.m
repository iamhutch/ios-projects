//
//  FirstViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomTableCell.h"
#import "Controller.h"
#import "Singleton.h"
#import <Social/Social.h>

@interface FirstViewController ()

@end

@implementation FirstViewController


@synthesize savedData, myNewData, dataDictionary, edittedDictionary, shareLinks, locationManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"My Reminders", @"Reminders");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        shareLinks = [[NSMutableArray alloc] initWithObjects:@"Twitter", @"Email",nil];
    }
    return self;
}

- (void)addItemViewController:(EditViewController *)controller didFinishEnteringItem:(NSMutableDictionary *)item
{
    if (item != nil)
    {
        //[savedData addObject:item];
        [reminderTableView reloadData];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];

    // Have I already loaded my data from my data.plist file
    Singleton *instance = [Singleton GetInstance];
    if (instance.data != nil)
    {
        if (instance.save != nil) {
            // If there's data loaded from my plist file, add it to this holder array of dictionaries
            [savedData addObject:instance.data];
        }
        instance.save = nil;
        [reminderTableView reloadData];
    }
    // Is there any data incoming from Edit View?
    if (edittedDictionary != nil)
    {
        [reminderTableView reloadData];
        
    }

    // Setup edit button
    edit = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStyleBordered target:self action:@selector(editTable)];
    self.navigationItem.rightBarButtonItem = edit;

}

-(void)editTable
{
    // Allow deleting of reminders
    if (reminderTableView.editing == false)
    {
        [reminderTableView setEditing: true];        
        // Set button to done to indicate to user to press to get out of edit mode
        [edit setTitle:@"Done"];
    }
    else
    {
        [reminderTableView setEditing: false];        
        // Set button back to edit for user to see
        [edit setTitle:@"Edit"];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    // Remove editted info and get ready for next use
    [edittedDictionary removeAllObjects];
}


- (void)viewDidLoad
{
    // Pull data
    controller = [[Controller alloc] init];
    if (controller != nil)
    {
        savedData = [controller getData];
        //NSLog(@"Saved data loaded");
    }
    // Register for notification so we can save data on exit
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        lon = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        lat = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        //NSLog(@"Lat: %@, Lon:  %@", lat, lon);
        [self getWeather];       
    }
    // Stop Location Manager
    [locationManager stopUpdatingLocation];

}

-(void)getWeather
{
    // GET WEATHER
    NSError *jsonError = nil;
    NSString *jsonPathWithGPS = [NSString stringWithFormat:@"http://api.wunderground.com/api/e21b2f1ef75e6b1a/conditions/q/%@,%@.json", lat, lon];
    NSURL *weatherPath = [NSURL URLWithString:jsonPathWithGPS];
    if (weatherPath !=  nil)
    {
        NSURLRequest *dataRequest = [NSURLRequest requestWithURL:weatherPath];
        if (dataRequest != nil)
        {
            NSURLConnection *dataConnection = [[NSURLConnection alloc] initWithRequest:dataRequest delegate:self];
            if (dataConnection != nil)
            {
                NSData *weatherData = [NSData dataWithContentsOfURL:weatherPath options:NSDataReadingMappedIfSafe error:&jsonError];
                if (weatherData != nil)
                {
                    jsonWeather = [NSJSONSerialization JSONObjectWithData:weatherData options:0 error:&jsonError];
                    if (jsonWeather != nil)
                    {
                        float temperature = [[[jsonWeather objectForKey:@"current_observation"] objectForKey:@"temp_f"] floatValue];
                        weather.text = [NSString stringWithFormat:@"%.0f", ceilf(temperature)];
                        NSString *city = [[[jsonWeather objectForKey:@"current_observation"] objectForKey:@"display_location"] objectForKey:@"city"];
                        location.text = city;
                        //NSLog(@"Lat: %@, Lon:  %@", lat, lon);
                    }
                }
            }
            else
            {
                NSLog(@"Connection failed");
            }
        }
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (savedData != nil)
    {
        return [savedData count];
    }
    return 0;
}

// Setup custom table cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomTableCell *newCell = [reminderTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (newCell == nil)
    {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
        for (UIView *view in views)
        {
            if([view isKindOfClass:[CustomTableCell class]])
            {
                newCell = (CustomTableCell*)view;
                // setup dictionary based on data array and setup cell
                dataDictionary = [savedData objectAtIndex:indexPath.row];
                if (dataDictionary != nil)
                {
                    newCell.titleLabel.text = (NSString*)[dataDictionary objectForKey:@"Title"];
                    // Format date field
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"EEE, MMM d 'at' h:mm a"];
                    newCell.dateLabel.text = [dateFormatter stringFromDate:[dataDictionary objectForKey:@"Date"]];
                    
                    // Setup Notifications
                    [self scheduleNotifications:nil date:[dataDictionary objectForKey:@"Date"] body:(NSString*)[dataDictionary objectForKey:@"Title"]];
                }
                UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [editButton setFrame:CGRectMake(190, 6, 50, 50)];
                [editButton setBackgroundImage:[UIImage imageNamed:@"edit@2x.png"] forState:UIControlStateNormal];
                [editButton addTarget:self action:@selector(editButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [newCell.bottomView addSubview:editButton];
                
                UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [shareButton setFrame:CGRectMake(260, 6, 50, 50)];
                [shareButton setBackgroundImage:[UIImage imageNamed:@"share@2x.png"] forState:UIControlStateNormal];
                [shareButton addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
                [newCell.bottomView addSubview:shareButton];
           }
        }
    }
    return newCell;
}

-(void)scheduleNotifications:(id)sender date:(NSDate*)date body:(NSString*)body
{
    // Cancels all scheduled notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

    NSDate *notifyDate = date;
    
    UILocalNotification *local = [[UILocalNotification alloc] init];
    
    if (local != nil)
    {
        local.fireDate = notifyDate;
        local.timeZone = [NSTimeZone localTimeZone];
        local.alertBody = body;
        local.alertAction = @"View Reminder";
        
        [[UIApplication sharedApplication] scheduleLocalNotification:local];
    }
    

}

-(void)editButtonPressed:(id)sender
{
    // Get indexPath so I know what data to pull for Editting
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:reminderTableView];
    NSIndexPath *indexPath = [reminderTableView indexPathForRowAtPoint:buttonPosition];

    EditViewController *editView = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
    editView.delegate = self;

    if (editView != nil)
    {
        if (dataDictionary != nil)
        {
            editView.editDataDictionary = [savedData objectAtIndex:indexPath.row];
        }
        // Change back button title
        UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
        [[self navigationItem] setBackBarButtonItem: newBackButton];
        // Present my edit view controller
        [[self navigationController] pushViewController:editView animated:YES];
        //[self.navigationController pushViewController:editView animated:TRUE];
    }
}

-(void)shareButtonPressed:(id)sender
{
    // Get indexPath so I know what data to pull for Editting
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:reminderTableView];
    NSIndexPath *indexPath = [reminderTableView indexPathForRowAtPoint:buttonPosition];
    
    shareReminder = (NSString*)[[savedData objectAtIndex:indexPath.row] objectForKey:@"Title"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy 'at' h:mma"];
    shareDate = (NSString*)[dateFormatter stringFromDate:[[savedData objectAtIndex:indexPath.row] objectForKey:@"Date"]];
    
    //Action Sheet
    NSString *actionSheetTitle = @"Share This Reminder"; 
    NSString *other1 = @"Tweet";
    NSString *other2 = @"Email";
    NSString *cancelTitle = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:other1, other2, nil];
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Email"]) {
        if ([MFMailComposeViewController canSendMail])
        {
            NSString *emailTitle = @"House Boss Reminder";
            NSString *messageBody = [NSString stringWithFormat:@"I have to %@ on %@!", shareReminder, shareDate];
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:NO];
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Your device doesn't support the composer sheet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    if ([buttonTitle isEqualToString:@"Cancel"]) {
        NSLog(@"Cancel pressed ");
    }
    if ([buttonTitle isEqualToString:@"Tweet"]) {
        
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            

            tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
                switch(result) {
                        //  This means the user cancelled without sending the Tweet
                    case SLComposeViewControllerResultCancelled:
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Post Cancelled" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                        [reminderTableView reloadData];
                       break;
                    }
                        //  This means the user hit 'Send'
                    case SLComposeViewControllerResultDone:
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Tweet was successfully posted." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alert show];
                        [reminderTableView reloadData];
                        break;
                    }
                }
                
                //  dismiss the Tweet Sheet
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:NO completion:^{
                        //NSLog(@"Tweet Sheet has been dismissed.");
                    }];
                });
            };

            [tweetSheet setInitialText:[NSString stringWithFormat:@"I have to %@ on %@!\n#HouseBoss", shareReminder, shareDate]];
            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Cancelled" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
       }
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Email was successfully sent." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [reminderTableView reloadData];
           NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        }
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:TRUE completion:nil];
}


// Make my table rows taller
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
   [reminderTableView setAllowsSelection:NO];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set up editing style to delete
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // remove All related objects from our data array so they don't show up in details
    [self.savedData removeObjectAtIndex:indexPath.row];
    [reminderTableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) applicationDidEnterBackground:(NSNotification*)notification
{
    // Save the reminders when application closes using the savedData array
    NSString *error;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];

    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:savedData format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    if(plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
    else {
        NSLog(@"%@", error);
    }
}

@end
