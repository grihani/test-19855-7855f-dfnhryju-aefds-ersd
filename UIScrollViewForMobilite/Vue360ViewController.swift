//
//  DetailAccountsV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 28/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class Vue360ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var accountName: UILabel! {
        didSet {
            if let account = account {
                accountName.text = account.nameAccount
            }
        }
    }
    @IBOutlet weak var accountShortName: UILabel! {
        didSet {
            if let account = account {
                accountShortName.text = account.shortNameAccount
            }
        }
    }
    @IBOutlet weak var accountType: UILabel! {
        didSet {
            if let account = account {
                accountType.text = account.typeAccount
            }
        }
    }
    @IBOutlet weak var accountWebsite: UIButton! {
        didSet {
            if let account = account {
                accountWebsite.setTitle(account.websiteAccount, forState: .Normal)
            }
        }
    }
    @IBOutlet weak var accountParentAccount: UIButton! {
        didSet {
            accountParentAccount.setTitleColor(UIColor.blackColor(), forState: .Disabled)
            if parentAccount != nil {
                accountParentAccount.setTitle(parentAccount.nameAccount, forState: .Normal)
                accountParentAccount.enabled = true
            } else {
                accountParentAccount.setTitle("No parent account", forState: .Normal)
                accountParentAccount.enabled = false
            }
        }
    }
    @IBOutlet weak var accountPhone: UILabel! {
        didSet {
            if let account = account {
                accountPhone.text = account.phoneAccount
            }
        }
    }
    @IBOutlet weak var accountAddress: UILabel! {
        didSet {
            if let account = account {
                accountAddress.text = account.adressAccount
            }
        }
    }
    
    // MARK: - model variables
    var parentAccount: AccountModel! {
        didSet {
            accountParentAccount?.setTitle(parentAccount.nameAccount, forState: .Normal)
        }
    }
    
    var account: AccountModel! {
        didSet {
            updateUI()
            searchForKeyContacts()
            searchForTopDeals()
        }
    }
    
    var contacts: [ContactModel]! {
        didSet {
            keyContacts?.reloadData()
        }
    }
    
    var deals: [OpportunityModel]! {
        didSet {
            topDeals?.reloadData()
        }
    }
    // MARK: - functions to update UI
    func updateUI() {
        accountName?.text = account.nameAccount ?? ""
        accountShortName?.text = account.shortNameAccount
        accountType?.text = account.statusAccount
        accountWebsite?.setTitle(account.websiteAccount, forState: .Normal)
        accountPhone?.text = account.phoneAccount
        accountAddress?.text = account.adressAccount
        var textLabelForParentAccount = ""
        if account.idAccount1 == 0 {
            parentAccount = nil
            textLabelForParentAccount = "No parent account"
        } else {
            parentAccount = AccountDataModel().searchForParentAccount(account: account)
            textLabelForParentAccount = parentAccount.nameAccount
        }
        accountParentAccount?.setTitle(textLabelForParentAccount, forState: .Normal)
    }
    
    func searchForKeyContacts() {
        self.contacts = ContactDataModel().contactsOfAccount(account: account)
    }
    
    func searchForTopDeals() {
        self.deals = OpportunityDataModel().opportunitiesOfAccount(account: account)
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let observer = cookieForKeyboardAppears {
            center.removeObserver(observer)
        }
        if let observer = cookieForKeyboardDisappears {
            center.removeObserver(observer)
        }
    }
    
    // MARK: - keyboard notifications
    
    var cookieForKeyboardAppears: NSObjectProtocol!
    var cookieForKeyboardDisappears: NSObjectProtocol!
    let center = NSNotificationCenter.defaultCenter()
    let queue = NSOperationQueue.mainQueue()
    
    func registerForKeyboardNotifications() {
        cookieForKeyboardAppears = center.addObserverForName(UIKeyboardDidShowNotification, object: nil, queue: queue, usingBlock: { notification in
            self.keyBoardWasShown(notification)
        })
        cookieForKeyboardDisappears = center.addObserverForName(UIKeyboardDidHideNotification, object: nil, queue: queue, usingBlock: { notification in
            self.keyboardWillBeHidden(notification)
        })
    }
    func keyBoardWasShown(aNotification: NSNotification) {
        println("je vois que le keyboard est apparu")
        if let info: NSDictionary = aNotification.userInfo {
            if let kbSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue().size {
                println(kbSize)
                let contentInset = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
                let scrollView = self.scrollView
                println(scrollView.contentInset)
                scrollView.contentInset = contentInset
                scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    func keyboardWillBeHidden(aNotification: NSNotification) {
        println("le keyboard a disparu")
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - tableViewDataSource
    
    @IBOutlet weak var keyContacts: UITableView!
    @IBOutlet weak var topDeals: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == keyContacts {
            return contacts.count
        }
        else if tableView == topDeals {
            return deals.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == keyContacts {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellContact") as UITableViewCell
            cell.textLabel?.text = contacts[indexPath.row].firstNameContact + " " + contacts[indexPath.row].lastNameContact
            cell.detailTextLabel?.text = contacts[indexPath.row].typeContact
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellDeals") as UITableViewCell
            cell.textLabel?.text = deals[indexPath.row].nomOpportunite
            cell.detailTextLabel?.text = deals[indexPath.row].contractValueOpportunite + "€"
            return cell
        }
        
    }
    
    // MARK: - tableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
}
