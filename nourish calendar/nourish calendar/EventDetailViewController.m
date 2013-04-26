//
//  EventDetailViewController.m
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import "EventDetailViewController.h"
#import "EventObject.h"
#import "DatePickerViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pageTapped:)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self updateDisplay];
}

-(void)updateDisplay
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM dd, yyyy HH:mm"];
    [self.startDateText setText: [df stringFromDate:self.event.startTime]];
    [self.endDateText setText:[df stringFromDate:self.event.endTime]];
    [self.nameText setText: self.event.name];
    [self.descriptionText setText:self.event.description];
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    DatePickerViewController * dpc;
    if(textField == self.startDateText)
    {
        
        dpc = [[DatePickerViewController alloc]init];
        dpc.eo = self.event;
        dpc.ind =0;
        [[self navigationController]pushViewController:dpc animated:YES];
        dpc.label.text = @"Current Start Time:";
        return NO;
    }
    else if (textField == self.endDateText)
    {
        dpc = [[DatePickerViewController alloc]init];
        dpc.eo = self.event;
        dpc.ind =1;
        [[self navigationController]pushViewController:dpc animated:YES];
        dpc.label.text = @"Current End Time:";
        return NO;
    }else
    {
       [self keyboardWillShow]; 
    }
    return YES;
}

-(IBAction)pageTapped:(id)sender
{
    [self.view endEditing:YES];
     [self keyboardWillHide];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self keyboardWillHide];
    [self.view endEditing:YES];
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self keyboardWillHide];
    [self.view endEditing:YES];
    return YES;
}

-(void)keyboardWillHide
{
    [self.scrollView setFrame:CGRectMake(self.scrollView.frame.origin.x,self.scrollView.frame.origin.y,self.scrollView.frame.size.width,self.view.frame.size.height)];
}

-(void)keyboardWillShow
{    
    [self.scrollView setFrame:CGRectMake(self.scrollView.frame.origin.x,self.scrollView.frame.origin.y,self.scrollView.frame.size.width,self.view.frame.size.height-216)];
}

-(void)updateData
{
    self.event.name = self.nameText.text;
    self.event.description = self.descriptionText.text;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [self updateData];
}

@end
