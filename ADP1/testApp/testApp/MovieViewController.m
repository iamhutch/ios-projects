//
//  MovieViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/28/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "MovieViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface MovieViewController ()

@end

@implementation MovieViewController

@synthesize videoPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        // select camera as source type
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //setup delegate to self
        pickerController.delegate = self;
        
        // set to no editting
        pickerController.allowsEditing = false;
        
        // setup quality
        pickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
        pickerController.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeMovie, nil];
        [self presentModalViewController:pickerController animated:true];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //NSLog(@"%@", [info description]);
    NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
    if (urlString != nil)
    {
        videoPath = [urlString path];
        //NSLog(@"%@", videoPath);
    }
    
    [picker dismissViewControllerAnimated:true completion:nil];
    movieLabel.text = @"Video successfully captured.";
    
}

// Save or Cancel Buttons
- (IBAction)onClick:(id)sender
{
    if ([sender tag] == 0)
    {
        // save
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Save this video?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        if (alert != nil)
        {
            [alert show];
        }
    }
    else if ([sender tag] == 1)
    {
        // cancel
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel" message:@"Video not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
        
        // Close out the  View
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

// Alert buttons clicked
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
    {
        // Cancel
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancelled" message:@"Video not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    else
    {
        // OK
        [self saveVideo];
    }
}

// save my video
- (void)saveVideo
{
    // trigger the save
    UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}

// triggered after save happens
- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        // there was an error
        //NSLog(@"Error saving file.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"An error occured. Video was not saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (alert != nil)
        {
            [alert show];
        }
    }
    else
    {
        // save successfull
        //NSLog(@"Save is complete.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"Video successfully saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
    
    movieLabel.text = @"No video captured.";
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
