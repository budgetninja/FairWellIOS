//
//  RegisterPageViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 10/29/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let userFirstName = firstNameTextField.text;
        let userLastName = lastNameTextField.text;
        let userUsername = usernameTextField.text;
        let userEmail = emailTextField.text;
        let userPassword = passwordTextField.text;
        let userConfirmPassword = confirmPasswordTextField.text;
        
    
        //Check for empty fields
        if(userFirstName!.isEmpty || userLastName!.isEmpty || userUsername!.isEmpty || userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty)
        {
            //Display an alert message
            displayMyAlertMessage("All fields are required.");
            return;
        }
      
        
        
        //Check if password and confirmed password matches.
        if(userPassword != userConfirmPassword)
        {
            displayMyAlertMessage("Passwords do not match.");
            return;
        }
        
       /* //Store data NOT USING PARSE
        NSUserDefaults.standardUserDefaults().setObject(userUsername, forKey:"userUsername");
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        */
        
        //Store data in PARSE
        let myUser:PFUser = PFUser();
        myUser.username = userUsername;
        myUser.password = userPassword;
        myUser.email = userEmail;
        
        
        /*PFUser.logInWithUsernameInBackground(userUsername!, password: userPassword!){
            (user:PFUser?, error:NSError?) -> Void in
            if (user != nil){
                print ("User successfully registered.")}*/
        
        
      /*  myUser.signUpInBackgroundWithBlock
        {
            (success:Bool!, error:NSError!) -> Void in println ("User successfully registered.")*/
        
        myUser.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in print ("User successfully registered.")
        
        //Display alert message with confirmation
        var myAlert = UIAlertController(title:"Thank you!", message: "Registration is successful.", preferredStyle:UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion:nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);   

            
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
