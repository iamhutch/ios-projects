//
//  DetailViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 12/10/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
}
@property (nonatomic, retain) IBOutlet UITextField *firstDisplay;
@property (nonatomic, retain) IBOutlet UITextField *lastDisplay;
@property (nonatomic, retain) IBOutlet UITextField *emailDisplay;
@property (nonatomic, retain) IBOutlet UITextField *phoneDisplay;
@property (nonatomic, retain) NSString *firstSelected;
@property (nonatomic, retain) NSString *lastSelected;
@property (nonatomic, retain) NSString *emailSelected;
@property (nonatomic, retain) NSString *phoneSelected;

@property (nonatomic, strong) IBOutlet UIButton *editButton;
@property (nonatomic, strong) IBOutlet UIImageView *discipleImageView;
@property (nonatomic, strong) UIImage *myImage;

//- (id)initWithImage:(UIImage *)image text:(NSString *)text;
- (id)initWithTextSelected:(NSString *)first last:(NSString*)last email:(NSString*)email phone:(NSString*)phone photo:(NSString *)photo;

-(IBAction)onClick:(id)sender;


@end
