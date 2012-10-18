//
//  ViewController.m
//  weekFour
//
//  Created by Lucy Hutcheson on 10/16/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController



-(void)onSave:(NSString*)myEvent
{
    
    // If this is my first event, delete my default text
    if (counter == 0)
    {
        eventDisplay.text = @"";
        eventDisplay.text = [eventDisplay.text stringByAppendingString:myEvent];
    }
    // If this is the second or more event, add it to my first or existing events
    else
    {
        eventDisplay.text = [eventDisplay.text stringByAppendingString:myEvent];
    }
    counter ++;
}



- (void)viewWillAppear:(BOOL)animated
{   
    rightSwiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(onSwipe:)];
    rightSwiper.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRightLabel addGestureRecognizer:rightSwiper];
    
    [super viewWillAppear:animated];
}



/*------------------------------------------------------------------------------------------ *
 When the swipe right gesture happens, pop up the add event view.
 *------------------------------------------------------------------------------------------ */

- (void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddView" bundle:nil];
    if (addView != nil)
    {
        addView.delegate = self;
        [self presentViewController:addView animated:YES completion:nil];
    }
}



/*------------------------------------------------------------------------------------------ *
    When the user clicks the save button, use NSUserDefaults to save the text in the textview.
 *------------------------------------------------------------------------------------------ */

-(IBAction)onSaveView:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *eventsText = eventDisplay.text;
        [defaults setObject:eventsText forKey:@"events"];
        [defaults synchronize];
        NSLog(@"Saving text view.");
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



/*------------------------------------------------------------------------------------------ *
    When the application loads, use NSUserDefaults to load in any previously saved text and 
    drop it into the textview.
 *------------------------------------------------------------------------------------------ */

- (void)viewDidAppear:(BOOL)animated
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(defaults != nil)
    {
        NSString *eventsText = eventDisplay.text;
        [defaults setObject:eventsText forKey:@"events"];
        NSLog(@"Loading saved text.");
    }
    
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
