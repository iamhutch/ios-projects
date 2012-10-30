//
//  SecondViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize detailView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Clients", @"Clients");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // Setup data arrays for tableview
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return stringNames.count;
}



/*------------------------------------------------------------------------------------------ *
    One tab must use a UITableViewController and contain selectable data. 
 *------------------------------------------------------------------------------------------ */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // setup table cells
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = (NSString*)[stringNames objectAtIndex:indexPath.row];

    return cell;
}



/*------------------------------------------------------------------------------------------ *
    This selectable data MUST then present a detail UIView displaying most information about this item.
 *------------------------------------------------------------------------------------------ */

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Pull the related information for the selected client
    NSString *selectedClient = [stringNames objectAtIndex:[indexPath row]];
    NSString *selectedLocation = [stringLocation objectAtIndex:[indexPath row]];
    NSString *selectedWebsites = [stringWebsites objectAtIndex:[indexPath row]];
    
    //this is the output for the detail view
    NSString *displayClient = [[NSString alloc] initWithFormat: @"Client: \n%@ \n\nLocation: \n%@ \n\nWebsite: \n%@", selectedClient, selectedLocation, selectedWebsites];
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup client information for display
    detailView.clientSelected = displayClient;
    
    // Pull up my detail view
    [self presentViewController:myDetailView animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
