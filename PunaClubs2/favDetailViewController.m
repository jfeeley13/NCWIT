//
//  favDetailViewController.m
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import "favDetailViewController.h"

@interface favDetailViewController ()
{
    NSMutableDictionary *_objects;
}

@end

@implementation favDetailViewController
@synthesize contactLabel = _contactLabel;
@synthesize nameLabel = _nameLabel;
@synthesize meetLabel = _meetLabel;
@synthesize descriptionLabel = _descriptionLabel;


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
    _meetLabel.text = [_objects objectForKey:@"Meet"];
    _descriptionLabel.text = [_objects objectForKey:@"Description"];
    //LABEL ADJUST SIZE DEPENDING ON LENGTH OF SENTENCE
    _nameLabel.font = [UIFont boldSystemFontOfSize:31];
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _contactLabel.font = [UIFont systemFontOfSize:17];
    _meetLabel.font = [UIFont systemFontOfSize:17];
    _meetLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
