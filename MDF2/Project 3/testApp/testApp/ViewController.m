//
//  ViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/19/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "ViewController.h"
#import "CameraViewController.h"
#import "MovieViewController.h"
#import "AlbumViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.title= @"Media App";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.569 green:0.075 blue:0.337 alpha:1] /*#911356*/
;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onClick:(id)sender
{
    if ([sender tag] == 0)
    {
        // camera
        CameraViewController *cameraView = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
        if (cameraView != nil)
        {
            [self.navigationController pushViewController:cameraView animated:true];
        }
    }
    else if ([sender tag] == 1)
    {
        // video
        MovieViewController *movieView = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:nil];
        if (movieView != nil)
        {
            [self.navigationController pushViewController:movieView animated:true];
        }
    }
    else if ([sender tag] == 2)
    {
        // albums
        AlbumViewController *albumView = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];
        if (albumView != nil)
        {
            [self.navigationController pushViewController:albumView animated:true];
        }
        
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
