//
//  SecondViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "CameraViewController.h"

@interface SecondViewController : UIViewController <UIImagePickerControllerDelegate, CameraViewControllerDelegate>
{
    IBOutlet UITextField *reminderTitle;
    IBOutlet UITextView *reminderNotes;
    IBOutlet UIDatePicker *reminderDate;
    IBOutlet UIImageView *imageView;
}

@property (nonatomic, retain) NSDictionary *myReminderData;

-(IBAction)closeKeyboard:(id)sender;

- (IBAction)onClick:(id)sender;

@end
