//
//  ViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}
@property(nonatomic, strong) IBOutlet UIButton *addButton;
@property(nonatomic, strong) IBOutlet UIButton *viewButton;

-(IBAction)onClick:(id)sender;
@end
