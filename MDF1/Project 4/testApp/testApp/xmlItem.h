//
//  xmlItem.h
//  testApp
//
//  Created by Lucy Hutcheson on 11/15/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xmlItem : NSObject
{
    NSString *name;
    NSString *desc;
    NSString *image;
    NSString *shortDesc;

}
-(id)initWithName:(NSString*)itemName itemDesc:(NSString*)itemDesc itemImage:(NSString*)itemImage shortDesc:(NSString*)itemShortDesc;

@end
