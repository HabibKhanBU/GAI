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
        
        NSArray * documentDirectories =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * documentDirectory = [documentDirectories objectAtIndex:0];
        NSString * directory = [documentDirectory stringByAppendingPathComponent:@"calenderStore"];
        BOOL fileExists;
        fileExists = [[NSFileManager defaultManager] fileExistsAtPath:directory];
        if(fileExists)
        {
            self.events = [NSKeyedUnarchiver unarchiveObjectWithFile:directory];
        }else {
            NSLog(@"File Doesn't Exist, %@",directory);
            self.events = [[NSMutableArray alloc]init];
            NSDate * ds = [[NSDate alloc]initWithTimeIntervalSinceNow:0];
            NSDate * de = [[NSDate alloc]initWithTimeIntervalSinceNow:3600];
            EventObject * e1=[[EventObject alloc]initWithName:@"Poker Night Fundraiser" startTime:ds endTime:de description:@"COME!"];
            EventObject * e2=[[EventObject alloc]initWithName:@"Hunger Lunch Tour" startTime:ds endTime:de description:@""];
            EventObject * e3=[[EventObject alloc]initWithName:@"Movie Night" startTime:ds endTime:de description:@""];
            EventObject * e4=[[EventObject alloc]initWithName:@"Event A" startTime:ds endTime:de description:@""];
            EventObject * e5=[[EventObject alloc]initWithName:@"Event B" startTime:ds endTime:de description:@""];
            EventObject * e6=[[EventObject alloc]initWithName:@"Event C" startTime:ds endTime:de description:@""];
            EventObject * e7=[[EventObject alloc]initWithName:@"Event D" startTime:ds endTime:de description:@""];
            EventObject * e8=[[EventObject alloc]initWithName:@"Event E" startTime:ds endTime:de description:@""];
            EventObject * e9=[[EventObject alloc]initWithName:@"Event F" startTime:ds endTime:de description:@""];
            EventObject * e10=[[EventObject alloc]initWithName:@"Event G" startTime:ds endTime:de description:@""];
            [self.events addObject:e1];
            [self.events addObject:e2];
            [self.events addObject:e3];
            [self.events addObject:e4];
            [self.events addObject:e5];
            [self.events addObject:e6];
            [self.events addObject:e7];
            [self.events addObject:e8];
            [self.events addObject:e9];
            [self.events addObject:e10];
        }
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

-(void)saveStore
{
    NSLog(@"Saving");
    NSArray * documentDirectories =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [documentDirectories objectAtIndex:0];
    NSString * directory = [documentDirectory stringByAppendingPathComponent:@"calenderStore"];
    BOOL fileExists;
    NSLog(@"%@",directory);
    fileExists = [[NSFileManager defaultManager] fileExistsAtPath:directory];
    [NSKeyedArchiver archiveRootObject:self.events toFile:directory];
}

-(void)addEvent:(EventObject *)obj
{
    [self.events insertObject:obj atIndex:0];
}

-(void)removeObjectAtIndex:(int)index
{
    [self.events removeObjectAtIndex:index];
}
-(void)removeObject:(EventObject*)obj
{
    [self.events removeObject:obj];
}
@end
