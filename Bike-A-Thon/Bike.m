//
//  Bike.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "Bike.h"

@implementation Bike

@synthesize allBikes;

@dynamic bikeNumber;
@dynamic riderName;
@dynamic isOpen;
@dynamic riderOrg;


+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Bike";
}

+ (NSString *)getBikeNumber {
    return @"bikeNumber";
}



@end
