//
//  MainCalendarViewController.h
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventDetailViewController.h"
@interface MainCalendarViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,eventDetailViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
