//
//  NormalTableViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/5/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "NormalTableViewController.h"

@interface NormalTableViewController ()
{
    Day *day;
    TimeSlot *timeSlot;
    Bike *bike1;
}
@end

@implementation NormalTableViewController

@synthesize info;
@synthesize time;

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    PFQuery *query = [Day query];
    [query whereKey:@"dayTitle" equalTo:_date];
    [query includeKey:@"timeSlots"];
    [query includeKey:@"timeSlots.bikes"];
    
    day = (Day *)[query getFirstObject];
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    timeSlot = [[day timeSlots] objectAtIndex:indexPath.row];
    
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
    else if ([_userName isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Name" message:@"Please enter your name before you sign up." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([_organizationName isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Organization" message:@"Please enter your organization name before you sign up." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@", cell.textLabel.text] message:@"Please select which bike you want. \n(1 - 7)" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *textField = [alert textFieldAtIndex:0];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        NSString *string;
        
        
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        
        UIAlertView *erroralert;
        int bike = [[alertView textFieldAtIndex:0].text intValue];
        
        switch (bike) {
            case 1:
                [self addUserToTimeSlot:1];
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

- (void) addUserToTimeSlot:(int)bike  {
    
    
    PFQuery *query = [Day query];
    [query whereKey:@"dayTitle" equalTo:_date];
    [query includeKey:@"timeSlots"];
    [query includeKey:@"timeSlots.bikes"];
    
    bike1.allBikes = timeSlot.bikes;
    
    for (int i = 0; i < [bike1.allBikes count]; i++) {
        if ([[bike1.allBikes objectAtIndex:i] isOpen]) {
            bike1 = [Bike object];
    
//            query getObjectInBackgroundWithId:block:<#^(PFObject *object, NSError *error)block#>
            
            bike1.riderName = _userName;
            bike1.riderOrg = _organizationName;
            //bike1.bikeNumber = bike;
            bike1.isOpen = NO;
            
            [bike1 saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not Success" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsuccessful" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
}





@end
