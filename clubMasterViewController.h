//
//  clubMasterViewController.h
//  proposal
//
//  Created by JFeeley13 on 10/24/12.
//  Copyright (c) 2012 JFeeley13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface clubMasterViewController : UITableViewController 
{
    NSMutableArray * displayItems;
}
@property (nonatomic, strong) NSMutableArray *clubs;
@property (nonatomic, strong) NSString *dictionary;


@end
