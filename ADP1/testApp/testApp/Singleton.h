//
//  Singleton.h
//  testApp
//
//  Created by Lucy Hutcheson on 5/16/13.
//  Copyright (c) 2013 Lucy Hutcheson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
    NSMutableDictionary *data;
    NSString *save;
}
@property (nonatomic, retain) NSMutableDictionary *data;
@property (nonatomic, retain) NSString *save;


+(void)CreateInstance;

+(Singleton*)GetInstance;

-(NSMutableDictionary*)returnDictionary;



@end
