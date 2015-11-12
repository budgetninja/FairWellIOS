//
//  AccountSettingViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/11/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class AccountSettingViewController: UITableViewController {

    var objects = NSMutableArray();
    var accountSettingList = [["Title":"Change username", "Info":"Your username is used to login your account"],["Title":"Change password","Info":"Your password is important"], ["Title":"Change profile picture","Info":"Select image from gallery or take a picture"], ["Title":"Disable notifications","Info":"You will never receive any notification from Fairwell application"], ["Title":"Select ringtone", "Info":"Types of ringtone"]];
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return accountSettingList.count;
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let myCellToReturn:AccountSettingCustomCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! AccountSettingCustomCell;
        
        self.tableView.rowHeight = 105.0
        myCellToReturn.setNeedsUpdateConstraints()
        myCellToReturn.updateConstraintsIfNeeded()
        
        let object = accountSettingList[indexPath.row] as NSDictionary;
        myCellToReturn.titleLabel.text = object["Title"] as? String;
        myCellToReturn.informationLabel.text = object["Info"] as? String;
        
        return myCellToReturn;
   
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    
    
}