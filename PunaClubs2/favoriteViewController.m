//
//  favoriteViewController.m
//  PunaClubs2
//
//  Created by Jordan Feeley on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import "favoriteViewController.h"
#import "clubsFirstViewController.h"
#import "clubsDetailViewController.h"

@interface favoriteViewController ()
{
    NSMutableArray *favoritesArray; //empty array that adds/deletes favorite clubs
}
@end

@implementation favoriteViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title = @"Favorite Clubs";        // Title of screen is Favorite Clubs
    [super viewDidLoad];                                  //view favorites screen

    //Loading code fom Nathan:
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES); //make connections
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"]; //connect to prefrences file (on computer)
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"]; //put the plist in prefrences file
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath]; //read inside of plist
    
    favoritesArray = [[NSMutableArray alloc]init]; //Initialize favorites array to add to
   
     for (NSDictionary *dict in prefsArray)  //dict= a dictionary of each indivisual club in plist
     {
     if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])   //if a club is marked "1" ie: pressed favorite
         [favoritesArray addObject:dict];  //add only clubs marked favorite to new array
         NSLog(@"Name: %@",[dict objectForKey:@"Name"]);  //NSLOG: name of all clubs 
         NSLog(@"Favorites: %@",[dict objectForKey:@"Favorites"]); //NSLog: favorites key 0 or 1, can see it change
     }
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];   //pull down to refresh fav array
    [refreshControl addTarget:nil action:@selector(updateArray) forControlEvents:UIControlEventValueChanged]; //pull down and go to update array
    self.refreshControl = refreshControl;
}

-(void)updateArray
{
    //Load code from Nathan (see above) if you pull down, the dict will check all the 1s again and add or delete clubs in tableview
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath]; //NSLOG NULL
    favoritesArray = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dict in prefsArray)
    {
        if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
            [favoritesArray addObject:dict];
    }
    [self performSelector:@selector(updateTable)withObject:nil afterDelay:1.0];
}

-(void)updateTable  //reload data and end after updating
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return favoritesArray.count;  //fill with clubs just Favorite "1" (yes)
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favClubNames" forIndexPath:indexPath]; 
    cell.textLabel.text = [[favoritesArray objectAtIndex:indexPath.row]objectForKey:@"Name"];   //name only clubs that are in fav array(=yes)
    return cell;
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController  setDetailItem:[favoritesArray objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
    
}



@end
