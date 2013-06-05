//
//  xmlItem.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/15/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "xmlItem.h"

@implementation xmlItem

-(id)initWithName:(NSString*)itemName itemDesc:(NSString*)itemDesc itemImage:(NSString*)itemImage shortDesc:(NSString*)itemShortDesc
{
    if ((self = [super init]))
    {
        name = itemName;
        desc = itemDesc;
        image = itemImage;
        shortDesc = itemShortDesc;
    }
    return self;
}

@end
