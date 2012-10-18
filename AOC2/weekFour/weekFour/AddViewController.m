//
//  AddViewController.m
//  weekFour
//
//  Created by Lucy Hutcheson on 10/16/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

@synthesize delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        delegate = nil;
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    eventDate.minimumDate = [NSDate date];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    leftSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    leftSwiper.direction = UISwipeGestureRecognizerDirectionLeft;
    [swipeLeftLabel addGestureRecognizer:leftSwiper];
    
    
    [super viewWillAppear:animated];
}



/*------------------------------------------------------------------------------------------ *
    When the user swipes left on the UILabel, collect the event title information as 
    well as the date/time information from the picker and close the event view.
 *------------------------------------------------------------------------------------------ */

- (void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    // If the event name is empty, throw up an alert
    if ([eventName.text isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"An event name is required." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alertView != nil)
        {
            [alertView show];
        }
    }
    // If the event name is filled in, move on to save
    else
    {
        // Format my date
        NSDate *date = eventDate.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"MMM dd, h:mm a"];
        }
        eventDateFormatted = [dateFormatter stringFromDate:date];
        
        if (delegate != nil)
        {
            // Send my events to the onSave function
            myEvent = [NSString stringWithFormat:@"%@ \n %@ \n \n", eventName.text, eventDateFormatted];
            [delegate onSave:myEvent];
        }
        
        // Close out the Add View
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}



// Close keyboard 
-(IBAction)closeKeyboard:(id)sender
{
    [eventName resignFirstResponder];
}

// Added in the close keyboard when they hit enter after typing in event name
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [eventName resignFirstResponder];
    return true;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
