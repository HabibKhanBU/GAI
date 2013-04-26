//
//  EventObject.h
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Storage.h"

@interface EventObject : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSDate * startTime;
@property (nonatomic) NSDate * endTime;
@property (nonatomic) NSString * description;

-(id) initWithName:(NSString*)name startTime:(NSDate*)st endTime:(NSDate*) et description:(NSString*) d;


@end
