//
//  MovieViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/28/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet UILabel *movieLabel;
    NSString *videoPath;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *cancelButton;
}

@property (nonatomic, strong) NSString *videoPath;

-(IBAction)onClick:(id)sender;


@end
