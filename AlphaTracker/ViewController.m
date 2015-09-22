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
    
/* NORMAL BUTTON WITHOUT IMAGE
 UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 thirdButton.frame = CGRectMake(70, 250, 200, 44);
 [thirdButton setTitle:@"Login with Facebook" forState:UIControlStateNormal]; //set the button title, what it shows normally
 [self.view addSubview:thirdButton]; //add button on top of our view
 */
 
    UIImage *LoginButtonImage = [UIImage imageNamed:@"LoginButton.jpg"];
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom]; //create a new UIButton of this type
    firstButton.frame = CGRectMake(60, 250, 200, 44); //Located at x=100pts, y=100pts, 100pts width, 44pts height*/
    [firstButton setImage:LoginButtonImage forState:UIControlStateNormal];
    [self.view addSubview:firstButton]; //add button on top of our view
    
    
    UIImage *RegisterButtonImage = [UIImage imageNamed:@"RegisterButton.jpg"];
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(60, 300, 200, 44);
    [secondButton setImage:RegisterButtonImage forState:UIControlStateNormal];
    [self.view addSubview:secondButton]; //add button on top of our view
    
    
    UIImage *FacebookButtonImage = [UIImage imageNamed:@"FacebookButton.jpg"];
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = CGRectMake(60, 350, 200, 44);
    [thirdButton setImage:FacebookButtonImage forState:UIControlStateNormal];
    [self.view addSubview:thirdButton]; //add button on top of our view
    
    
    UIImage *GoogleButtonImage = [UIImage imageNamed:@"Google+Button.jpg"];
    UIButton *fourthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fourthButton.frame = CGRectMake(60, 400, 200, 44);
    [fourthButton setImage:GoogleButtonImage forState:UIControlStateNormal];
    fourthButton.backgroundColor = [UIColor clearColor];
    [self.view addSubview:fourthButton]; //add button on top of our view
    
    
    UIImage *FairwellLabelImage = [UIImage imageNamed:@"FairwellLabel.png"];
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 70, 100, 44)]; //create new label with frame
    firstLabel.backgroundColor = [UIColor clearColor]; //sets the label color to background color
    firstLabel.text = @"FairWell"; //set label text
    [firstLabel setShadowColor:[UIColor greenColor]];
    [firstLabel setFont:[UIFont fontWithName:@"Verdana" size:12.0f]];
    [firstLabel setShadowOffset:CGSizeMake(0.0f, -1.0f)];
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