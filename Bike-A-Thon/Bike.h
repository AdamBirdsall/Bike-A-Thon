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
@property int *bikeNumber;
@property BOOL *isOpen;

@end
