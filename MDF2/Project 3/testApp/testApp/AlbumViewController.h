//
//  AlbumViewController.h
//  testApp
//
//  Created by Lucy Hutcheson on 3/21/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{
    IBOutlet UIImageView *photoImageView;
    IBOutlet UILabel *label;
}


@end
