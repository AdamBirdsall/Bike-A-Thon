//
//  NormalTableViewController.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Bike.h"
#import "Day.h"
#import "TimeSlot.h"
#import "Info.h"

@interface NormalTableViewController : UITableViewController

@property (nonatomic, strong) Info *info;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *organizationName;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *objectID;

@end
