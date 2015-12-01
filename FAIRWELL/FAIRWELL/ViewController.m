//
//  ViewController.m
//  FAIRWELL
//
//  Created by Winnie Liang on 10/28/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <ParseTwitterUtils/ParseTwitterUtils.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *isUserLoggedIn = [NSUserDefaults standardUserDefaults];
    [isUserLoggedIn setValue:@"TRUE" forKey:@"isUserLoggedIn"];
   
    if(!isUserLoggedIn){
    [self performSegueWithIdentifier:@"loginView" sender:self];
    }
}
*/
/*
-(IBAction) logOutButtonTapped:(id)anyObject {
    NSUserDefaults *isUserLoggedIn = [NSUserDefaults standardUserDefaults];
    [isUserLoggedIn setValue:@"FALSE" forKey:@"isUserLoggedIn"];
    [isUserLoggedIn synchronize];
    
     logOutInBackgroundWithBlock:(PF_NULLABLE PFUser)block
    [self performSegueWithIdentifier:@"loginView" sender:self];
}
*/







@end
