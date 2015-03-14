//
//  ViewController.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 2/9/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Info.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *organizationField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

- (IBAction)march24:(id)sender;
- (IBAction)march25:(id)sender;
- (IBAction)march26:(id)sender;

@end

