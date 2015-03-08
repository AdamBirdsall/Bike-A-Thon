//
//  24thSignUpViewController.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/3/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Info.h"
#import "Bike.h"
#import "Day.h"
#import "TimeSlot.h"

@interface _4thSignUpViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic, strong) Info *info;
@property (weak, nonatomic) IBOutlet UIPickerView *bikePicker;

- (IBAction)signUp:(id)sender;
@end
