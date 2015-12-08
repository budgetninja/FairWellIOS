//
//  MainPageViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/3/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import Parse

class MainPageViewController: UIViewController {

    
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    
    @IBOutlet weak var userFullNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        //Setting navigation bar color
        let navBarColor = UIColor(red: 0.376, green:0.686, blue:0.675, alpha:1); //hex #: 60afac
        self.navigationController!.navigationBar.barTintColor = navBarColor;

        
        
        //Putting user's full name onto User Profile page
        let userFirstName = PFUser.currentUser()!.objectForKey("First_Name") as! String;
        let userLastName = PFUser.currentUser()!.objectForKey("Last_Name") as! String;
        userFullNameLabel.text = userFirstName + " " + userLastName;
        
        //Putting user's profile picture onto User Profile page
        let profilePictureObject =
        PFUser.currentUser()?.objectForKey("photo") as! PFFile;
        //If photo file is downloaded from Parse storage, this method is called
        profilePictureObject.getDataInBackgroundWithBlock { (imageData:NSData?, error:NSError?) -> Void in
            if(imageData != nil)
            {
                self.userProfilePicture.image = UIImage(data:imageData!);
            }
            else{
                let defaultProfilePicture = UIImage(contentsOfFile: "profilepic.png");
                self.userProfilePicture.center = self.view.center;
                self.view.addSubview(self.userProfilePicture);
              
            }
        }
        

        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    
    @IBAction func leftSideButtonTapped(sender: AnyObject) {
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        self.mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)

    
        
    }
    
    
    
}
