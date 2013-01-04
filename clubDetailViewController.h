//
//  clubDetailViewController.h
//  proposal
//
//  Created by JFeeley13 on 10/24/12.
//  Copyright (c) 2012 JFeeley13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface clubDetailViewController : UIViewController



@property (strong, nonatomic) id detailItem;
@property (nonatomic, strong) NSMutableArray *clubs;

@property (nonatomic, retain) IBOutlet UITextField *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionLabel;

@property (nonatomic, retain) IBOutlet UILabel *membersLabel;
@property (nonatomic, retain) IBOutlet UILabel *meetLabel;
@property (nonatomic, retain) IBOutlet UITextView *contactLabel;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *favoriteToggle;
@property (nonatomic, retain) NSNumber *favorites;

//@property (nonatomic, strong) NSString *favoriteDictionary;

@end
