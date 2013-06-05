//
//  ListViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AddViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize detailView, addButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Disciples", @"Disciples");
    }
    return self;
}

- (void)viewDidLoad
{
    // Green Navigation Bar
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:103.0/255.0 green:158.0/255.0 blue:8.0/255.0 alpha:1.0];
    
    // Edit Button
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Edit", @"") style:UIBarButtonItemStyleBordered  target:self action:@selector(goEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;

    // Round out custom buttons
    CALayer *addBtnLayer = [self.addButton layer];
    [addBtnLayer setMasksToBounds:YES];
    [addBtnLayer setCornerRadius:10.0f];
    
    // set table view default to false
    [myTableView setEditing:false];
   

    firstName = [[NSMutableArray alloc] initWithObjects:
                   @"Sheldon",
                   @"Leonard",
                   @"Raj",
                   @"Howard",
                   nil];

    
    lastName = [[NSMutableArray alloc] initWithObjects:
                 @" Cooper",
                 @" Hofstadter",
                 @" Koothrappali",
                 @" Wolowitz",
                 nil];
    
    email = [[NSMutableArray alloc] initWithObjects:
                 @"sheldon@cooper.com",
                 @"leonard@hofstadter",
                 @"raj@koothrappali",
                 @"howard@wolowitz",
                 nil];
    
    phone = [[NSMutableArray alloc] initWithObjects:
                 @"123-456-7890",
                 @"456-789-0123",
                 @"789-012-3456",
                 @"234-567-8901",
                 nil];

    photo = [[NSMutableArray alloc] initWithObjects:
             @"sheldon.jpg",
             @"leonard.jpg",
             @"raj.jpg",
             @"howard.jpg",
             nil];

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//-(void)onSave:(NSString*)myFirst last:(NSString*)myLast phone:(NSString*)myPhone email:(NSString*)myEmail
-(void)onSave:(NSString*)myFirst
{
    NSLog(@"hello %@", myFirst);
}


- (void)goEdit:(id)sender
{
    if (myTableView.editing == false)
    {
        [myTableView setEditing: true];
        
        // Set button to done to indicate to user to press to get out of edit mode
        self.navigationItem.rightBarButtonItem.title = @"Done";

    }
    else
    {
        [myTableView setEditing: false];
        
        // Set button back to edit for user to see
        self.navigationItem.rightBarButtonItem.title = @"Edit";
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
    [firstName removeObjectAtIndex:indexPath.row];
    [lastName removeObjectAtIndex:indexPath.row];
    [email removeObjectAtIndex:indexPath.row];
    [phone removeObjectAtIndex:indexPath.row];
    [photo removeObjectAtIndex:indexPath.row];
    
    
    [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    
}




- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Pull the related information for the selected disciple
    NSString *selectedFirst = [firstName objectAtIndex:[indexPath row]];
    NSString *selectedLast = [lastName objectAtIndex:[indexPath row]];
    NSString *selectedEmail = [email objectAtIndex:[indexPath row]];
    NSString *selectedPhone = [phone objectAtIndex:[indexPath row]];
    NSString *selectedPhoto = [photo objectAtIndex:[indexPath row]];
    
    //this is the output for the detail view
    //NSString *displayDisciple = [[NSString alloc] initWithFormat: @"First Name: \n%@ \n\nLast Name: \n%@ \n\nEmail: \n%@\n\n Phone: \n%@", selectedFirst, selectedLast, selectedEmail, selectedPhone];
    
    // Setup detail view
    DetailViewController *myDetailView = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
    self.detailView = myDetailView;
    
    // Setup disciple information for display
    detailView.firstSelected = selectedFirst;
    detailView.lastSelected = selectedLast;
    detailView.emailSelected = selectedEmail;
    detailView.phoneSelected = selectedPhone;
    
    detailView.myImage = [UIImage imageNamed:selectedPhoto];
    
    // Pull up my detail view
    [self.navigationController pushViewController:myDetailView animated:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return firstName.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // setup table cells
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //cell.textLabel.text = (NSString*)[firstName objectAtIndex:indexPath.row];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@ %@", [firstName objectAtIndex:indexPath.row], [lastName objectAtIndex:indexPath.row]];
    return cell;
}



-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button != nil)
    {
        AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddView" bundle:nil];
        if (addView != nil)
        {
            [self.navigationController pushViewController:addView animated:true];
        }
        
    }
}



    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
