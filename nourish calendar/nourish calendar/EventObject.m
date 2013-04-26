//
//  EventObject.m
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import "EventObject.h"

@implementation EventObject



-(id) initWithName:(NSString*)name startTime:(NSDate*)st endTime:(NSDate*) et description:(NSString*) d
{
    self = [super init];
    if (self) {
        self.name = name;
        self.startTime = st;
        self.endTime = et;
        self.description = d;
    }
    return self;
}

@end
