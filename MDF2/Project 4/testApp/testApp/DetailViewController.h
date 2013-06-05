//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/25/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MovieViewController.h"


@interface DetailViewController : UIViewController 
{
    // setup
    NSString *selectedTitle;
    NSString *selectedTimes;
    NSString *selectedImage;
    NSString *selectedTrailer;
    IBOutlet UILabel *movieTitle;
    IBOutlet UILabel *movieShowtimes;
    IBOutlet UIImageView *movieImage;
    MPMoviePlayerController *moviePlayer;
    MovieViewController *movieView;

}

@property (nonatomic, strong) NSString *selectedTitle;
@property (nonatomic, strong) NSString *selectedTimes;
@property (nonatomic, strong) NSString *selectedImage;
@property (nonatomic, strong) NSString *selectedTrailer;
@property (nonatomic, retain) MovieViewController *movieView;


- (IBAction)onClick:(id)sender;

@end
