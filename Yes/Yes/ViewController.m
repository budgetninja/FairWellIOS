//
//  ViewController.m
//  Project login
//
//  Created by Jarret Hutchison on 9/22/15.
//  Copyright (c) 2015 Jarret Hutchison. All rights reserved.
//
#import "ViewController.h"

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey: @"registered"]) {
        NSLog(@"No Registered User");
        _loginBtn.hidden=NO;
    }
    else {
        NSLog(@"User is Registered");
        _reEnterPasswordField.hidden = YES;
        _registerBtn.hidden = NO;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)registerUser:(id)sender{
    if([_usernameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"I'm Sorry" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else
    {
        [self checkPasswordsMatch];
    }
    
}

-(void) checkPasswordsMatch {
    if ([_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        NSLog(@"Passwords Match");
        [self registerNewUser];
        
    }
    else {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"I'm Sorry" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }
}

-(void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_usernameField.text forKey:@"username"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [success show];
    
     [self performSegueWithIdentifier:@"login" sender:self];
}


-(IBAction) LoginUser:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if([_usernameField.text isEqualToString:[defaults objectForKey:@"username"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]])
    {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
    else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"I'm Sorry" message:@"Wrong Username Or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [error show];
    }
    
}

-(IBAction) resetUser:(id)sender
{
    
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject: nil forKey:@"username"];
    [defaults setObject: nil forKey:@"password"];
    [defaults setBool:NO forKey:@"registered"];
    _reEnterPasswordField.hidden = NO;
}

@end

