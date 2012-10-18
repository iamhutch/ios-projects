//
//  AddViewController.h
//  weekFour
//
//  Created by Lucy Hutcheson on 10/16/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddViewDelegate <NSObject>

@required
-(void)onSave:(NSString*)eventInfo;
@end


@interface AddViewController : UIViewController <UITextViewDelegate>
{
    id<AddViewDelegate> delegate;
    IBOutlet UITextField *eventName;
    IBOutlet UIDatePicker *eventDate;
    NSString *myEvent;
    NSString *eventDateFormatted;
    
    // Add a UILabel at the top with the text "Swipe Left to Close"
    IBOutlet UILabel *swipeLeftLabel;
    
    // Add a UISwipeGestureRecognizer to the UILabel and attach an event handler.
    UISwipeGestureRecognizer *leftSwiper;
}

@property (strong) id<AddViewDelegate> delegate;

-(IBAction)closeKeyboard:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)onSwipe:(UISwipeGestureRecognizer*)recognizer;

@end

