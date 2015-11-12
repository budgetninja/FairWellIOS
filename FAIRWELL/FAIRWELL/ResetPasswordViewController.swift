//
//  ResetPasswordViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/11/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

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
        
          self.dismissViewControllerAnimated(true, completion: nil)
    }

}
