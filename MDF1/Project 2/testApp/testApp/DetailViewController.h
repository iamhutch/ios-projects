//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UITextView *clientDisplay;
    NSString *clientSelected;
}
@property (nonatomic, retain) IBOutlet UITextView *clientDisplay;
@property (nonatomic, retain) NSString *clientSelected;

-(IBAction)onBack:(id)sender;
-(id)initWithTextSelected:(NSString*)text;

@end
