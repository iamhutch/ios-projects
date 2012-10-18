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





/*------------------------------------------------------------------------------------------ *
 When the Add Event view closes, the newly created event text will be added to the UITextView.
 *------------------------------------------------------------------------------------------ */

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
    [swipeLabel addGestureRecognizer:rightSwiper];
    
    [super viewWillAppear:animated];
}

- (void)onSwipe:(UISwipeGestureRecognizer*)recognizer
{
    AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddView" bundle:nil];
    if (addView != nil)
    {
        addView.delegate = self;
        [self presentViewController:addView animated:YES completion:nil];
    }
}


-(IBAction)onSaveView:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults != nil)
    {
        NSString *eventsText = eventDisplay.text;
        
        [defaults setObject:eventsText forKey:@"events"];
        
        [defaults synchronize];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(defaults != nil)
    {
        NSString *eventsText = eventDisplay.text;
        
        [defaults setObject:eventsText forKey:@"events"];
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
