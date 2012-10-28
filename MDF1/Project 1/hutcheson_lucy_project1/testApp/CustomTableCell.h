//
//  CustomTableCell.h
//  testApp
//
//  Created by Lucy Hutcheson on 10/23/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    // setup labels
    IBOutlet UILabel *textLabel;
    IBOutlet UILabel *locationLabel;
}

@property (strong, nonatomic)IBOutlet UILabel *textLabel;
@property (strong, nonatomic)IBOutlet UILabel *locationLabel;

@end
