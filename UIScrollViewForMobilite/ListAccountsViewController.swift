//
//  ListAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 30/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ListAccountsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listAccounts: UITableView!
    @IBOutlet weak var triAccounts: UISegmentedControl!
    var allAccounts: [AccountModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAccounts.dataSource = self
        listAccounts.delegate = self
        allAccounts = AccountDataModel().accountsPerMeeting()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        allAccounts = AccountDataModel().accountsPerMeeting()
        self.listAccounts.reloadData()
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
    
    @IBAction func changeAccountList(sender: UISegmentedControl) {
        switch triAccounts.selectedSegmentIndex{
        case 0:
          allAccounts = AccountDataModel().accountsPerMeeting()
        case 1:
            println("ASC")
            allAccounts = AccountDataModel().allAccountsAToZ(order: "ASC")
        case 2:
            allAccounts = AccountDataModel().allAccountsAToZ(order: "DESC")
        default: break
        }
        listAccounts.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showChosenAccount" {
            if let indexPath = self.listAccounts.indexPathForSelectedRow() {
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailAccountsViewController
                controller.account = allAccounts[indexPath.row]
            }
        }
    }
}
