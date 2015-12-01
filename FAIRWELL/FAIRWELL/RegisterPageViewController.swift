//
//  RegisterPageViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 10/29/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setting navigation bar color
        let navBarColor = UIColor(red: 0.376, green:0.686, blue:0.675, alpha:1); //hex #: 60afac
        self.navigationController!.navigationBar.barTintColor = navBarColor;
        self.navigationController!.navigationBar.translucent = false;
        
        
    }
    
    //
    override func viewDidLayoutSubviews() {
        self.edgesForExtendedLayout = UIRectEdge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When return arrow button is tapped
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    //Uploading profile image
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    


    @IBAction func uploadImageButtonTapped(sender: AnyObject) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
        self.presentViewController(myPickerController, animated: true, completion: nil)
            
    }
        
        
    

    
    //user selects an image, then this function is called
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        //image is set
        profilePhotoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
            displayMyAlertMessage("Passwords do not match. Please try again.");
            return;
        }
        
        
        
        //Store data in PARSE
        let myUser:PFUser = PFUser();
        myUser.username = userUsername;
        myUser.password = userPassword;
        myUser.email = userEmail;
        myUser.setObject(userFirstName!, forKey: "First_Name");
        myUser.setObject(userLastName!, forKey: "Last_Name");
        
        

        //Checks the profilePhotoImageView image view object to see if it is nil.
        let profileImageData = UIImageJPEGRepresentation(profilePhotoImageView.image!, 1)
        if(profileImageData != nil)
        {
            //Create PFFile object to be sent to Parse could service
            let profileImageFile = PFFile(data: profileImageData!);
            myUser.setObject(profileImageFile!, forKey: "photo")
            
        }
        
       /* //Store data NOT USING PARSE
        NSUserDefaults.standardUserDefaults().setObject(userUsername, forKey:"userUsername");
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        */
        
               
        
        /*PFUser.logInWithUsernameInBackground(userUsername!, password: userPassword!){
            (user:PFUser?, error:NSError?) -> Void in
            if (user != nil){
                print ("User successfully registered.")}*/
        
        
        myUser.signUpInBackgroundWithBlock
        {
            (success: Bool, error: NSError?) -> Void in print ("User successfully registered.");
        
            //Display alert message with confirmation
            var userMessage = "Thank you! Registration is successful.";
            
            if(!success)
            {
                //userMessage = "Could not register at this time. Please try again later.";
                userMessage = error!.localizedDescription
            }
            
            
            let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                if(success)
                {
                    self.dismissViewControllerAnimated(true, completion:nil);
                }
            }
        
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated: true, completion: nil);

            
        }
  
       
    }
    

    func displayMyAlertMessage(userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:UIAlertControllerStyle.Alert);
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    

}
