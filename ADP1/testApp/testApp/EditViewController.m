//
//  EditViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/13/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "EditViewController.h"
#import "FirstViewController.h"


@implementation EditViewController

@synthesize  editDataDictionary, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    if (editDataDictionary != nil)
    {
        // Setup fields with data to be editted
        reminderTitle.text = (NSString*)[editDataDictionary objectForKey:@"Title"];
        reminderDate.date = [editDataDictionary objectForKey:@"Date"];
        reminderNotes.text = (NSString*)[editDataDictionary objectForKey:@"Notes"];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)closeKeyboard:(id)sender
{
    // Close keyboard
    [reminderTitle resignFirstResponder];
    [reminderNotes resignFirstResponder];
}


- (void)viewWillAppear:(BOOL)animated
{
    // Setup save button on nav
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveReminder)];
    self.navigationItem.rightBarButtonItem = save;
    
    [super viewWillAppear:animated];
}

-(void)saveReminder
{
    selectedTitle = reminderTitle.text;
    selectedNotes = reminderNotes.text;
    selectedDate = reminderDate.date;
    [editDataDictionary setValue:selectedTitle forKey:@"Title"];
    [editDataDictionary setValue:selectedNotes forKey:@"Notes"];
    [editDataDictionary setValue:selectedDate forKey:@"Date"];
    
    [self.delegate addItemViewController:self didFinishEnteringItem:editDataDictionary];
    [self dismissViewControllerAnimated:TRUE completion:nil];
 
}

-(void)goHome
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
