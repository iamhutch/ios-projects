//
//  MyAnnotationView.m
//  testApp
//
//  Created by Lucy Hutcheson on 11/8/12.
//  Copyright (c) 2012 Lucy Hutcheson. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]))
    {
        self.image = [UIImage imageNamed:@"Icon.png"];
    }
    return self;
}

@end