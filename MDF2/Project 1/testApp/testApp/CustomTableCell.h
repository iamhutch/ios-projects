//
//  CustomTableCell.h
//  testApp
//
//  Created by Lucy Hutcheson on 1/10/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    // setup labels
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *dateLabel;
}

@property (strong, nonatomic)IBOutlet UILabel *titleLabel;
@property (strong, nonatomic)IBOutlet UILabel *dateLabel;

@end
