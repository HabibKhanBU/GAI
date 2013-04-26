//
//  DatePickerViewController.m
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import "DatePickerViewController.h"
#import "EventObject.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate * date = (self.ind)?self.eo.endTime:self.eo.startTime;
    [self.datePicker setDate:date animated:YES];
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM dd, yyyy HH:mm"];
    self.dateLabel.text = [df stringFromDate:date];
    switch(self.ind)
    {
    case 0: self.navigationItem.title = @"Start Time";break;
    case 1: self.navigationItem.title = @"End Time";break;
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    switch(self.ind)
    {
        case 0: self.eo.startTime = self.datePicker.date;break;
        case 1: self.eo.endTime = self.datePicker.date;break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
