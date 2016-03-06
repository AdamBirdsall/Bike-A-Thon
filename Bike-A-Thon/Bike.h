//
//  Bike.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <Parse/Parse.h>

@interface Bike : PFObject <PFSubclassing>

+ (NSString *)parseClassName;
@property (retain) NSString *riderName;
@property (retain) NSString *riderOrg;
@property (retain) NSString *Day;
@property (retain) NSString *Time;
@property int bikeNumber;
@property BOOL isOpen;

@property (strong, nonatomic) NSArray *allBikes;

@end
