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
    [self performSegueWithIdentifier:@"March24th" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"March22th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;        
        destViewController.date = @"March 22nd, 2016";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
    else if ([segue.identifier isEqualToString:@"March23th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;
        destViewController.date = @"March 23rd, 2016";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
    else if ([segue.identifier isEqualToString:@"March24th"]) {
        NormalTableViewController *destViewController = segue.destinationViewController;
        destViewController.date = @"March 24th, 2016";
        destViewController.userName = _nameField.text;
        destViewController.organizationName = _organizationField.text;
    }
    else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Bikes Available"
                                                                       message:@"Please select a different time slot."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)helpButton:(id)sender {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Send email for help?"
                                                                   message:@"Send an email if you need to switch / delete time slot(s) you have signed up for."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {

                                                              // Email Subject
                                                              NSString *emailTitle = @"Bike-A-Thon Help";
                                                              
                                                              // To address
                                                              NSArray *toRecipents = [NSArray arrayWithObject:@"adam.birdsall4@gmail.com"];
                                                              
                                                              MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
                                                              mc.mailComposeDelegate = self;
                                                              [mc setSubject:emailTitle];
                                                              [mc setToRecipients:toRecipents];
                                                              
                                                              // Present mail view controller on screen
                                                              [self presentViewController:mc animated:YES completion:NULL];
                                                              
                                                          }];
    
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [alert addAction:noAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nameField resignFirstResponder];
    [_organizationField resignFirstResponder];
    return YES;
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
