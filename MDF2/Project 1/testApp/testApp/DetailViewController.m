//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 1/10/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize eventDisplay, selectedLocationText, selectedTitle, selectedLocation, selectedDate, selectedTime, defaultCalendar, eventToSave;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithTextSelected:(NSString *)text
{
    self.selectedTitle = text;
    [eventDisplay setText:[self selectedLocationText]];
    self.defaultCalendar = defaultCalendar;
    
    return self;
}

-(IBAction)onBack:(id)sender
{
    // Close out the Detail View
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onAdd:(id)sender
{
    /*
    // Add event to calendar
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Are you sure you want to add this event to your default or selected calendar?" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alertView != nil)
        {
            [alertView show];
        }*/
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Confirmation"
                                                      message:@"Are you sure you want to add this event to your default or selected calendar?"
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Ok", nil];
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
    {
		NSLog(@"user pressed cancel");
        
	}
	else
    {
		NSLog(@"user pressed ok");
        
        eventToSave = [[NSMutableArray alloc] init];
       
        [eventToSave addObject:selectedTitle];
        [eventToSave addObject:selectedLocation];
        [eventToSave addObject:selectedDate];
        [eventToSave addObject:selectedTime];
        [eventToSave addObject:defaultCalendar];
        
        ViewController *defaultView = [[ViewController alloc] init];
        [defaultView saveEvent:eventToSave];
        
	}
}



- (void)viewDidLoad
{
    [eventDisplay setText:[self selectedLocationText]];
    //NSLog(@"%@", defaultView.defaultCal);
 
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
