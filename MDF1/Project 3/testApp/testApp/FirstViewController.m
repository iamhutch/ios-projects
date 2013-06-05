//
//  FirstViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/7/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize detailView;
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locations", @"Locations");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // set table view default to false
    [myTableView setEditing:false];

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
                      nil];
    
    stringLatitude = [[NSMutableArray alloc] initWithObjects:
                      @"21.388352",
                      @"31.075469",
                      @"13.510645",
                      @"21.388352",
                      @"31.127764",
                      @"31.064846",
                      @"31.083510",
                      @"13.476263",
                      @"30.267153",
                      @"31.082399",
                      nil];
    
    stringLongitude = [[NSMutableArray alloc] initWithObjects:
                      @"-157.953836",
                      @"-97.653306",
                      @"144.813237",
                      @"-157.953836",
                      @"-97.734482",
                      @"-98.152801",
                      @"-97.659738",
                      @"144.799584",
                      @"-97.743061",
                      @"-97.654709",
                      nil];
    

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



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
    [stringLocation removeObjectAtIndex:indexPath.row];
    [stringLatitude removeObjectAtIndex:indexPath.row];
    [stringLongitude removeObjectAtIndex:indexPath.row];
    
    [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Pull the related information for the selected location
    NSString *selectedLocation = [stringLocation objectAtIndex:[indexPath row]];
    NSString *selectedLatitude = [stringLatitude objectAtIndex:[indexPath row]];
    NSString *selectedLongitude = [stringLongitude objectAtIndex:[indexPath row]];
    
    //this is the output for the detail view
    NSString *displayInfo = [[NSString alloc] initWithFormat: @"Just a Hutch Designs \nLocation: %@ \nLatitude: %@ \nLongitude: %@", selectedLocation, selectedLatitude, selectedLongitude];
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup location information for display
    detailView.selectedLocationText = displayInfo;
    detailView.selectedLocation = selectedLocation;
    detailView.selectedLatitude = selectedLatitude;
    detailView.selectedLongitude = selectedLongitude;
    
    
    // Pull up my detail view
    [self presentViewController:myDetailView animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return stringLocation.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = (NSString*)[stringLocation objectAtIndex:indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
