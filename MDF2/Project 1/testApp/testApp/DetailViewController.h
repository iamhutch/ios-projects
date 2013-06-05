//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 1/10/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>


@interface DetailViewController : UIViewController <UIAlertViewDelegate>
{
    // setup
    IBOutlet UITextView *eventDisplay;
    NSString *selectedLocationText;
    NSString *selectedTitle;
    NSString *selectedLocation;
    NSString *selectedDate;
    NSString *selectedTime;
    NSString *defaultCalendar;
    NSMutableArray *eventToSave;
}

@property (nonatomic, retain) IBOutlet UITextView *eventDisplay;
@property (nonatomic, retain) NSString *selectedLocationText;
@property (nonatomic, retain) NSString *selectedTitle;
@property (nonatomic, retain) NSString *selectedLocation;
@property (nonatomic, retain) NSString *selectedDate;
@property (nonatomic, retain) NSString *selectedTime;
@property (nonatomic, retain) NSString *defaultCalendar;
@property (nonatomic, retain) NSMutableArray *eventToSave;


-(IBAction)onBack:(id)sender;
-(IBAction)onAdd:(id)sender;
-(id)initWithTextSelected:(NSString*)text;

@end