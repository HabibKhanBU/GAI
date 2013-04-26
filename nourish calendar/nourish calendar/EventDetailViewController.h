//
//  EventDetailViewController.h
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EventObject;
@class EventDetailViewController;

@protocol eventDetailViewDelegate <NSObject>
-(void)eventDetailViewDismissed:(EventDetailViewController*)evenDetailView;

-(void)eventDetailViewDismissedWithAddedObject:(EventDetailViewController*)evenDetailView;
@end

@interface EventDetailViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (nonatomic,weak)EventObject * event;
@property (weak, nonatomic) IBOutlet UITextField *startDateText;
@property (weak, nonatomic) IBOutlet UITextField *endDateText;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,assign)BOOL isNewEvent;
@property (nonatomic,weak)id<eventDetailViewDelegate> delegate;
-(void)updateDisplay;


@end
