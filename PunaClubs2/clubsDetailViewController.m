//
//  clubsDetailViewController.m
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import "clubsDetailViewController.h"

@interface clubsDetailViewController ()
{
    NSMutableDictionary *_objects;
}
@end

@implementation clubsDetailViewController
@synthesize membersLabel = _membersLabel;
@synthesize contactLabel = _contactLabel;
@synthesize nameLabel = _nameLabel;
@synthesize meetLabel = _meetLabel;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize favoriteToggle = _favoriteToggle;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_objects != newDetailItem) {
        _objects = newDetailItem;
    }
}

- (void)viewDidLoad
{
    //DETAIL VIEW LABELS LOAD FROM PLIST
    self.navigationItem.title = @"Club Details";
    [super viewDidLoad];
    _nameLabel.text =  [_objects objectForKey:@"Name"];
    _contactLabel.text = [_objects objectForKey:@"Contact"]; //contact is a textview to hold email
    _membersLabel.text = [_objects objectForKey:@"Members"];
    _meetLabel.text = [_objects objectForKey:@"Meet"];
    _descriptionLabel.text = [_objects objectForKey:@"Description"];
    //LABEL ADJUST SIZE DEPENDING ON LENGTH OF SENTENCE
    _nameLabel.font = [UIFont boldSystemFontOfSize:31];   //Club name in large font, max 31 or smaller if cant fit
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _contactLabel.font = [UIFont systemFontOfSize:17];  //Contact label (email) max font 17 or smaller
    _meetLabel.font = [UIFont systemFontOfSize:17];      //same for meet label
    _meetLabel.adjustsFontSizeToFitWidth = YES;

    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];
    
    for (NSDictionary *dict in prefsArray)
    {
        if ([[dict objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])
        {
            if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"])
            {
                (self.favoriteToggle.selectedSegmentIndex = 1);
            }
            else
            {
                (self.favoriteToggle.selectedSegmentIndex = 0);
            }
        }
    }

    [super viewDidLoad];
}

- (IBAction)favoriteToggleChanged:(id)sender
{
    // From Nathan - NEW code for saving/loading
    
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);      //return array of paths
     NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];  //link to prefrences
     NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];  //
     NSLog(@"%@",outputFilePath);                   // NSLogs: /Users/jfeeley13/Library/Application Support/iPhone Simulator/6.0/Applications/69507008-0B2F-4C75-8521-5328E69602F4/Library/Preferences/Clubs.plist

    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];      //array of everything in plist?
    //NSLog(@"PREFSARRAY%@",prefsArray);
    
    if(self.favoriteToggle.selectedSegmentIndex = 1)    //when you click to Yes
    {
        for (NSDictionary *dict in prefsArray)
        {
            if ([[dict objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])
            {
                if ([[dict objectForKey:@"Favorites"] isEqualToString:@"0"])
                {
                    [dict setValue:(@"1") forKey:@"Favorites"]; //HERE SOMEHOW CHANGE PLIST FAV VALUE TO 1
                    NSLog(@"DICT=%@",dict);
                }
                else
                {
                    [dict setValue:(@"0") forKey:@"Favorites"]; //HERE SOMEHOW CHANGE PLIST FAV VALUE TO 1
                    NSLog(@"DICT2=%@",dict);

                }
            }
        }
    }
    if(self.favoriteToggle.selectedSegmentIndex = 0)    //when you click to Yes
    {
               
    }

        [prefsArray writeToFile:outputFilePath atomically:YES];

    /*NSUSERDEFAULTS
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *clubName = [_nameLabel text];             //Saves Club Name in defaults
    
    if(self.favoriteToggle.selectedSegmentIndex = 1)    //when you click to Yes
    {
        [defaults setObject:clubName forKey:@"Name"];   //log the club name
        [[NSUserDefaults standardUserDefaults] setValue:NO forKey:@"Favorites"];
        [_objects setValue:(@"1") forKey:@"Favorites"]; //HERE SOMEHOW CHANGE PLIST FAV VALUE TO 1
    }
    NSLog(@"%@",clubName);
     */
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
