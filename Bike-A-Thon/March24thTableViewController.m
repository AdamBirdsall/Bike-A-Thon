//
//  March24thTableViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/3/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "March24thTableViewController.h"

@interface March24thTableViewController ()
{
    Day *day;
}

@end

@implementation March24thTableViewController

//Setting up query for parse data
//**********************************************************************************************
- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"TimeSlot";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"time";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        self.objectsPerPage = 12;
    }
    return self;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [Day query];
    [query whereKey:@"dayTitle" equalTo:@"March 24th, 2015"];
    [query includeKey:@"timeSlots"];
    [query includeKey:@"timeSlots.bikes"];

    //day = [query getFirstObject];
    
    

    /*
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    
    
    if ([self.objects count] == 0) {
        [query setCachePolicy: kPFCachePolicyCacheThenNetwork];
    }
    
    [query orderByAscending:@"createdAt"];
    */
    
    return query;
}
//**********************************************************************************************



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
    return [self.objects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    TimeSlot *timeSlot = [self.objects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = timeSlot[@"time"];
   /* if (timeSlot.isOpen) {
        cell.detailTextLabel.text = @"Open Bike!";
    } else {
        cell.detailTextLabel.text = @"All bikes full.";
    }
    */
    //object = [self.objects objectAtIndex:indexPath.row];
    
    
    //cell.textLabel.text = [object objectForKey:@"time"];
    //cell.detailTextLabel.text = [object objectForKey:@"SignedUp"];*/
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SignUp"]) {
        
        NSIndexPath *indexPath = nil;
        PFObject *object;
        
        indexPath = [self.tableView indexPathForSelectedRow];
        object = [self.objects objectAtIndex:indexPath.row];
        
        
        Info *info = [[Info alloc] init];
        //info.time = [object objectForKey:@"time"];
        //info.objectID = [object objectForKey:@"objectId"];
        
        _4thSignUpViewController *destViewController = segue.destinationViewController;
        destViewController.info = info;
    }
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Tuesday, March 24th";
}


@end
