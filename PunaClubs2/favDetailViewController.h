//
//  favDetailViewController.h
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface favDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *meetLabel;
@property (nonatomic, retain) IBOutlet UITextView *contactLabel;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;

@end