//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/23/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    stringArray = [[NSMutableArray alloc] initWithObjects:@"hello", @"goodbye", @"one", @"two", @"dog", @"cat", @"mouse", @"computer", @"calculator", @"book", nil];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onEdit:(id)sender
{
    [myTableView setEditing:TRUE];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return stringArray.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"delete row %d", indexPath.row);
        
        // removes object from our data array
        [stringArray removeObjectAtIndex:indexPath.row];
        
        [myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        NSLog(@"add");
        
        [stringArray insertObject:@"testing" atIndex:indexPath.row];
        [myTableView insertRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:true];
        
    }
}


// Create Table Cells ================================

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomTableCell *cell = [myTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:nil options:nil];
        
        for (UIView *view in views)
        {
            if([view isKindOfClass:[CustomTableCell class]])
            {
                cell = (CustomTableCell*)view;
                cell.textLabel.text = (NSString*)[stringArray objectAtIndex:indexPath.row];
            }
        }
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row = %d, name = %@", indexPath.row, [stringArray objectAtIndex:indexPath.row]);
}



@end
