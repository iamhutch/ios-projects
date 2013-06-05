//
//  SettingsTwitterCell.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/27/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "SettingsTwitterCell.h"

@implementation SettingsTwitterCell
@synthesize selectedAccount;

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
