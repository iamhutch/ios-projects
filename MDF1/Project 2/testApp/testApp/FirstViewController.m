//
//  FirstViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "FirstViewController.h"
#import "MoreViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

/*------------------------------------------------------------------------------------------ *
    The child of navigation controller can contain any UI you wish but must have an 
    option to push another view onto the navigationController stack.
 *------------------------------------------------------------------------------------------ */

-(IBAction)onMore:(id)sender
{
    MoreViewController *moreView = [[MoreViewController alloc] initWithNibName:@"MoreView" bundle:nil];
    if (moreView != nil)
    {
        [self.navigationController pushViewController:moreView animated:true];
    }
}
							
- (void)viewDidLoad
{
    // Add background image and set tint color
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
