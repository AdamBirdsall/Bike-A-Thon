//
//  RidersTableViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/1/16.
//  Copyright © 2016 Adam Birdsall. All rights reserved.
//

#import "RidersTableViewController.h"

@interface RidersTableViewController  ()
{
    Day *day;
    TimeSlot *timeSlot;
    Bike *bike1;
    
    NSString *timeString;
}
@end

@implementation RidersTableViewController

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
    
    timeSlot = [[day timeSlots] objectAtIndex:indexPath.row];
    
    
    if ([cell.detailTextLabel.text isEqualToString:@"No bikes available."]) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Bikes Available"
                                                                       message:@"Please select a different time slot."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else if ([_userName isEqualToString:@""] || [_userName isEqualToString:@" "]) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter Name"
                                                                       message:@"Please enter your name before you sign up."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if ([_organizationName isEqualToString:@""] || [_organizationName isEqualToString:@" "]) {
        
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter Organization"
                                                                       message:@"Please enter your organization name before you sign up."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        
        timeString = cell.textLabel.text;
        timeSlot.time = timeString;
        
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please Confirm"
                                                                       message:[NSString stringWithFormat:@"Are you sure you want to sign up for %@ at %@?", _date, timeString]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  [self addUserToTimeSlot];
                                                              }];
        
        UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {}];
        [alert addAction:noAction];
        [alert addAction:defaultAction];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}



- (void) addUserToTimeSlot {
    
    for (int i = 0; i < 7; i++) {
        Bike *newBike = timeSlot.bikes[i];
        
        if (newBike.isOpen) {
            
            newBike.riderName = _userName;
            newBike.riderOrg = _organizationName;
            newBike.isOpen = NO;
            newBike.Day = _date;
            newBike.Time = timeString;
            
            [newBike save];
            
            [self checkIsOpen];
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Success!"
                                                                           message:[NSString stringWithFormat:@"You have signed up at\n %@ on %@!", timeString, _date]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            
            [self.tableView reloadData];
            
            return;
        }
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Bikes left"
                                                                   message:@"Please select another time."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void) checkIsOpen {
    
    for (int i = 0; i < [timeSlot.bikes count]; i++) {
        if ([timeSlot.bikes[i] isOpen]) {
            timeSlot[@"openBike"] = @YES;
            [timeSlot save];
            return;
        }
        
        timeSlot[@"openBike"] = @NO;
        [timeSlot save];
        
    }
}


@end
