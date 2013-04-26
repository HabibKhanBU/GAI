//
//  DatePickerViewController.h
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EventObject;

@interface DatePickerViewController : UIViewController <UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak,nonatomic)EventObject * eo;
@property (nonatomic,assign)int ind;
@end
