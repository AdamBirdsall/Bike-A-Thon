//
//  ViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 2/9/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarShield.png"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"March24th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;        
        destViewController.date = @"March 24th, 2015";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
    else if ([segue.identifier isEqualToString:@"March25th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;
        destViewController.date = @"March 25th, 2015";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
    else if ([segue.identifier isEqualToString:@"March26th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;
        destViewController.date = @"March 26th, 2015";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
}

@end
