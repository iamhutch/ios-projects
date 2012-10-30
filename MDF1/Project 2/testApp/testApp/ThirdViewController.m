//
//  ThirdViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Services", @"Services");
        self.tabBarItem.image = [UIImage imageNamed:@"third"];
    }
    return self;
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    // Set default display to the Websites services
    textView.text = [[NSString alloc] initWithFormat: @"One Page Websites\nMultiple Page Websites\nE-Commerce Websites\nContent Management Systems"];
    
    [super viewDidAppear:animated];
}

/*------------------------------------------------------------------------------------------ *
    One tab can be free form UI.
 *------------------------------------------------------------------------------------------ */

-(IBAction)onChange:(id)sender
{
    UISegmentedControl *segControl = (UISegmentedControl*)sender;
    if(segmentControl != nil)
    {
        int selectedIndex = segControl.selectedSegmentIndex;
        if (selectedIndex == 0)
        {
            textView.text = [[NSString alloc] initWithFormat: @"One Page Websites\nMultiple Page Websites\nE-Commerce Websites\nContent Management Systems"];
        }
        else if (selectedIndex == 1)
        {
            textView.text = [[NSString alloc] initWithFormat: @"Flyers\nPostcards\nBrochures\nBanners\nInvitations"];
        }
        else if (selectedIndex == 2)
        {
            textView.text = [[NSString alloc] initWithFormat: @"Custom Logos\nBusiness Cards\nLetterheads\nEnvelopes"];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
