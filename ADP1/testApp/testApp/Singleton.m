//
//  Singleton.m
//  testApp
//
//  Created by Lucy Hutcheson on 5/16/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import "Singleton.h"


@implementation Singleton


static Singleton *_instance = nil;

@synthesize data, save;

+(void)CreateInstance
{
    if (_instance == nil)
    {
        [[self alloc] init];
    }
}

+(Singleton*)GetInstance
{
    return _instance;
}

+(id)alloc
{
    _instance = [super alloc];
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        // init code
    }
    return self;
}


-(NSMutableDictionary*)returnDictionary
{
    if (data != nil)
    {
        return data;
    }
    return nil;

}




@end
