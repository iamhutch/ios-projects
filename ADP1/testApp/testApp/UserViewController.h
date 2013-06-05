//
//  UserViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/30/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController
{
    IBOutlet UILabel *userName;
    IBOutlet UILabel *userDescription;
    IBOutlet UILabel *userFollowers;
    IBOutlet UILabel *userFriends;
    IBOutlet UIImageView *userIconView;
    NSString *selectedName;
    NSString *selectedDescription;
    NSString *selectedFollowers;
    NSString *selectedFriends;
    NSDictionary *userFeed;
	UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, strong) NSString *selectedName;
@property (nonatomic, strong) NSString *selectedDescription;
@property (nonatomic, strong) NSString *selectedFollowers;
@property (nonatomic, strong) NSString *selectedFriends;
@property (nonatomic, strong) NSDictionary *userFeed;

-(IBAction)onBack:(id)sender;


@end
