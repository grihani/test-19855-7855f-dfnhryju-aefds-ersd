//
//  AccountOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 24/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class AccountOfContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var account: AccountModel!
    var allAccounts: [AccountModel] = AccountDataModel().allAccountsAToZ(order: "ASC")
    var buttonOfAccount = UIButton()
    
    @IBOutlet weak var accountTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAccounts.count
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Reuse Identifier") as! UITableViewCell
        cell.textLabel?.text = allAccounts[indexPath.row].nameAccount
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        buttonOfAccount.setTitle(allAccounts[indexPath.row].nameAccount, forState: .Normal)
        account = allAccounts[indexPath.row]
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.account = self.account
            presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func searchAccounts(sender: UITextField) {
        allAccounts = AccountDataModel().searchForAccountsOnNameOrSmallName(dataSearch: sender.text!)
        accountTableView.reloadData()
    }
    
}
