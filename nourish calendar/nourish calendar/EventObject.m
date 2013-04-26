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

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.startTime = [aDecoder decodeObjectForKey:@"startTime"];
        self.endTime = [aDecoder decodeObjectForKey:@"endTime"];
        self.description = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.startTime forKey:@"startTime"];
    [aCoder encodeObject:self.endTime forKey:@"endTime"];
    [aCoder encodeObject:self.description forKey:@"description"];
}

@end
