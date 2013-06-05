//
//  AlbumViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/21/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

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
    self.title= @"Album";

    label.text = @"";
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        // tell it what type of image source
        
        // Lets you pick the album
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        // setup delegate to capture
        pickerController.delegate = self;
        
        // tell pickercontroller whether to allow editting
        pickerController.allowsEditing = false;
        
        [self presentModalViewController:pickerController animated:true];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
    
}


// user selected an image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   // NSLog(@"%@", [info description]);
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil)
    {
        photoImageView.image = selectedImage;
        label.text = @"Selected Image:";
    }
    
    [picker dismissModalViewControllerAnimated:true];
}



//user selected cancel
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    label.text = @"No image selected.";
    [picker dismissModalViewControllerAnimated:true];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
