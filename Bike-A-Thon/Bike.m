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

@dynamic bikeNumber;
@dynamic riderName;
@dynamic isOpen;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Bike";
}

@end
