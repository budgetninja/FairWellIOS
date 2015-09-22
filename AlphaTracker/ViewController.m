//
//  ViewController.m
//  AlphaTracker
//
//  Created by Winnie Liang on 9/21/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {  //typically where labels/buttons go
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect]; //create a new UIButton of this type
    firstButton.frame = CGRectMake(110, 150, 100, 44); //Located at x=100pts, y=100pts, 100pts width, 44pts height
    [firstButton setTitle:@"Login" forState:UIControlStateNormal]; //set the button title, what it shows normally
    [self.view addSubview:firstButton]; //add button on top of our view
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    secondButton.frame = CGRectMake(110, 200, 100, 44);
    [secondButton setTitle:@"Register" forState:UIControlStateNormal]; //set the button title, what it shows normally
    [self.view addSubview:secondButton]; //add button on top of our view
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    thirdButton.frame = CGRectMake(70, 250, 200, 44);
    [thirdButton setTitle:@"Login with Facebook" forState:UIControlStateNormal]; //set the button title, what it shows normally
    [self.view addSubview:thirdButton]; //add button on top of our view
    
    UIButton *fourthButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fourthButton.frame = CGRectMake(70, 300, 200, 44);
    [fourthButton setTitle:@"Login with Google+" forState:UIControlStateNormal]; //set the button title, what it shows normally
    [self.view addSubview:fourthButton]; //add button on top of our view
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 70, 100, 44)]; //create new label with frame
    firstLabel.backgroundColor = [UIColor clearColor]; //sets the label color to background color
    firstLabel.text = @"FairWell"; //set label text
    [self.view addSubview:firstLabel]; //add label as a subview
    
}

- (void)loadView {
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:viewRect];
    self.view = view;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Started touching the screen");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
