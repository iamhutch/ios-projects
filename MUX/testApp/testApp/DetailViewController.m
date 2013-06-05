//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"
#import "ListViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize firstSelected, lastSelected, emailSelected, phoneSelected, firstDisplay, lastDisplay, emailDisplay, phoneDisplay, editButton, discipleImageView, myImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Details", @"Details");
    }
    return self;
}

// Display data from selected client from SecondView
- (id)initWithTextSelected:(NSString *)first last:(NSString*)last email:(NSString*)email phone:(NSString*)phone photo:(NSString *)photo
{
    
    [firstDisplay setText:first];
    [lastDisplay setText:last];
    [emailDisplay setText:email];
    [phoneDisplay setText:phone];
    
    self.myImage = [UIImage imageNamed:photo];
    [discipleImageView setImage:[self myImage]];
     
    return self;
}


- (void)viewDidLoad
{
    
    // Round out custom buttons
    CALayer *editBtnLayer = [self.editButton layer];
    [editBtnLayer setMasksToBounds:YES];
    [editBtnLayer setCornerRadius:10.0f];
    
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Home", @"") style:UIBarButtonItemStyleBordered  target:self action:@selector(goHome:)];
    self.navigationItem.rightBarButtonItem = homeButton;

    [firstDisplay setText:[self firstSelected]];
    [lastDisplay setText:[self lastSelected]];
    [emailDisplay setText:[self emailSelected]];
    [phoneDisplay setText:[self phoneSelected]];
    [discipleImageView setImage:[self myImage]];

    firstDisplay.borderStyle = UITextBorderStyleNone;
    lastDisplay.borderStyle = UITextBorderStyleNone;
    emailDisplay.borderStyle = UITextBorderStyleNone;
    phoneDisplay.borderStyle = UITextBorderStyleNone;

    [firstDisplay setEnabled:NO];
    [lastDisplay setEnabled:NO];
    [emailDisplay setEnabled:NO];
    [phoneDisplay setEnabled:NO];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)goHome:(id) sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
