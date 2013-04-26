//
//  Storage.m
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import "Storage.h"
#import "EventObject.h"

@implementation Storage
-(id)initStore
{
    self = [super init];
    if (self) {
        self.events = [[NSMutableArray alloc]init];
        NSDate * ds = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
        NSDate * de = [[NSDate alloc]initWithTimeIntervalSinceNow:3600];
        EventObject * e1=[[EventObject alloc]initWithName:@"Poker Night Fundraiser" startTime:ds endTime:de description:@"COME!"];
        EventObject * e2=[[EventObject alloc]initWithName:@"Destin foiejwiofjweio" startTime:ds endTime:de description:@"foewnfiew"];
        [self.events addObject:e1];
        [self.events addObject:e2];
    }
    return self;
}


+ (Storage *) defaultStore
{
    // Persistent instance.
    static Storage *_default = nil;
    
    // Small optimization to avoid wasting time after the
    // singleton being initialized.
    if (_default != nil)
    {
        return _default;
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
    // Allocates once with Grand Central Dispatch (GCD) routine.
    // It's thread safe.
    static dispatch_once_t safer;
    dispatch_once(&safer, ^(void)
                  {
                      _default = [[Storage alloc] initStore];
                  });
#else
    // Allocates once using the old approach, it's slower.
    // It's thread safe.
    @synchronized([MySingleton class])
    {
        // The synchronized instruction will make sure,
        // that only one thread will access this point at a time.
        if (_default == nil)
        {
            _default = [[TSMenuObjectStore alloc] initStore];
        }
    }
#endif
    return _default;
}

@end
