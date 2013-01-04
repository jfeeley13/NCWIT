//
//  clubDetailViewController2.m
//  PunaClubs
//
//  Created by JFeeley13 on 12/28/12.
//  Copyright (c) 2012 JFEELEY13. All rights reserved.
//

#import "clubDetailViewController2.h"
@interface clubDetailViewController2 ()

{
    NSMutableDictionary *_objects;
    NSMutableDictionary *favoriteDictionary;
}

@end

@implementation clubDetailViewController2
@synthesize membersLabel = _membersLabel;
@synthesize contactLabel = _contactLabel;
@synthesize nameLabel = _nameLabel;
@synthesize meetLabel = _meetLabel;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize favoriteToggle = _favoriteToggle;
@dynamic favorites;


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_objects != newDetailItem) {
        _objects = newDetailItem;
        
        // Update the view.
    }
}

- (void)viewDidLoad
{
    
    //DETAIL VIEW LABELS LOAD FROM PLIST
    self.navigationItem.title = @"Club Details";
    [super viewDidLoad];
    _nameLabel.text =  [_objects objectForKey:@"Name"];
    _contactLabel.text = [_objects objectForKey:@"Contact"];
    _membersLabel.text = [_objects objectForKey:@"Members"];
    _meetLabel.text = [_objects objectForKey:@"Meet"];
    _descriptionLabel.text = [_objects objectForKey:@"Description"];
    //LABEL ADJUST SIZE DEPENDING ON LENGTH OF SENTENCE
    _nameLabel.font = [UIFont boldSystemFontOfSize:31];
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _contactLabel.font = [UIFont systemFontOfSize:17];
 //   _contactLabel.adjustsFontSizeToFitWidth = YES;
    _meetLabel.font = [UIFont systemFontOfSize:17];
    _meetLabel.adjustsFontSizeToFitWidth = YES;
    

    
    if ([_objects objectForKey:@"Favorites"]== 0)
    {
        (self.favoriteToggle.selectedSegmentIndex = 0);
    }
    else
    {
        (self.favoriteToggle.selectedSegmentIndex = 1);
    }
    
    //  [[NSUserDefaults standardUserDefaults] setValue:NO forKey:@"Favorites"];
    
    NSString *_value= [[NSUserDefaults standardUserDefaults] stringForKey:@"Favorites"];
    
    if([_value compare:@"YES"] == NSOrderedSame)
    {
        (self.favoriteToggle.selectedSegmentIndex = 1);
    }
    else {
        (self.favoriteToggle.selectedSegmentIndex = 0);
    }
    
    
    
    [super viewDidLoad];
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
    
    NSString *labels = [[NSBundle mainBundle] pathForResource:@"Property List"ofType:@"plist"];
    NSArray *array = [labels pathComponents];
    
    //NSUSERDEFAULTS
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *clubName = [_nameLabel text];       //club name saves name in defaults
    [defaults setObject:clubName forKey:@"Name"];
    
    NSString *value = @"NO";   //value is always set for no
    
    
    if(self.favoriteToggle.selectedSegmentIndex = 1)
    {
        value = @"YES";
        [defaults setObject:clubName forKey:@"Name"];
    }
    
    [defaults setObject:clubName forKey:@"Name"];
    [defaults synchronize];
    NSLog(@"%@",defaults);
    
    [array writeToFile:labels atomically:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
