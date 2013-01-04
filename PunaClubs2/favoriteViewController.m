//
//  favoriteViewController.m
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import "favoriteViewController.h"
#import "clubsFirstViewController.h"
#import "clubsDetailViewController.h"

@interface favoriteViewController ()
{
    NSMutableArray *_objects;
    NSMutableArray *favoritesArray;
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
 //  NSString *thePath = [[NSBundle mainBundle] pathForResource:@"Clubs"ofType:@"plist"]; //thePath fills with plist info
    [super viewDidLoad];

    //Loading:
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];

    favoritesArray = [[NSMutableArray alloc]init];
   
     for (NSDictionary *dict in prefsArray)
     {
     NSLog(@"Favorites: %@",[dict objectForKey:@"Favorites"]);
     if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
     [favoritesArray addObject:dict];
     NSLog(@"DICT= %@", dict);                              //NSLogs each club + info
     }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.textLabel.text = [[favoritesArray objectAtIndex:indexPath.row]objectForKey:@"Name"];   //name only clubs that are yes
    
    for (NSDictionary *dict in _objects)
    {
        if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
        {
            cell.textLabel.text = [[favoritesArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
        }
      //  NSLog(@"DICT2= %@", dict);
    }
    return cell;
}



#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController  setDetailItem:[favoritesArray objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
    
}



@end
