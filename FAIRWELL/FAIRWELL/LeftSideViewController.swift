//
//  LeftSideViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/10/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import Parse




class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    
    var drawer_Container : MMDrawerController?

    //Create an array for your menu left side view controller
    var menuItems:[String] = ["Home", "Friend List", "Smart Solve!", "Account Setting", "Notification Setting", "Rate This App", "About us", "Logout"];
    
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return menuItems.count; //table view will have 8 rows
        
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
        
        let myCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) 
        
        //get items from row 0, 1, 2 from menuItems array
        myCell.textLabel?.text = menuItems[indexPath.row];
        
        return myCell;
        
    }
    
    
    //When user taps on one of the table cells in the menu (depends on which row), it leads to the page
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
    
        
       
        /*
        var myCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
        
        var backgroundView:UIView = UIView(frame:CGRectZero);
        backgroundView.backgroundColor = UIColor.grayColor();
        myCell.backgroundView = backgroundView;
       
        
        myCell.textLabel!.backgroundColor = UIColor.grayColor();
        myCell.accessoryView!.backgroundColor = UIColor.grayColor();
        myCell.detailTextLabel!.backgroundColor = UIColor.grayColor();
        */
        
        switch(indexPath.row)
        {
        case 0:
            //Opens User Profile  page
  
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
            let mainPageViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainPageViewController") as! MainPageViewController;
            let leftSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("LeftSideViewController") as! LeftSideViewController;
            let rightSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("RightSideViewController") as! RightSideViewController;
    
            let mainPageNav = UINavigationController(rootViewController: mainPageViewController);
            let leftSideMenuNav = UINavigationController(rootViewController: leftSideMenu);
            let rightSideMenuNav = UINavigationController(rootViewController: rightSideMenu);
            
            
            drawer_Container = MMDrawerController(centerViewController:mainPageNav, leftDrawerViewController:leftSideMenuNav, rightDrawerViewController: rightSideMenuNav);
            drawer_Container?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
            drawer_Container?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            appDelegate.window?.rootViewController = drawer_Container;

            //appDelegate.drawerContainer?.centerViewController = aboutPageNav;
            //appDelegate.drawerContainer?.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil);
            
            break;
        case 1:
            //Opens Friend List page
            
            
            break;
        case 2:
            //Opens Smart Solve! page
            
            
            break;
        case 3:
            //Opens Account Setting page
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
            let accountSettingViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AccountSettingViewController");
            let leftSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("LeftSideViewController") as! LeftSideViewController;
            let rightSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("RightSideViewController") as! RightSideViewController;
            
            let accountSettingPageNav = UINavigationController(rootViewController: accountSettingViewController);
            let leftSideMenuNav = UINavigationController(rootViewController: leftSideMenu);
            let rightSideMenuNav = UINavigationController(rootViewController: rightSideMenu);
            
            
            drawer_Container = MMDrawerController(centerViewController:accountSettingPageNav, leftDrawerViewController:leftSideMenuNav, rightDrawerViewController: rightSideMenuNav);
            drawer_Container?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
            drawer_Container?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            appDelegate.window?.rootViewController = drawer_Container;

            
            break;
        case 4:
            //Opens Notification Setting page
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
            let notificationSettingViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotificationSettingViewController");
            let leftSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("LeftSideViewController") as! LeftSideViewController;
            let rightSideMenu = mainStoryboard.instantiateViewControllerWithIdentifier("RightSideViewController") as! RightSideViewController;
            
            let notificationSettingPageNav = UINavigationController(rootViewController: notificationSettingViewController);
            let leftSideMenuNav = UINavigationController(rootViewController: leftSideMenu);
            let rightSideMenuNav = UINavigationController(rootViewController: rightSideMenu);
            
            
            drawer_Container = MMDrawerController(centerViewController: notificationSettingPageNav, leftDrawerViewController:leftSideMenuNav, rightDrawerViewController: rightSideMenuNav);
            drawer_Container?.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
            drawer_Container?.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            appDelegate.window?.rootViewController = drawer_Container;

            
            break;
        case 5:
            //Opens Rate the App page
            
            
            break;
        case 6:
            //Open the About US page
            let url: NSURL = NSURL(string: "http://budgetninja.github.io")!
            UIApplication.sharedApplication().openURL(url)
            
            
            break;
            
        case 7:
            //Perform log out and take user to sign-in page
            
            NSUserDefaults.standardUserDefaults().removeObjectForKey("user_name");
            NSUserDefaults.standardUserDefaults().synchronize();
            
            let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true);
            spinningActivity.labelText = "Sending";
            spinningActivity.detailsLabelText = "Please wait";
            
            PFUser.logOutInBackgroundWithBlock{ (error:NSError?) -> Void in
                spinningActivity.hide(true);
                
                //Navigate to log in page
                let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil);
                let loginPage:LoginViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController;
                let loginPageNav = UINavigationController(rootViewController: loginPage);
                let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                appDelegate.window?.rootViewController = loginPageNav;
            }
            break;
            
        default:
            print("Option is not handled");
        }
        
        
    }
    
    
}
