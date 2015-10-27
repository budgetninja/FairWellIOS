//
//  AppDelegate.m
//  Fairwell_IOS
//
//  Created by Winnie Liang on 10/27/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <ParseTwitterUtils/ParseTwitterUtils.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Setting up Parse with Application ID and Client ID
    [Parse setApplicationId:@"EbYqSTBrerVZ4b6B48oa52fqjHWKDS6tpO9SHghT"
                  clientKey:@"hGNeor1GdMDoTVviIKS8ZwDPthQRnKlm6LlrvuiD"];

    //Parse tracks statistics when application opens
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    //Twitter with Consumer Key and Consumer Secret ID's
    [PFTwitterUtils initializeWithConsumerKey:@"LOtpHsG9NFlbojA4ncYWhqd7N"
                               consumerSecret:@"u9rAWg7avzZaefhEunLQ0xJkpRhuf8nY1MPPZj3Y4VNOenl9Cr"];
    
    //Setting up Twitter login
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
        } else {
            NSLog(@"User logged in with Twitter!");
        }
        if (![PFTwitterUtils isLinkedWithUser:user]) {
            [PFTwitterUtils linkUser:user block:^(BOOL succeeded, NSError *error) {
                if ([PFTwitterUtils isLinkedWithUser:user]) {
                    NSLog(@"Woohoo, user logged in with Twitter!");
                }
            }];
        }
    }];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
