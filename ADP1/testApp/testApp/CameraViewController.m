//
//  CameraViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/28/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController
@synthesize scaledImage, selectedImage, delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad
{
    self.title= @"Camera";
    photoLabel.text = @"";
    scaledLabel.text = @"";
    
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        // Setup image source
        
        // when button is pressed, camera will startup
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // setup delegate to capture
        pickerController.delegate = self;
        
        // tell pickercontroller whether to allow editting
        pickerController.allowsEditing = true;
        
        [self presentModalViewController:pickerController animated:true];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// Load images into Image View
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //NSLog(@"%@", [info description]);
    selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil)
    {
        photoImageView.image = selectedImage;
        photoLabel.text = @"Captured Image:";
    }
    
    scaledImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (scaledImage != nil)
    {
        scaledImageView.image = scaledImage;
        scaledLabel.text = @"Scaled Image:";
        
    }
    [picker dismissModalViewControllerAnimated:true];
}

// Save or Cancel Buttons
- (IBAction)onClick:(id)sender
{
    if ([sender tag] == 0)
    {
        // save
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Save this image?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        if (alert != nil)
        {
            [alert show];
        }
    }
    else if ([sender tag] == 1)
    {
        // cancel
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel" message:@"Images not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
        
        // Close out the  View
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

// Alert buttons clicked
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancelled" message:@"Images not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
    }
    else
    {
        //NSLog(@"OK clicked");
        [self saveImage];
    }
}



- (void)saveImage
{
    // save selected image to photo album automatically
    UIImageWriteToSavedPhotosAlbum(selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // save scaled image to photo album automatically
    UIImageWriteToSavedPhotosAlbum(scaledImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

    
    [self.delegate sendImageToController:self didFinishEnteringItem:scaledImage];
   
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        // an error happened while saving image
        NSLog(@"%@", [error description]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"An error occured. Image was not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
        
    }
    else
    {
        //NSLog(@"Save was successful.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"Image successfully saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
    }
}

//user selected cancel during image capture
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:TRUE completion:nil];
    
    photoLabel.text = @"No image captured.";
    saveButton.hidden = true;
    cancelButton.hidden = true;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
