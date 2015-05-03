//
//  DetailAccountsV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 28/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailAccountsV2ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    var account: AccountModel! {
        didSet {
            
        }
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
            return 3
        }
        else if tableView == topDeals {
            return 5
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellContact") as UITableViewCell
        cell.textLabel?.text = String(indexPath.row)
        cell.detailTextLabel?.text = String(indexPath.section)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    
}
