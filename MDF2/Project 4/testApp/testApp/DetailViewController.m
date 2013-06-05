//
//  DetailViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/25/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize selectedTitle, selectedTimes, selectedImage, selectedTrailer, movieView;

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
    [movieTitle setText:[self selectedTitle]];
    [movieShowtimes setText:[self selectedTimes]];
    
    NSURL *url = [NSURL URLWithString:[self selectedImage]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    movieImage.image = img;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated ];
	// Do any additional setup after loading the view, typically from a nib.
    self.title= @"Details";
}


- (IBAction)onClick:(id)sender
{
    // Setup detail view
    MovieViewController *myMovieView = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:[NSBundle mainBundle]];
    self.movieView = myMovieView;
    
    // Setup info for display
    movieView.selectedTrailer = [self selectedTrailer];
    movieView.selectedTitle = [self selectedTitle];
    
    // Pull up my detail view
    [self.navigationController pushViewController:myMovieView animated:true];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
