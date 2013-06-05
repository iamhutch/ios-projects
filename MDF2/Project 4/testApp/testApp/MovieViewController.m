//
//  MovieViewController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/27/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController
@synthesize selectedTrailer, selectedTitle;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated ];
	// Do any additional setup after loading the view, typically from a nib.
    self.title= @"Trailer";
}


- (IBAction)onPlay:(id)sender
{
    NSURL *fileURL = [NSURL URLWithString:[self selectedTrailer]];
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    if (moviePlayer != nil)
    {
        // add movie to the current view
        [movieView addSubview:moviePlayer.view];
        
        // set movieplayer to same size as movie view
        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieView.frame.size.width, movieView.frame.size.height);
        
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        
        [moviePlayer play];
    }
}

- (IBAction)onStop:(id)sender
{
    [moviePlayer stop];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
