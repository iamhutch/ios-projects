//
//  CustomTableCell.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "CustomTableCell.h"
#import "EditViewController.h"

@interface CustomTableCell()
@end


@implementation CustomTableCell
@synthesize titleLabel, dateLabel, bottomView, topView;

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



- (IBAction)handleSwipe:(UISwipeGestureRecognizer*)recognizer
{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [UIView animateWithDuration:0.25f animations:^
         {
             if (topView != nil)
             {
                 // move the topview back to the right
                 topView.frame = CGRectMake(0.0f, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
             }
         }];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [UIView animateWithDuration:0.25f animations:^
         {
             if (topView != nil)
             {
                 // move the topview to the left
                 topView.frame = CGRectMake(-150.0f, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
             }
         }];
    }
}



@end
