//
//  CalViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 1/10/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "CalViewController.h"


@interface CalViewController ()

@end

@implementation CalViewController
@synthesize handlerCal, calendars, calIdentifier, myDefaultCal, viewControlR;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        handlerCal = nil;
    }
    return self;
}

- (void)viewDidLoad
{

    // EKEventStore is db where calendars are stored
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    
    calendars = [eventStore calendarsForEntityType:EKEntityTypeEvent];
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
    {
        if (granted)
        {
            // access the calendars
            if (calendars != nil)
            {
                for (int i=0; i<[calendars count]; i++)
                {
                    NSLog(@"calendar name: %@", [[calendars objectAtIndex:i] title]);
                    myDefaultCal = [calendars objectAtIndex:i];
                    NSLog(@"id %@", myDefaultCal.calendarIdentifier);
                }
            }
        }
        else
        { //denied
        }
    }];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return calendars.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    EKCalendar *calendar = [calendars objectAtIndex:indexPath.row];
    cell.textLabel.text = calendar.title;
    return cell;
  
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Pull the selected calendar and add to my string    
    myDefaultCal = [calendars objectAtIndex:[indexPath row]];
    calIdentifier = myDefaultCal.calendarIdentifier;
}


// Save Calendar button is clicked
-(IBAction)onClick:(id)sender
{
    if (handlerCal != nil)
    {
        handlerCal(calIdentifier);
    }
    
    [self dismissViewControllerAnimated:true completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
