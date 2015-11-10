//
//  LeftSideViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/10/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource
{

    //Create an array for your menu left side view controller
    var menuItems:[String] = ["Home", "Friend List", "Smart Solve!", "Account Setting", "Notification Setting", "Rate This App", "About us", "Logout"];
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        
        return menuItems.count; //table view will have 8 rows
        
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        
    {
        
        var myCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
        
        //get items from row 0, 1, 2 from menuItems array
        myCell.textLabel?.text = menuItems[indexPath.row];
        
        
        return myCell;
        
    }

}
