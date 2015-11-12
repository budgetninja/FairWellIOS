//
//  NotificationSettingViewController.swift
//  FAIRWELL
//
//  Created by Winnie Liang on 11/11/15.
//  Copyright © 2015 Winnie Liang. All rights reserved.
//

import UIKit

class NotificationSettingViewController: UITableViewController {

    var objects = NSMutableArray();
    var notificationSettingList = [["Title":"Friend Request", "Info":"Receive information when someone removes you as a friend"],["Title":"Friend Remove","Info":"Receive notification when someone removes you as a friend"], ["Title":"Confirm Statement","Info":"Receive notification when someone adds a statement"], ["Title":"Resolve Statement","Info":"Receive notification when the statement is resolved"], ["Title":"Statement due frequency", "Info":"Select the notification frequency when a statement is due"]];
    
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
        return notificationSettingList.count;
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let myCellToReturn:NotificationSettingCustomCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! NotificationSettingCustomCell;
        
        self.tableView.rowHeight = 105.0
        myCellToReturn.setNeedsUpdateConstraints()
        myCellToReturn.updateConstraintsIfNeeded()
        
        let object = notificationSettingList[indexPath.row] as NSDictionary;
        myCellToReturn.titleLabel.text = object["Title"] as? String;
        myCellToReturn.informationLabel.text = object["Info"] as? String;
        
        return myCellToReturn;
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    
    
}