//
//  CustomCellController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellController : UITableViewCell
{
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UIImageView *icon;
}

@property (nonatomic, strong) UILabel *tweetLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIImageView *icon;

@end
