//
//  Day.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "Day.h"

@implementation Day

@dynamic dayTitle;
@dynamic timeSlots;

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Day";
}

@end
