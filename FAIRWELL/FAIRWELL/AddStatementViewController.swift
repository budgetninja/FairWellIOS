//
//  AddStatementViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 12/8/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class AddStatementViewController: UIViewController {

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
    

    

}
