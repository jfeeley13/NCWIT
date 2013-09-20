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
    NSMutableDictionary *_objects; //dictionary of all clubs from plist
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
    _nameLabel.text =  [_objects objectForKey:@"Name"]; //name label connects from plist key "Name"
    _contactLabel.text = [_objects objectForKey:@"Contact"]; //contact is a textview to hold email, easy connection if eant to join a club
    _membersLabel.text = [_objects objectForKey:@"Members"]; //member label connects from plist key "Members" (some clubs are full or dont want new members so marked as Full)
    _meetLabel.text = [_objects objectForKey:@"Meet"]; //meet label connects from plist key "Meet" suppossed to be helpful but most clubs faild to email me back so those clubs just say "Not Scheduled" :( helpful for clubs that meet weekly
    _descriptionLabel.text = [_objects objectForKey:@"Description"]; //3-5 Lines of description of club either from club presidents I contacted or from club list I recieved from Ms. Killian
    
//LABEL ADJUST SIZE DEPENDING ON LENGTH OF SENTENCE
    _nameLabel.font = [UIFont boldSystemFontOfSize:31];   //Club name in large font, max 31 or smaller if cant fit (long club names would run out od space and small club names would seem small, ie: INK vs Fellowship of Christian Athletes)
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _contactLabel.font = [UIFont systemFontOfSize:17];  //Contact label (email) max font 17 or smaller
    _meetLabel.font = [UIFont systemFontOfSize:17];      //same for meet label
    _meetLabel.adjustsFontSizeToFitWidth = YES;

    
// save code fom Nathan: save plist into Preferences file
    NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];
    
    for (NSDictionary *dict in prefsArray) 
    {
        if ([[dict objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])  //compare is Club Name is in _objects and dict
        {
            if ([[dict objectForKey:@"Favorites"] isEqualToString:@"1"]) //if clubs are marked as favorite
            {
                (self.favoriteToggle.selectedSegmentIndex = 1);  //make the Segmented Control (toggle) YES = 1
            }
            else                                                //if clubs were not marked as fav
            {
                (self.favoriteToggle.selectedSegmentIndex = 0); //make the Segmented Control (toggle) NO = 0
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
    NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"Clubs.plist"];
    NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];      //array of everything in plist

    NSLog(@"%@", outputFilePath); //NSLOG iPad: /var/mobile/Applications/2347EE54-9FFC-4CAB-8BD3-4525946673F5/Library/Preferences/Clubs.plist COMPUTER: /Users/jfeeley13/Library/Application Support/iPhone Simulator/6.0/Applications/F56DD3E9-78D6-46B0-94EE-62FC790B987A/Library/Preferences/Clubs.plist

    
    if(self.favoriteToggle.selectedSegmentIndex == 1)    //when you click to Yes
    {
        for (NSDictionary *dict in prefsArray)
        {
            if ([[dict objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])
            {
                    [dict setValue:(@"1") forKey:@"Favorites"];  //change Favorites to 1 in dict
                   NSLog(@"DICT: %@", dict);
            }
        }
        NSLog(@"YES PRESSED");

    }
    
    if(self.favoriteToggle.selectedSegmentIndex == 0)    //when you click to No
    {
        for (NSDictionary *dict in prefsArray)
        {
            if ([[dict objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])
            {
                [dict setValue:(@"0") forKey:@"Favorites"]; //change Favorites to 0 in dict
            }
        }
        NSLog(@"NO PRESSED");

    }
    [prefsArray writeToFile:outputFilePath atomically:YES]; //write the data change to prefrences and saved
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
