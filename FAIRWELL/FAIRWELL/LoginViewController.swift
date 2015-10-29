//
//  LoginViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 10/29/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userUsername = usernameTextField.text;
        let userPassword = passwordTextField.text;
        
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
        }
        
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
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

}
