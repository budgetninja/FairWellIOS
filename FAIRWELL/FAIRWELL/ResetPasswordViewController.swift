//
//  ResetPasswordViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/11/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordViewController: UIViewController {

    
    //Email address text field
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //CANCEL button returns back to login screen
    @IBAction func dismissClick(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    //SEND RESET LINK button tapped
    @IBAction func sendButtonTapped(sender: AnyObject) {
        
        let emailAddress = emailAddressTextField.text;
        if emailAddress!.isEmpty
        {
            //Display a warning message
            let userMessage:String = "Please type in your email address";
            displayMessage(userMessage);
            return;
        }
        
        PFUser.requestPasswordResetForEmailInBackground(emailAddress!, block:{ (success:Bool, error:NSError?) -> Void in
            
            if(error != nil)
            {
                //Display error message
                let userMessage:String = error!.localizedDescription;
                self.displayMessage(userMessage);
                
            }else{
                //Display success message
                let userMessage:String = "An email address was sent to you \(emailAddress)"
                self.displayMessage(userMessage);
            }
            
            
        })
    }
    
    //Displays warning message
    func displayMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle:  UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated:true, completion:nil);
    }

}
