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

- (IBAction)march24:(id)sender {
    [_nameField resignFirstResponder];
    [_organizationField resignFirstResponder];
}

- (IBAction)march25:(id)sender {
    [_nameField resignFirstResponder];
    [_organizationField resignFirstResponder];
}

- (IBAction)march26:(id)sender {
    [_nameField resignFirstResponder];
    [_organizationField resignFirstResponder];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([_nameField isFirstResponder] && [touch view] != _nameField) {
        [_nameField resignFirstResponder];
    }
    else if ([_organizationField isFirstResponder] && [touch view] != _organizationField) {
        [_organizationField resignFirstResponder];
    }

    [super touchesBegan:touches withEvent:event];
}


@end
