//
//  NormalTableViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "NormalTableViewController.h"

@interface NormalTableViewController ()

@end

@implementation NormalTableViewController

@synthesize info;
@synthesize day;

-(void)viewWillAppear:(BOOL)animated {
    
    PFQuery *query = [Day query];
    [query whereKey:@"dayTitle" equalTo:_date];
    [query includeKey:@"timeSlots"];
    [query includeKey:@"timeSlots.bikes"];
    
    day = [query getFirstObject];
    
    [query orderByAscending:@"createdAt"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarShield.png"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[day timeSlots] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    TimeSlot *timeSlot = [[day timeSlots] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = timeSlot[@"time"];
    
    if ([timeSlot[@"openBike"] boolValue]) {
        cell.detailTextLabel.text = @"Bikes Available!";
    }
    else {
        cell.detailTextLabel.text = @"No bikes available.";
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"%@", _date];
}

//color of the table view cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(85/255.0) blue:(150/255.0) alpha:1.0];
    cell.textLabel.font = [UIFont fontWithName:@"System Bold" size:14];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if ([cell.detailTextLabel.text isEqualToString:@"Bikes Available!"]) {
        cell.detailTextLabel.font = [UIFont fontWithName:@"System Italic" size:3];
        cell.detailTextLabel.textColor = [UIColor greenColor];
    }
    else {
        cell.detailTextLabel.font = [UIFont fontWithName:@"System Italic" size:3];
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.detailTextLabel.text isEqualToString:@"No bikes available."]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Bikes Available" message:@"Please select a different time slot" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Bike" message:@"Please select which bike you want. \n(1 - 7)" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *textField = [alert textFieldAtIndex:0];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        
        UIAlertView *erroralert;
        int bike = [[alertView textFieldAtIndex:0].text intValue];
        
        switch (bike) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            default:
                erroralert = [[UIAlertView alloc] initWithTitle:@"Invalid Input" message:@"Please enter correct input. \n (1 - 7)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [erroralert show];
                break;
        }
    }
}

- (void) addUserToTimeSlot:(int)bike {
    
}





@end
