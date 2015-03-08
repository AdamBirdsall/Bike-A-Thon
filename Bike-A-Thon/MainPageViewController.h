//
//  MainPageViewController.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 2/25/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface MainPageViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) PageContentViewController *contentViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;



@end
