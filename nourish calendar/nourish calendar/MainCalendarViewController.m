//
//  MainCalendarViewController.m
//  nourish calendar
//
//  Created by Borucki, Davis, Marchant on 4/25/13.
//  Copyright (c) 2013 Borucki, Davis, Marchant. All rights reserved.
//

#import "MainCalendarViewController.h"
#import "Storage.h"
#import "EventObject.h"

@interface MainCalendarViewController ()

@end

@implementation MainCalendarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Upcoming Ventures";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem * ubb = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];

    UIBarButtonItem * ubbs = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    self.navigationItem.leftBarButtonItem = ubb;
    self.navigationItem.rightBarButtonItem= ubbs;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma TableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Storage defaultStore].events.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    EventObject * eo = [[Storage defaultStore].events objectAtIndex:[indexPath row]];
    cell.textLabel.text = eo.name;
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM dd, yyyy HH:mm"];
    cell.detailTextLabel.text = [df stringFromDate:eo.startTime];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailViewController * edvc = [[EventDetailViewController alloc]init];
    EventObject * eo = [[Storage defaultStore].events objectAtIndex:[indexPath row]];
    edvc.event = eo;
    [self.navigationController pushViewController:edvc animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[Storage defaultStore]removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor darkGrayColor]];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self.tableView reloadData];
}
-(IBAction)save:(id)sender
{
    [[Storage defaultStore]saveStore];
}

-(IBAction)edit:(id)sender
{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
        
    }else{
        [self.tableView setEditing:YES animated:YES];
        self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    }
}

-(IBAction)add:(id)sender
{
    EventObject * newObject = [[EventObject alloc]init];
    newObject.startTime = [[NSDate alloc]init];
    newObject.endTime = [[NSDate alloc]initWithTimeIntervalSinceNow:3600];
    [[Storage defaultStore]addEvent:newObject];
    EventDetailViewController * edvc = [[EventDetailViewController alloc]init];
    edvc.event = newObject;
    edvc.isNewEvent = YES;
    edvc.delegate= self;
    UINavigationController * nvc = [[UINavigationController alloc]initWithRootViewController:edvc];
    nvc.navigationBar.tintColor= [UIColor darkGrayColor];
    [self presentViewController:nvc animated:YES completion:nil];
}
-(void)eventDetailViewDismissed:(EventDetailViewController *)evenDetailView
{
    [self edit:nil];
}
-(void)eventDetailViewDismissedWithAddedObject:(EventDetailViewController *)evenDetailView
{
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    [self edit:nil];
}
@end
