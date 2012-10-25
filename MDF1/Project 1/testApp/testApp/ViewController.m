//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/23/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize detailView;

- (void)viewDidLoad
{
    // set table view default to false
    [myTableView setEditing:false];

    
    
/*------------------------------------------------------------------------------------------ *
    At least twenty items must be in the list initially.
 *------------------------------------------------------------------------------------------ */
    
    stringNames = [[NSMutableArray alloc] initWithObjects:
                   @"Sleep School Hawaii",
                   @"Salon Elements",
                   @"Guam Sleep Center",
                   @"Sleep Center Hawaii",
                   @"Rapha Massage Therapy",
                   @"Christ the Rock Church",
                   @"Jese's Mobile A/C",
                   @"Motiva Training and Consulting",
                   @"Connecting Penpals",
                   @"Rehabilitation Consulting & Staffing Solutions",
                   @"Inafa' Maolek Mediation Center",
                   @"American Supplies and Technical Services",
                   @"Pacific Tyre",
                   @"Austin Grove Baptist Church",
                   @"Ignite Student Ministry",
                   @"George Automotive",
                   @"Ki, LLC",
                   @"Shea Bear Learning Center",
                   @"Pacific Wine and Spirits",
                   @"Shaping Destiny",
                  nil];

    stringLocation = [[NSMutableArray alloc] initWithObjects:
                   @"Pearl City, Hawaii",
                   @"Harker Heights, Texas",
                   @"Tamuning, Guam",
                   @"Pearl City, Hawaii",
                   @"Killeen, Texas",
                   @"Lampasas, Texas",
                   @"Harker Heights, Texas",
                   @"Tamuning, Guam",
                   @"Austin, Texas",
                   @"Harker Heights, Texas",
                   @"Hagatna, Guam",
                   @"Tamuning, Guam",
                   @"Tamuning, Guam",
                   @"Marshville, North Carolina",
                   @"Texas",
                   @"Killeen, Texas",
                   @"Fort Hood, Texas",
                   @"Dededo, Guam",
                   @"Tamuning, Guam",
                   @"Austin, Texas",
                   nil];

    stringWebsites = [[NSMutableArray alloc] initWithObjects:
                      @"www.sleepschoolhawaii.com",
                      @"www.salon-elements.com",
                      @"www.guamsleepcenter.com",
                      @"www.sleepcenterhawaii.com",
                      @"www.theraphamassage.com",
                      @"www.ctrcconnect.org",
                      @"www.jesesmobileac.com",
                      @"www.motivatraining.com",
                      @"www.connectingpenpals.com",
                      @"www.rcsstexas.com",
                      @"www.inafamaolek.org",
                      @"www.americansuppliestech.com",
                      @"www.pacifictyre.com",
                      @"n/a",
                      @"n/a",
                      @"www.georgeautomotive.com",
                      @"www.kicompany.com",
                      @"n/a",
                      @"n/a",
                      @"www.shapingdestiny.org",
                      nil];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*------------------------------------------------------------------------------------------ *
    A UITableView displaying a list of items. 
 *------------------------------------------------------------------------------------------ */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return stringNames.count;
}



/*------------------------------------------------------------------------------------------ *
    A custom UITableView Cell that contains at least one UIImageView and two strings.
 *------------------------------------------------------------------------------------------ */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableCell *newCell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (newCell == nil)
    {
        //newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[CustomTableCell class]])
            {
                newCell = (CustomTableCell*)view;
                newCell.textLabel.text = (NSString*)[stringNames objectAtIndex:indexPath.row];
                newCell.locationLabel.text = (NSString*)[stringLocation objectAtIndex:indexPath.row];
           }
        }
    }
    
    return newCell;
}



/*------------------------------------------------------------------------------------------ *
    The edit button changes the UITableView to edit mode and 
    shows the minus button for deletion.
 *------------------------------------------------------------------------------------------ */

- (IBAction)onEdit:(id)sender
{
    if (myTableView.editing == false)
    {
        [myTableView setEditing: true];
        
        // Set button to done to indicate to user to press to get out of edit mode
        [editButton setTitle:@"Done" forState:UIControlStateNormal];
    }
    else
    {
        [myTableView setEditing: false];
        
        // Set button back to edit for user to see 
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set up editing style to delete
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSLog(@"delete row %d", indexPath.row);
        
    // remove All related objects from our data array so they don't show up in details
    [stringNames removeObjectAtIndex:indexPath.row];
    [stringLocation removeObjectAtIndex:indexPath.row];
    [stringWebsites removeObjectAtIndex:indexPath.row];
    
    [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];

}



/*------------------------------------------------------------------------------------------ *
    When clicking on an item in the list, move to a second view 
    with more information about this item.
 *------------------------------------------------------------------------------------------ */

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Pull the related information for the selected client
    NSString *selectedClient = [stringNames objectAtIndex:[indexPath row]];
    NSString *selectedLocation = [stringLocation objectAtIndex:[indexPath row]];
    NSString *selectedWebsites = [stringWebsites objectAtIndex:[indexPath row]];
   
    //this is the output for the detail view
    NSString *displayClient = [[NSString alloc] initWithFormat: @"%@ \nLocation: %@ \nWebsite: %@", selectedClient, selectedLocation, selectedWebsites];
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup client information for display
    detailView.clientSelected = displayClient;
    
    // Pull up my detail view
    [self presentViewController:myDetailView animated:YES completion:nil];
    

}



@end
