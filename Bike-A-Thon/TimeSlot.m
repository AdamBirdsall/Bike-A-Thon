//
//  TimeSlot.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <Parse/PFObject+Subclass.h>
#import "TimeSlot.h"

@implementation TimeSlot

@dynamic bikes;
@dynamic time;
@dynamic openBike;

//-(instancetype)initWithTime:(NSString *)time bikes:(NSArray *)bikes open:(BOOL *)open {
//    self = [super init];
//    
//    if (self) {
//        self.getTime = time;
//        self.bikes = bikes;
//        self.isOpen = open;
//    }
//    return self;
//}

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"TimeSlot";
}


@end
