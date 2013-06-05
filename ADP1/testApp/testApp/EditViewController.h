//
//  EditViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/13/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditViewController;

@protocol EditViewControllerDelegate <NSObject>
- (void)addItemViewController:(EditViewController *)controller didFinishEnteringItem:(NSMutableDictionary *)item;
@end

@interface EditViewController : UIViewController
{
    NSString *selectedTitle;
    NSString *selectedNotes;
    NSDate *selectedDate;
    IBOutlet UITextField *reminderTitle;
    IBOutlet UITextView *reminderNotes;
    IBOutlet UIDatePicker *reminderDate;
    NSMutableDictionary *editDataDictionary;
    __weak id<EditViewControllerDelegate> delegate;
    
}

@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableDictionary *editDataDictionary;

-(IBAction)closeKeyboard:(id)sender;

@end

