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
    IBOutlet UILabel *swipeLabel;
    
    UISwipeGestureRecognizer *rightSwiper;

}

-(IBAction)onSaveView:(id)sender;

@end
