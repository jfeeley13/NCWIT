//
//  clubsFirstViewController.m
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import "clubsFirstViewController.h"
#import "clubsDetailViewController.h"


@interface clubsFirstViewController ()
{
    NSMutableArray *_objects; //Array of clubject filled from plist
}
@end

@implementation clubsFirstViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Club List"; //name of first screen
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"Clubs"ofType:@"plist"]; //link to plist of clubs
    [super viewDidLoad];
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:thePath]; //array fills with clubs from plist
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
 
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of rows: %d", _objects.count);  //number of clubs = 68
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[_objects objectAtIndex:indexPath.row]objectForKey:@"Name"];   //tableview cells of each club name
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    [segue.destinationViewController  setDetailItem:[_objects objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
}


@end

