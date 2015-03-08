//
//  March25thTableViewController.m
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 3/3/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import "March25thTableViewController.h"

@interface March25thTableViewController ()

@end

@implementation March25thTableViewController
//Setting up query for parse data
//**********************************************************************************************
- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"March25th";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"time";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
        self.objectsPerPage = 24;
    }
    return self;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    if ([self.objects count] == 0) {
        [query setCachePolicy: kPFCachePolicyCacheThenNetwork];
    }
    
    [query orderByAscending:@"createdAt"];
    
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
    
    
    
    object = [self.objects objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = [object objectForKey:@"time"];
    cell.detailTextLabel.text = [object objectForKey:@"SignedUp"];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Wednesday, March 25th";
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
        
        _5thSignUpViewController *destViewController = segue.destinationViewController;
        destViewController.info = info;
    }
}

@end
