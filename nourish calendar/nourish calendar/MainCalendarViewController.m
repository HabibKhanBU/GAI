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
#import "EventDetailViewController.h"

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
    ubb.title = @"Save";
    self.navigationItem.rightBarButtonItem = ubb;
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


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self.tableView reloadData];
}
-(IBAction)save:(id)sender
{
    [[Storage defaultStore]saveStore];
}
@end
