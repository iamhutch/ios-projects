//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/15/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UITextView *textDisplay;
    NSString *textSelected;
}
@property (nonatomic, retain) IBOutlet UITextView *textDisplay;
@property (nonatomic, retain) NSString *textSelected;

-(IBAction)onBack:(id)sender;
-(id)initWithTextSelected:(NSString*)text;

@end
