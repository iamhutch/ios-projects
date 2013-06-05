//
//  MovieListingCell.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/25/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieListingCell : UITableViewCell
{
    // setup labels
    IBOutlet UILabel *movieLabel;
    IBOutlet UILabel *showtimeLabel;
    IBOutlet UIImageView *movieImageView;
}

@property (strong, nonatomic)IBOutlet UILabel *showtimeLabel;
@property (strong, nonatomic)IBOutlet UILabel *movieLabel;
@property (strong, nonatomic)IBOutlet UIImageView *movieImageView;


@end
