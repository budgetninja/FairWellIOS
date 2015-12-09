//
//  SmartSolveViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 12/8/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class SmartSolveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setting navigation bar color
        let navBarColor = UIColor(red: 0.376, green:0.686, blue:0.675, alpha:1); //hex #: 60afac
        self.navigationController!.navigationBar.barTintColor = navBarColor;
        self.navigationController!.navigationBar.translucent = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
