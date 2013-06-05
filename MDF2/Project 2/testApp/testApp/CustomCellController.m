//
//  CustomCellController.m
//  testApp
//
//  Created by Lucy Hutcheson on 3/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "CustomCellController.h"

@implementation CustomCellController
@synthesize dateLabel, tweetLabel, icon;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
