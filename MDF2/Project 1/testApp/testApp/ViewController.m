//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 1/9/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "CalViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize detailView, eventStore;

- (void)viewDidLoad
{
    
    /*  Provide a table view list of ten or more fictional events. 
        Each fictional event must contain a title, location, time and date. 
        The time and date must be for some time in the future and cannot be "now"
     */
    eventTitle = [[NSMutableArray alloc] initWithObjects:
                      @"Bible Study",
                      @"James Birthday Party",
                      @"Sip and See",
                      @"Church",
                      @"MDF2 Hangout",
                      @"Prayer Meeting",
                      @"Doctor Appt",
                      @"Dentist Appt",
                      @"House Closing",
                      @"Move In",
                      nil];

    eventLocation = [[NSMutableArray alloc] initWithObjects:
                  @"Pastors House",
                  @"Paintball, Cove",
                  @"Pastors House",
                  @"Killeen",
                  @"Online",
                  @"Pastors House",
                  @"Scott and White",
                  @"Total Dental",
                  @"Title Company",
                  @"Copperas Cove",
                  nil];

    eventDate = [[NSMutableArray alloc] initWithObjects:
                  @"January 19, 2013",
                  @"January 19, 2013",
                  @"January 19, 2013",
                  @"January 22, 2013",
                  @"January 24, 2013",
                  @"January 21, 2013",
                  @"January 29, 2013",
                  @"January 25, 2013",
                  @"January 21, 2013",
                  @"January 22, 2013",
                  nil];
    
    eventTime = [[NSMutableArray alloc] initWithObjects:
                  @"6:44 PM",
                  @"12:00 PM",
                  @"10:00 AM",
                  @"10:29 AM",
                  @"5:00 PM",
                  @"6:30 PM",
                  @"8:00 AM",
                  @"10:15 AM",
                  @"1:00 PM",
                  @"9:00 AM",
                  nil];
   
    
    eventStore = [[EKEventStore alloc] init];
    
    
    selectedCal.text = @"Default";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return eventTitle.count;
}


// Setup custom table cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomTableCell *newCell = [eventTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (newCell == nil)
    {
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[CustomTableCell class]])
            {
                newCell = (CustomTableCell*)view;
                newCell.titleLabel.text = (NSString*)[eventTitle objectAtIndex:indexPath.row];
                newCell.dateLabel.text = (NSString*)[eventDate objectAtIndex:indexPath.row];
            }
        }
    }    
    return newCell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Pull the related information for the selected location
    NSString *selectedTitle = [eventTitle objectAtIndex:[indexPath row]];
    NSString *selectedLocation = [eventLocation objectAtIndex:[indexPath row]];
    NSString *selectedDate = [eventDate objectAtIndex:[indexPath row]];
    NSString *selectedTime = [eventTime objectAtIndex:[indexPath row]];
    
    //this is the output for the detail view
    NSString *displayInfo = [[NSString alloc] initWithFormat: @"Title: %@\nLocation: %@ \nDate: %@ \nTime: %@", selectedTitle, selectedLocation, selectedDate, selectedTime];
    NSLog(@"%@", displayInfo);
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup location information for display
    detailView.selectedLocationText = displayInfo;
    detailView.selectedTitle = selectedTitle;
    detailView.selectedLocation = selectedLocation;
    detailView.selectedDate = selectedDate;
    detailView.selectedTime = selectedTime;
    detailView.defaultCalendar = selectedCal.text;

    
    // Pull up my detail view
    [self presentViewController:myDetailView animated:YES completion:nil];
}


/*
 A button titled "Default Calendar". When pressed, present the user with a list of available calendars on their device. Allow the user to select one and save this option. All calendar events created should be added to this calendar. This button MUST be on your main view of your application not on the event view.
*/

-(IBAction)onClick:(id)sender
{
    CalViewController *calViewController = [[CalViewController alloc] initWithNibName:@"CalViewController" bundle:nil];
    if (calViewController != nil)
    {
        
        calViewController.handlerCal = ^(NSString *text)
        {
            // sets label on default view to selected calendar
            // pulled from the CalViewController via the handler
            selectedCal.text = text;
            NSLog(@"ID from Cal %@", selectedCal.text);
        
        };
        [self presentViewController:calViewController animated:true completion:nil];
    }
    
}


- (void)saveEvent:(NSArray *)array
{

    // ADD NEW EVENTS
    
    EKEvent *newEvent = [EKEvent eventWithEventStore:[self eventStore]];
    if (newEvent != nil)
    {
        newEvent.title = [array objectAtIndex:0];
        newEvent.location = [array objectAtIndex:1];
 
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM d, yyyy"];
        NSString *dateText = [array objectAtIndex:2];
        NSDate *notifyDate = [dateFormatter dateFromString:dateText];

        
        //newEvent.startDate = [[NSDate alloc] init];
        newEvent.startDate = notifyDate;
        newEvent.endDate = [[NSDate alloc] initWithTimeInterval:7200 sinceDate:newEvent.startDate];
        
        NSMutableArray *eventAlarms = [[NSMutableArray alloc] initWithCapacity:2];
        if (eventAlarms != nil)
        {
            EKAlarm *firstAlert = [EKAlarm alarmWithRelativeOffset:-3600];
            EKAlarm *secondAlert = [EKAlarm alarmWithRelativeOffset:0];
            
            [eventAlarms addObject:firstAlert];
            [eventAlarms addObject:secondAlert];
            
            newEvent.alarms = eventAlarms;
        }
        
        NSLog(@"ID %@", [array objectAtIndex:4]);
        NSLog(@"my saved array: %@", array);
        
        // set calendar as default calendar
        //newEvent.calendar = [eventStore calendarWithIdentifier:selectedCal.text];
        newEvent.calendar = [eventStore calendarWithIdentifier:(NSString*)[array objectAtIndex:4]];
        //newEvent.calendar = [eventStore defaultCalendarForNewEvents];
        
        NSError *error;
        
        // Save my event to my calendar
        [eventStore saveEvent:newEvent span:EKSpanThisEvent error:&error];
        

        if (![eventStore saveEvent:newEvent span:EKSpanThisEvent error:&error])
        {
            // code for event not saved
            NSLog(@"Error: %@", error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Event was not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            if (alertView != nil)
            {
                [alertView show];
            }
       }
        else
        {
            // code for event saved
            //NSLog(@"SAVE SUCCESSFULL");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"Event  successfully saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            if (alertView != nil)
            {
                [alertView show];
            }
       }

    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
