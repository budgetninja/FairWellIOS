//
//  ChangeUsernameViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/30/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import Parse

class ChangeUsernameViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func dismissClick(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil);

    }
    
    
    
    @IBAction func okButtonTapped(sender: AnyObject) {
        
        //get current user
        let myUser:PFUser = PFUser.currentUser()!;
        
        if(!usernameTextField.text!.isEmpty)
        {
            let userUsername = usernameTextField.text;
            myUser.username = userUsername;
            displayMessage("New username successfully updated");
        }else{
            displayMessage("Username field is invalid. Please re-enter");
        }
        
        
        
        
        //Display activity indicator
        let loadingNotification = MBProgressHUD.showHUDAddedTo(self.view, animated: true);
        loadingNotification.labelText = "Please wait"
        
        myUser.saveInBackgroundWithBlock{(success:Bool, error:NSError?) -> Void in
            //Hide activity indicator
            loadingNotification.hide(true);
            
            if(error != nil){
                self.displayMessage(error!.localizedDescription);
            }
            
        }
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
