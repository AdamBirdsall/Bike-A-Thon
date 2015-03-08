//
//  PageContentViewController.h
//  Bike-A-Thon
//
//  Created by Adam Birdsall on 2/25/15.
//  Copyright (c) 2015 Adam Birdsall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)LearnMore:(id)sender;

@property NSUInteger pageIndex;
@property NSString *imageFile;

@end
