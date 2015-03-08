//
//  PageContentViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 2/25/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundImage.image = [UIImage imageNamed:self.imageFile];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LearnMore:(id)sender {
    
    NSURL *url = [ [ NSURL alloc ] initWithString: @"http://www.pushamerica.org/" ];
    [[UIApplication sharedApplication] openURL:url];
    
}
@end
