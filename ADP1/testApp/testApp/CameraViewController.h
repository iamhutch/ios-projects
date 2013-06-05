//
//  CameraViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/28/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraViewController;
@protocol CameraViewControllerDelegate <NSObject>
-(void)sendImageToController:(CameraViewController *)controller didFinishEnteringItem:(UIImage*)image;

@end

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
    __weak id<CameraViewControllerDelegate> delegate;
    NSMutableArray  *imageArray;
}

@property (nonatomic, strong) UIImage *scaledImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, weak) id<CameraViewControllerDelegate> delegate;

-(IBAction)onClick:(id)sender;


@end
