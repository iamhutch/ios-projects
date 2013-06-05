//
//  ThirdViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "ThirdViewController.h"
#import "SettingsTwitterCell.h"
#import <Accounts/Accounts.h>
#import "UserViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"third"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];

}

- (void)viewDidLoad
{
    // Load up default font size
    defaults = [NSUserDefaults standardUserDefaults];
    if(defaults != nil)
    {
        if ([defaults objectForKey:@"defaultFontSize"])
        {
            myFontSize = [defaults objectForKey:@"defaultFontSize"];
        } else {
            myFontSize = @"12";
        }
        if ([defaults objectForKey:@"defaultLocationChoice"])
        {
            myLocationChoice = [defaults objectForKey:@"defaultLocationChoice"];
        }
    }
    [settingsTableView reloadRowsAtIndexPaths:[settingsTableView indexPathsForVisibleRows] withRowAnimation:UITableViewRowAnimationNone];


    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)editButtonPressed:(id)sender
{
    UserViewController *userView = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
    if (userView != nil)
    {
        [self presentModalViewController:userView animated:true];
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Font Size";
    }
    else if (section == 1)
    {
        return @"Twitter Account";
    }
    else if (section == 2)
    {
        return @"Use Location";
    }
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *CellIdentifier = @"fontSizeCell";
        
        fontCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (fontCell == nil) {
            fontCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
            
            fontCell.textLabel.text = @"Font Size";
            fontCell.detailTextLabel.text = myFontSize;
                                    
            fontSlider = [[UISlider alloc] initWithFrame:CGRectMake(120.0, 10.0, 150.0, 10.0)];
            [fontSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
            [fontSlider setBackgroundColor:[UIColor clearColor]];
            fontSlider.minimumValue = 8.0;
            fontSlider.maximumValue = 16.0;
            fontSlider.continuous = YES;
            fontSlider.value = (int)myFontSize;
            [fontCell.contentView addSubview:fontSlider];
       }
        
        return fontCell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *CellIdentifier = @"twitterCell";
        
        twitterCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (twitterCell == nil) {
            twitterCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            twitterCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            ACAccountStore *accountStore = [[ACAccountStore alloc] init];
            if (accountStore != nil)
            {
                ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
                if (accountType != nil)
                {
                    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
                     {
                         if (granted)
                         {
                             NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                             if (twitterAccounts != nil)
                             {
                                 // Need to cast current information to an actual object in order to use it
                                 ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                                 if (currentAccount != nil)
                                 {
                                     currentUserName = currentAccount.username;
                                     twitterCell.textLabel.text = currentUserName;
                                     [settingsTableView reloadData];
                                }
                             }
                         }
                         else
                         {
                             NSLog(@"User did not grant access.");
                         }
                     }];
                }
                
            }

            UIButton *editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [editButton setFrame:CGRectMake(201.0, 8.0, 100.0, 30.0)];
            [editButton setTitle:@"View User" forState:UIControlStateNormal];
            [editButton addTarget:self action:@selector(editButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [twitterCell addSubview:editButton];

            
        }
        
        return twitterCell;
        
    }
    else if (indexPath.section == 2)
    {
        static NSString *CellIdentifier = @"locationCell";
        
        locationCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (locationCell == nil) {
            locationCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            locationCell.textLabel.text = @"For Weather";
            
            onOffSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(210.0, 8.0, 75.0, 50.0)];
            [onOffSwitch addTarget:self action:@selector(onOffSwitch:) forControlEvents:UIControlEventValueChanged];
            if ([myLocationChoice isEqual: @"YES"])
            {
                onOffSwitch.on = YES;
            }
            else if ([myLocationChoice isEqualToString:@"NO"])
            {
                onOffSwitch.on = NO;
            }
            [locationCell.contentView addSubview:onOffSwitch];
        }
        
        return locationCell;
    }
    return nil;
}


-(void)sliderAction:(id)sender
{
    // Update slider and text field with user selection
    int output = (int)fontSlider.value;
    sliderValue = 2 * floor((output/2)+0.5);
    [fontSlider setValue:sliderValue animated:YES];
    myFontSize = [NSString stringWithFormat:@"%d",sliderValue];
    fontCell.detailTextLabel.text = myFontSize;
    
}

-(void)onOffSwitch:(id)sender{
    
    if(onOffSwitch.on)
    {
        myLocationChoice = @"YES";
    }
    else
    {
        myLocationChoice = @"NO";
    }
    
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setAllowsSelection:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    // Save the selections
    if (defaults != nil)
    {
        // Save Font Size Slider
        if (sliderValue > 0)
        {
            // Setup string and default and sync
            myFontSize = [NSString stringWithFormat:@"%d",sliderValue];
        }
        else
        {
            myFontSize = sizeLabel.text;
        }
        
        [defaults setObject:myFontSize forKey:@"defaultFontSize"];
        [defaults setObject:myLocationChoice forKey:@"defaultLocationChoice"];
       
        [defaults synchronize];
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
