//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UITextView *tweetText;
    IBOutlet UILabel *tweetDate;
    IBOutlet UILabel *tweetUser;
    IBOutlet UIImageView *tweetIcon;
    NSString *selectedTweet;
    NSString *selectedDate;
    NSString *selectedUser;
}

@property (nonatomic, strong) NSString *selectedTweet;
@property (nonatomic, strong) NSString *selectedDate;
@property (nonatomic, strong) NSString *selectedUser;

-(IBAction)onBack:(id)sender;




@end
