//
//  MyMapAnnotation.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/8/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "MyMapAnnotation.h"

@implementation MyMapAnnotation
@synthesize title, coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord
{
    if ((self = [super init]))
    {
        title = text;
        coordinate = coord;
        
    }
    return self;
}

@end
