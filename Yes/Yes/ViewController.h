//
//  ViewController.h
//  Project login
//
//  Created by Jarret Hutchison on 9/22/15.
//  Copyright (c) 2015 Jarret Hutchison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;

-(IBAction)registerUser:(id)sender;
-(IBAction)LoginUser:(id)sender;
-(IBAction) resetUser:(id)sender;
-(IBAction)registerNewUser:(id)sender;

@end