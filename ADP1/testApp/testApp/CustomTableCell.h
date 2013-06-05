//
//  CustomTableCell.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/11/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    IBOutlet UIView *topView;
    IBOutlet UIView *bottomView;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *dateLabel;
}

@property (strong, nonatomic)IBOutlet UILabel *titleLabel;
@property (strong, nonatomic)IBOutlet UILabel *dateLabel;
@property (strong, nonatomic)IBOutlet UIView *bottomView;
@property (strong, nonatomic)IBOutlet UIView *topView;

- (IBAction)handleSwipe:(UIGestureRecognizer*)recognizer;


@end
