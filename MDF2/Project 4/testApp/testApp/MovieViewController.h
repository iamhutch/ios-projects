//
//  MovieViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/27/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
    IBOutlet UIView *movieView;
    IBOutlet UILabel *movieTitle;
    NSString *selectedTrailer;
    NSString *selectedTitle;
}
@property (nonatomic, strong) NSString *selectedTrailer;
@property (nonatomic, strong) NSString *selectedTitle;

- (IBAction)onPlay:(id)sender;
- (IBAction)onStop:(id)sender;
@end
