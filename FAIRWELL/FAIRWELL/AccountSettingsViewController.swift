//
//  AccountSettingsViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/30/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit
import Parse

class AccountSettingsViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting navigation bar color
        let navBarColor = UIColor(red: 0.376, green:0.686, blue:0.675, alpha:1); //hex #: 60afac
        self.navigationController!.navigationBar.barTintColor = navBarColor;
        self.navigationController!.navigationBar.translucent = false;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    //Menu button tapped
    @IBAction func leftSideButtonTapped(sender: AnyObject) {
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        self.mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    
    
    
    
   /* @IBAction func changeProfilePictureButtonTapped(sender: AnyObject) {
    

        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated: true, completion: nil)

    }
 
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
  
       // profilePictureImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
       /* //Checks the profilePhotoImageView image view object to see if it is nil.
        let profileImageData = UIImageJPEGRepresentation(profilePictureImageView.image!, 1);
        if(profileImageData != nil)
        {
            //Create PFFile object to be sent to Parse could service
            let myUser:PFUser = PFUser.currentUser()!;
            let profileImageFile = PFFile(data: profileImageData!);
            myUser.setObject(profileImageFile!, forKey: "photo")
            
        }*/

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   
    */
    
    
    
    
    
    
    
    
    
    //Change your password which then leads to module view
    
    override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?) {
        let newVC:UIViewController = segue.destinationViewController
        AccountSettingsViewController.setPresentationStyleForSelfController(self, presentingController: newVC)
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
