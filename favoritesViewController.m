//
//  favoritesViewController.m
//  iJoinClubs
//
//  Created by JFeeley13 on 11/19/12.
//  Copyright (c) 2012 JFEELEY13. All rights reserved.
//

#import "favoritesViewController.h"
#import "clubMasterViewController.h"
#import "clubDetailViewController.h"

@interface favoritesViewController ()
{
    NSMutableArray *_objects;
    NSMutableArray *favoritesArray;
}
@end

@implementation favoritesViewController

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
    //NSString *thePath = [[NSBundle mainBundle] pathForResource:@"Property List"ofType:@"plist"]; //thePath fills with plist info

//CODE FROM NATHAN Loading:
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];
    
    [super viewDidLoad];

    
    _objects = [[NSMutableArray alloc]initWithContentsOfFile:outputFilePath];  //object mutable array takes plist contents
    favoritesArray = [[NSMutableArray alloc]init];
    /*
    for (NSDictionary *dict in _objects)
    {
        NSLog(@"Favorites: %@",[dict objectForKey:@"Favorites"]);
        if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
            //[favoritesArray insertObject:dict atIndex:1];     //FavArray fills with just clubs thare are "1" ADD DICT?
            [favoritesArray addObject:dict];
        NSLog(@"DICT= %@", dict);       //NSLogs each club + info
    }
     */
    
    for (int i = 0; i < 16; i++)
    {
        NSDictionary *dict = [_objects objectAtIndex:i];
        if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
            [favoritesArray addObject:dict];
    }
    NSLog(@"FAV= %@", favoritesArray);  //NSlog null???
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
   // if ([_objects objectForKey: @"Favorites"] == 1)

   // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];


    for (NSDictionary *dict in _objects)
        {
            if ((int)[dict objectForKey:@"Favorites"] == 1)
            {
                cell.textLabel.text = [[favoritesArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
            }
            NSLog(@"DICT2= %@", dict);
        }
    return cell;
}
 /*

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favClubNames" forIndexPath:indexPath];
    
    cell.textLabel.text = [[favoritesArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
    NSLog(@"FAV2= %@", favoritesArray);

    return cell;
}
*/


#pragma mark - Table view delegate
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
     clubDetailViewController *detailViewController = [[clubDetailViewController alloc] initWithNibName:@"clubDetailViewController2" bundle:nil];
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController  setDetailItem:[favoritesArray objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
    
}



@end
