//
//  ViewController.m
//  SlideBarTrial
//
//  Created by Jarret Hutchison on 10/28/15.
//  Copyright (c) 2015 Jarret Hutchison. All rights reserved.
//

#import "ViewController.h"
#import"SWRevealViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // controls for view contol like when pushed to slide out menu and when swiped to slide out
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
