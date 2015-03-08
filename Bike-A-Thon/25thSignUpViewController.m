//
//  25thSignUpViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/3/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "25thSignUpViewController.h"

@interface _5thSignUpViewController ()
{
    NSArray *pickerData;
    NSArray *bike;
}

@end

@implementation _5thSignUpViewController

@synthesize info;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pickerData = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    bike = @[@"Bike #"];
    self.bikePicker.dataSource = self;
    self.bikePicker.delegate = self;
    
    //self.mainLabel.text = [NSString stringWithFormat:@"Sign Up For Tuesday, March 24th at %@", info.time];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarShield.png"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self setMainLabel:nil];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return bike.count;
    }
    else {
        return pickerData.count;
    }
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return bike[row];
    }
    else if (component == 1) {
        return pickerData[row];
    }
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"System Bold" size:14]];
    }
    // Fill the label text here
    if (component == 0) {
        tView.text = bike[row];
        tView.textColor = [UIColor whiteColor];
    }
    else {
        tView.text = pickerData[row];
        tView.textColor = [UIColor whiteColor];
    }
    return tView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUp:(id)sender {
}
@end
