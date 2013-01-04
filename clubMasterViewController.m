//
//  clubMasterViewController.m
//  proposal
//
//  Created by JFeeley13 on 10/24/12.
//  Copyright (c) 2012 JFeeley13. All rights reserved.
//

#import "clubMasterViewController.h"
#import "clubDetailViewController.h"

@interface clubMasterViewController ()
{
    NSMutableArray *_objects;
}
@end

@implementation clubMasterViewController
@synthesize clubs=_objects;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Club List";
    NSString *thePath = [[NSBundle mainBundle] pathForResource:@"Property List"ofType:@"plist"];
    [super viewDidLoad];
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:thePath];
    
	//displayItems = [[NSMutableArray alloc] initWithArray:_objects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Number of rows: %d", _objects.count);
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = [[_objects objectAtIndex:indexPath.row]objectForKey:@"Name"];
    return cell;

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

        [segue.destinationViewController  setDetailItem:[_objects objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];

    }


@end
