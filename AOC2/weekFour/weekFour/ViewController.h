//
//  ViewController.h
//  weekFour
//
//  Created by Lucy Hutcheson on 10/16/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AddViewController.h"

@interface ViewController : UIViewController <AddViewDelegate>
{
    IBOutlet UITextView *eventDisplay;
    int counter;
    
    // Add a swipable label at the bottom of the view. Add the text, "Swipe Right to Add Event"
    IBOutlet UILabel *swipeRightLabel;
    
    // Attach a UISwipeGestureRecognizer to the UILabel
    UISwipeGestureRecognizer *rightSwiper;
}


/*------------------------------------------------------------------------------------------ *
 Add a save button to the header of the view. Attach an IBAction and click event.
 *------------------------------------------------------------------------------------------ */
-(IBAction)onSaveView:(id)sender;

-(void)onSave:(NSString*)myEvent;

- (void)onSwipe:(UISwipeGestureRecognizer*)recognizer;

@end
