//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AddViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize addButton,viewButton;


- (void)viewDidLoad
{

    
    // Round out custom buttons
    NSArray *buttons = [NSArray arrayWithObjects: self.addButton, self.viewButton,nil];
    
    for(UIButton *btn in buttons)
    {
        CALayer *addBtnLayer = [btn layer];
        [addBtnLayer setMasksToBounds:YES];
        [addBtnLayer setCornerRadius:10.0f];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [super viewDidAppear:true];
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
        if (button.tag == 0)
        {
            ListViewController *listView = [[ListViewController alloc] initWithNibName:@"ListView" bundle:nil];
            if (listView != nil)
            {
                [self.navigationController pushViewController:listView animated:true];
            }
        }
        else if (button.tag == 1)
        {
            AddViewController *addView = [[AddViewController alloc] initWithNibName:@"AddView" bundle:nil];
            if (addView != nil)
            {
                [self.navigationController pushViewController:addView animated:true];
            }
         
        }
    }
}


@end
