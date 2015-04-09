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
    let backgroundUnhighlighted = UIColor(red: 0, green: 0, blue: 100, alpha: 0.1)
    let backgroundHighlighted = UIColor(red: 0, green: 0, blue: 100, alpha: 0.25)
    let whiteBackground = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    let whiteTint = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
    let blackTint = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAccounts.dataSource = self
        listAccounts.delegate = self
        allAccounts = AccountDataModel().accountsPerMeeting()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
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
