//
//  ThirdViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 10/28/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    IBOutlet UITextView *textView;
    IBOutlet UISegmentedControl *segmentControl;
}

-(IBAction)onChange:(id)sender;


@end
