//
//  TimeSlot.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <Parse/Parse.h>

@interface TimeSlot : PFObject <PFSubclassing>

+ (NSString *)parseClassName;
@property (retain) NSString *time;
@property (retain) NSArray *bikes;
@property BOOL *openBike;
//
//+ (NSString *)getTimeSlot;
//+ (void)setTimeSlot:(NSString *)time;
//+ (NSArray *)getBikes;
//+ (void)setBikes:(NSArray *)bikeArray;
//+ (BOOL *)getIsOpen;
//+ (void)setIsOpen:(BOOL *)open;
//+ (void)checkAvailable;
//
//-(instancetype)initWithTime: (NSString *)time
//                      bikes: (NSArray *)bikes
//                       open: (BOOL *)open;

@end
