//
//  clubsFirstViewController.h
//  PunaClubs2
//
//  Created by JFeeley13 on 1/3/13.
//  Copyright (c) 2013 JFeeley13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface clubsFirstViewController : UITableViewController
{
    NSMutableArray * displayItems;
}
@property (nonatomic, strong) NSMutableArray *clubs;
@property (nonatomic, strong) NSString *dictionary;


@end
