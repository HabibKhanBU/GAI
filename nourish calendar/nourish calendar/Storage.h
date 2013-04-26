//
//  Storage.h
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EventObject;
@interface Storage : NSObject
+(Storage *) defaultStore;
@property (nonatomic)NSMutableArray* events;
-(void)saveStore;
-(void) addEvent:(EventObject*)obj;
-(void) removeObjectAtIndex:(int)index;
-(void)removeObject:(EventObject*)obj;
@end
