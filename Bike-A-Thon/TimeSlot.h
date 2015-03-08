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
@property (retain) NSString *getTime;
@property (retain) NSArray *bikes;
@property BOOL *isOpen;

//+ (NSString *)getTimeSlot;
//+ (BOOL *)getIsOpen;

-(instancetype)initWithTime: (NSString *)time
                      bikes: (NSArray *)bikes
                       open: (BOOL *)open;

@end
