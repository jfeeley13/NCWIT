//
//  clubDetailViewController2.h
//  PunaClubs
//
//  Created by JFeeley13 on 12/28/12.
//  Copyright (c) 2012 JFEELEY13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface clubDetailViewController2 : UIViewController

@property (nonatomic, strong) NSMutableArray *clubs;

@property (nonatomic, retain) IBOutlet UITextField *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *membersLabel;
@property (nonatomic, retain) IBOutlet UILabel *meetLabel;
@property (nonatomic, retain) IBOutlet UITextView *contactLabel;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *favoriteToggle;
@property (nonatomic, retain) NSNumber *favorites;

@end
