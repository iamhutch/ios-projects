//
//  SecondViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "Singleton.h"
#import "CameraViewController.h"
#import "MovieViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize myReminderData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Add New", @"Add New");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
-(void)sendImageToController:(CameraViewController *)controller didFinishEnteringItem:(UIImage*)image
{
    imageView.image = image;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];

    // Setup cancel button on nav
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(goHome)];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = cancel;
    
    // Setup save button on nav
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveReminder)];
    self.navigationItem.rightBarButtonItem = save;
    

    [super viewWillAppear:animated];
}


- (void)viewDidLoad
{
    // Pre-populate date picker with today's date
    reminderDate.minimumDate = [NSDate date];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)closeKeyboard:(id)sender
{
    // Close keyboard
    [reminderTitle resignFirstResponder];
    [reminderNotes resignFirstResponder];
}

-(void)goHome
{
    
    [self.parentViewController.tabBarController setSelectedIndex:0];
}

-(void)saveReminder
{
    // If the reminder title is empty, throw up an alert
    if ([reminderTitle.text isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Did you forget to put in your reminder? :)" delegate:nil cancelButtonTitle:@"Add One Now" otherButtonTitles:nil];
        if (alertView != nil)
        {
            [alertView show];
        }
    }
    // If the reminder title is filled in, move on to save
    else
    {        
        // Send my events to the onSave function
        [Singleton CreateInstance];
        Singleton *instance = [Singleton GetInstance];
        instance.data = [NSMutableDictionary dictionaryWithObjects:[NSArray arrayWithObjects: reminderTitle.text, reminderDate.date, reminderNotes.text,  nil] forKeys:[NSArray arrayWithObjects:@"Title", @"Date", @"Notes", nil]];
        instance.save = @"Save";
        reminderTitle.text = @"";
        reminderNotes.text = @"";

    
        // Close out the Add View
        [self.parentViewController.tabBarController setSelectedIndex:0];
    }
}

- (IBAction)onClick:(id)sender
{
    if ([sender tag] == 0)
    {
        // camera
        CameraViewController *cameraView = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
        cameraView.delegate = self;
        if (cameraView != nil)
        {
            [[self navigationController] pushViewController:cameraView animated:TRUE];
        }
    }
    else if ([sender tag] == 1)
    {
        // video
        MovieViewController *movieView = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:nil];
        if (movieView != nil)
        {
            [self.navigationController pushViewController:movieView animated:TRUE];
        }
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
