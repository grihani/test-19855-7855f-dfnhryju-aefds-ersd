//
//  ListAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 30/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ListAccountsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var allAccounts: [AccountModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        allAccounts = AccountDataModel().allAccountsAToZ()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAccounts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("nameAccounts", forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = allAccounts[row].nameAccount
        
        return cell
    }
}
