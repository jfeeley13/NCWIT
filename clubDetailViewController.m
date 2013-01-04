//
//  clubDetailViewController.m
//  proposal
//
//  Created by JFeeley13 on 10/24/12.
//  Copyright (c) 2012 JFeeley13. All rights reserved.
//

#import "clubDetailViewController.h"

@interface clubDetailViewController ()
{
    NSMutableDictionary *_objects;
}
@end

@implementation clubDetailViewController
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

    
   // _favoriteToggle.selectedSegmentIndex = [_objects objectForKey:@"Favorites"] ? 0 : 1;
    if ([_objects objectForKey:@"Favorites"]== 0)        
    {
        (self.favoriteToggle.selectedSegmentIndex = 1);
    }
    else
    {
        (self.favoriteToggle.selectedSegmentIndex = 0);
    }
    [super viewDidLoad];

  /*
    NSString *_value= [[NSUserDefaults standardUserDefaults] stringForKey:@"Favorites"];
    
    if([_value compare:@"YES"] == NSOrderedSame)
    {
        (self.favoriteToggle.selectedSegmentIndex = 1);
    }
    else 
    {
        (self.favoriteToggle.selectedSegmentIndex = 0);
    }
 */   
   // _favoriteToggle.selectedSegmentIndex= [[[[NSUserDefaults standardUserDefaults] stringForKey:@"Favorites"] boolValue] animated:NO];
}

- (IBAction)favoriteToggleChanged:(id)sender
{
    /*
    if (self.favoriteToggle.selectedSegmentIndex == 1)
    {
        [_objects setValue:(@"1") forKey:@"Favorites"];
         NSLog(@"Favorites Pressed");
    }
    else
    {
        [_objects setValue:@"0" forKey:@"Favorites"];
    }

    NSString *labels = [[NSBundle mainBundle] pathForResource:@"Property List"ofType:@"plist"];
    NSArray *array = [labels pathComponents];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:array];
    for (int i = 0; i < [tempArray count]; i++)
    {
        if ([[[tempArray objectAtIndex:i] objectForKey:@"Name"] isEqual:[_objects objectForKey:@"Name"]])
        {
            [tempArray objectAtIndex:i];
        }
    }
    */
    /* From Nathan - NEW code for saving/loading
     NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
     
     NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
     
     
     
     NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"clubs.plist"];
     
     NSLog(@"%@",outputFilePath);
     
     
     
     [[self serializeArray:self.pieces] writeToFile:outputFilePath atomically:YES];
     
     
     Loading:
     
     NSArray *sysPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
     
     NSString *prefsDirectory = [[sysPaths objectAtIndex:0] stringByAppendingPathComponent:@"/Preferences"];
     
     
     
     NSString *outputFilePath=[prefsDirectory stringByAppendingPathComponent:@"clubs.plist"];
     
     NSArray *prefsArray = [[NSArray alloc] initWithContentsOfFile:outputFilePath];
     */
    
    NSString *labels = [[NSBundle mainBundle] pathForResource:@"Property List"ofType:@"plist"];
    NSArray *array = [labels pathComponents];
    [array writeToFile:labels atomically:YES];
    
//NSUSERDEFAULTS
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *clubName = [_nameLabel text];             //Saves Club Name in defaults

    if(self.favoriteToggle.selectedSegmentIndex = 1)    //when you click to Yes
    {
        [defaults setObject:clubName forKey:@"Name"];   //log the club name
        [[NSUserDefaults standardUserDefaults] setValue:NO forKey:@"Favorites"];
        [_objects setValue:(@"1") forKey:@"Favorites"]; //HERE SOMEHOW CHANGE PLIST FAV VALUE TO 1
    }
    NSLog(@"%@",clubName);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
