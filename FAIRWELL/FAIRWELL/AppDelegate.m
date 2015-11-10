//
//  AppDelegate.m
//  FAIRWELL
//
//  Created by Winnie Liang on 10/28/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//


#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <ParseTwitterUtils/ParseTwitterUtils.h>
#import <Bolts/Bolts.h>
#import <UIKit/UIKit.h>





@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [Parse enableLocalDatastore];
    
    //Initializes Parse
    [Parse setApplicationId:@"EbYqSTBrerVZ4b6B48oa52fqjHWKDS6tpO9SHghT"
                  clientKey:@"hGNeor1GdMDoTVviIKS8ZwDPthQRnKlm6LlrvuiD"];
    
    //Parse tracks statistics when application opens
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    /*
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:(@"username")];
  
    //if username has a value, take them to the User Profile page (MainPageViewController)
    if(userName != nil)
    {
        
        //Navigate to MainPageViewController
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *mainPage = [mainStoryBoard instantiateViewControllerWithIdentifier:@"MainPageViewController"];
        //wrapped rootViewController into NavigationController
        UINavigationController *mainPageNav = [[UINavigationController alloc] initWithRootViewController: mainPage];
    
        //Replace signin page with new page by accessing window object
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        [appDelegate.window.rootViewController presentViewController:mainPageNav animated:YES completion:NULL];
        
    }
    */
    
   
    
    [PFTwitterUtils initializeWithConsumerKey:@"XHhWNEDZIVVJJpeqJE5iPGWKx"
                               consumerSecret:@"Se0RMB7HPhevHf3Jy5Y7RCnIJ4NYOefLV0MqxNLtlcQDICjFX1"];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate buildUserInterface];
    
    return YES;
}

//+ instead of - defines a class method
//This method is called in didFinishLaunchingWithOptions
//If user sign-in is successful, logs in the user into the main page.
- (void)buildUserInterface{
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:(@"user_name")];
    
    //if username has a value, take them to the User Profile page (MainPageViewController)
    if(userName != nil)
    {
        
        //Navigate to MainPageViewController
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *mainPage = [mainStoryBoard instantiateViewControllerWithIdentifier:@"MainPageViewController"];
        //Create view controllers
        UIViewController *leftSideMenu = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LeftSideViewController"];
        UIViewController *rightSideMenu = [mainStoryBoard instantiateViewControllerWithIdentifier:@"RightSideViewController"];
        
        
        
        //wrapped rootViewController into NavigationController
        UINavigationController *mainPageNav = [[UINavigationController alloc] initWithRootViewController: mainPage];
        UINavigationController *leftSideMenuNav = [[UINavigationController alloc] initWithRootViewController:leftSideMenu];
        UINavigationController *rightSideMenuNav = [[UINavigationController alloc] initWithRootViewController:rightSideMenu];
        
        MMDrawerController *drawerContainer = [[MMDrawerController alloc] initWithCenterViewController:mainPageNav leftDrawerViewController:leftSideMenuNav rightDrawerViewController:rightSideMenuNav];
        
        
        [drawerContainer setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningCenterView];
        [drawerContainer setCloseDrawerGestureModeMask:MMCloseDrawerGestureModePanningCenterView];
      
        //Replace signin page with new page by accessing window object
       // Already inside appdelegate so no need to instantiate
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

       // UIWindow *window =  [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [appDelegate.window.rootViewController presentViewController: drawerContainer animated:YES completion:NULL];
        
        
        
    }

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
