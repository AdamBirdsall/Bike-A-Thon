//
//  LearnMoreViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/3/16.
//  Copyright © 2016 Adam Birdsall. All rights reserved.
//

#import "LearnMoreViewController.h"

@interface LearnMoreViewController ()

@end

@implementation LearnMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)learnMore:(id)sender {
    NSString *str = @"http://www.abilityexperience.org/";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
