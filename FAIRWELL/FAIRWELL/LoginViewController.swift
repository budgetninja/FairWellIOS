//
//  LoginViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 10/29/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import ParseTwitterUtils
import Parse




class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userUsername = usernameTextField.text;
        let userPassword = passwordTextField.text;
        
        
        //Check for empty fields
        if(userUsername!.isEmpty || userPassword!.isEmpty)
        {
            self.displayMyAlertMessage("All fields are required.");
            return;
        }
        
        //
        let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated:true);
        spinningActivity.labelText = "Sending data..";
        spinningActivity.detailsLabelText = "Please wait a moment";
        
        
        //Login WITH PARSE
        PFUser.logInWithUsernameInBackground(userUsername!, password: userPassword!) {
            (user: PFUser?, error: NSError?) -> Void in
            
            
            MBProgressHUD.hideAllHUDsForView(self.view, animated: true);
            var userMessage = "Welcome";
            
            
            if (user != nil)
            {
                
                
                //Remember the signin state!!
                //Login is successful.
                let user_Username:String? = user?.username
                NSUserDefaults.standardUserDefaults().setObject(user_Username, forKey: "user_name");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                /*
                //Navigate to MainPageViewController
                let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
                
                Navigate to protected page
                var mainPage = mainStoryBoard.instantiateViewControllerWithIdentifier("MainPageViewController");
                
                //wrapped rootViewController into NavigationController
                var mainPageNav = UINavigationController(rootViewController:mainPage);
*/

                //Replace signin page with new page by accessing window object
                let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                
                appDelegate.buildUserInterface();
                /*
                appDelegate.window?.rootViewController = mainPageNav;
        
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil); //dismisses view controller
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let gotoUserProfileViewController = storyboard.instantiateViewControllerWithIdentifier("User Profile") as UIViewController
                self.presentViewController(gotoUserProfileViewController, animated: true, completion: nil)*/
            
            }
            else{
                
                //Produce error message if user attempt to login is NOT successful
                userMessage = error!.localizedDescription;
                self.displayMyAlertMessage(userMessage);
            }
            
        }
        
        /*
        //Storing user details WITHOUT PARSE
        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("userUsername");
        let passwordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if(usernameStored == userUsername)
        {
            if(passwordStored == userPassword)
            {
                //Login is successful!
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                self.dismissViewControllerAnimated(true, completion: nil);
            }
        }*/
        
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
    @IBAction func TwitterButtonTapped(sender: AnyObject) {
        
        
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                   //process user object
                    self.processTwitterUser()
                } else {
                   //process user object
                    self.processTwitterUser()
                }
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    
        
    }
   
    
    func processTwitterUser(){
        
        //Show activity indicator
        let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        spinningActivity.labelText = "Loading"
        spinningActivity.detailsLabelText = "Please wait"
        
        let pfTwitter = PFTwitterUtils.twitter()
        let TwitterUsername = pfTwitter?.screenName
        
        var userDetailsURL:String = "http://api.twitter.com/1.1/users/show.json?screen_name="
        userDetailsURL = userDetailsURL + TwitterUsername!
        
        let myURL = NSURL(string: userDetailsURL);
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "GET";
        
        pfTwitter!.signRequest(request);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if error != nil{
                spinningActivity.hide(true)
                
                self.displayMyAlertMessage(error!.localizedDescription);
                
                
                PFUser.logOut()
                return
            }
            
            do{
            
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
            
            if let parseJSON = json
            {
                //Extract profile image
                if let profileImageURL = parseJSON["profile_image_url"] as? String
                {
                    let profilePictureURL = NSURL(string: profileImageURL)
                    let profilePictureData = NSData(contentsOfURL: profilePictureURL!)
                    
                    //Prepare PFUser object
                    if(profilePictureData != nil){
                        let profileFileObject = PFFile(data:profilePictureData!)
                        PFUser.currentUser()?.setObject(profileFileObject!, forKey: "profile_picture")
                    }
                    
                    PFUser.currentUser()?.username = TwitterUsername
                    PFUser.currentUser()?.setObject(TwitterUsername!, forKey: "first_name")
                    PFUser.currentUser()?.setObject(" ", forKey: "last_name")
                    /*
                    PFUser.currentUser()?.saveInBackgroundWithBlock({ (success, error) -> Void in
                        if(error != nil)
                        {
                            spinningActivity.hide(true)
                            
                            //Display error message
                            self.displayMyAlertMessage(error!.localizedDescription);
                            PFUser.logOut()
                            return
                        }
                        
                        spinningActivity.hide(true)
                        NSUserDefaults.standardUserDefaults().setObject(TwitterUsername, forKey: "user_name")
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                        
                        dispatch_async(dispatch_get_main_queue()){
                            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            appDelegate.buildUserInterface()
                        }
                    })*/
                }
            }
        } catch{
            print(error)
        }
    }
        
        task.resume()
    
    }
    
    
    //Forgot Password? clicked which then leads to module view
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?) {
        let newVC:UIViewController = segue.destinationViewController
        LoginViewController.setPresentationStyleForSelfController(self, presentingController: newVC)
    }
    
    class func setPresentationStyleForSelfController(selfController: UIViewController, presentingController: UIViewController) {
        if NSProcessInfo.instancesRespondToSelector("isOperatingSystemAtLeastVersion:")
        {
            presentingController.providesPresentationContextTransitionStyle = true
            presentingController.definesPresentationContext = true
            presentingController.modalPresentationStyle =  UIModalPresentationStyle.OverCurrentContext;
        }
        else {
            selfController.modalPresentationStyle =  UIModalPresentationStyle.CurrentContext;
            selfController.navigationController!.modalPresentationStyle = UIModalPresentationStyle.CurrentContext;
        }
    }

    
    
}
