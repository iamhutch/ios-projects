//
//  ThirdViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    IBOutlet UITableView *settingsTableView;
	UIActivityIndicatorView *activityIndicator;
    UITableViewCell *fontCell;
    UITableViewCell *twitterCell;
    UITableViewCell *locationCell;
    
    NSString *myFontSize;
    NSString *myTwitter;
    NSString *myLocationChoice;
    NSString *currentUserName;
    
    IBOutlet UISlider *fontSlider;
    UILabel *sizeLabel;
    UILabel *fontLabel;
    int sliderValue;
    NSUserDefaults *defaults;
    IBOutlet UISwitch *onOffSwitch;

}



@end
