//
//  CameraViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/21/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{
    IBOutlet UIImageView *photoImageView;
    IBOutlet UIImageView *scaledImageView;
    IBOutlet UILabel *photoLabel;
    IBOutlet UILabel *scaledLabel;
    UIImage *scaledImage;
    UIImage *selectedImage;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *cancelButton;
}

@property (nonatomic, strong) UIImage *scaledImage;
@property (nonatomic, strong) UIImage *selectedImage;

-(IBAction)onClick:(id)sender;

@end
