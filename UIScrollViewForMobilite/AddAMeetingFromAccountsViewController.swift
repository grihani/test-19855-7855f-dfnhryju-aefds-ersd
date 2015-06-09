//
//  AddAMeetingFromAccountsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 11/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class AddAMeetingFromAccountsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets used for animation
    
    @IBOutlet weak var heightOfDatePicker: NSLayoutConstraint!
    @IBOutlet weak var heightOfDurationPicker: NSLayoutConstraint!
    @IBOutlet weak var endOfMeetingLabel: UILabel!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var dateButtonDisplay: UIButton! {didSet{
            dateButtonDisplay.setTitle(fromdatePickerDateToFullyCustomizedDateOnSwift(chosenDate), forState: .Normal)
        }}
    @IBOutlet weak var datePicker: UIDatePicker! {didSet{
            datePicker.date = chosenDate
        }}
    
    @IBOutlet weak var dateEndButtonDisplay: UIButton! {
        didSet {
            dateEndButtonDisplay.setTitle(fromdatePickerDateToFullyCustomizedDateOnSwift(chosenEndDate), forState: .Normal)
        }}
    
    @IBOutlet weak var dateEndPicker: UIDatePicker! {didSet{
            dateEndPicker.minimumDate = chosenDate
        }}
    
    @IBOutlet weak var contactsTableView: UITableView! {didSet{
            contactsTableView.dataSource = self
            contactsTableView.delegate = self
            contactsTableView.editing = true
        }}
    
    @IBOutlet weak var allContactsTableView: UITableView! {
        didSet {
            allContactsTableView.dataSource = self
            allContactsTableView.delegate = self
            allContactsTableView.hidden = true
            allContactsTableView.editing = true
        }
    }
    
    // MARK: - Model
    
    var account: AccountModel!
    
    var accountContacts: [ContactModel]! = []
    
    var allContacts = ContactDataModel().allContacts()
    
    // MARK: - Variables
    
    var chosenDate: NSDate = NSDate() {didSet{
            dateButtonDisplay?.setTitle(fromdatePickerDateToFullyCustomizedDateOnSwift(chosenDate), forState: .Normal)
            datePicker?.date = chosenDate
            dateEndPicker?.date = chosenDate
            chosenEndDate = chosenDate
        }}
    
    var chosenEndDate: NSDate = NSDate() {didSet{
            dateEndButtonDisplay?.setTitle(fromdatePickerDateToFullyCustomizedDateOnSwift(chosenEndDate), forState: .Normal)
            dateEndPicker?.minimumDate = chosenDate
        }}
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        heightOfDatePicker.constant = 0
        heightOfDurationPicker.constant = 0
        datePicker.alpha = 0
        dateEndPicker.alpha = 0
        view.layoutIfNeeded()
        registerForKeyboardNotifications()
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
    
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let pageScrollViewSize = scrollViewContainer.frame.size
        
        scrollViewContainer.contentSize = CGSize(width: pageScrollViewSize.width, height: pageScrollViewSize.height)
        containerView.frame = CGRectMake(0, 0, pageScrollViewSize.width, pageScrollViewSize.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - datePickerMethods
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        let date = sender.date
        chosenDate = date
    }

    @IBAction func dateEndChanged(sender: UIDatePicker) {
        let date = sender.date
        chosenEndDate = date
    }
    
    // MARK: - Buttons actions
    
    var hiddenDatePicker = true
    @IBAction func dateClicked(sender: UIButton) {
        if hiddenDatePicker {
            heightOfDatePicker.constant = 162
            self.datePicker.alpha = 1
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            hiddenDatePicker = false
        } else {
            heightOfDatePicker.constant = 0
            self.datePicker.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            hiddenDatePicker = true
        }
    }
    
    var hiddenDateEndPicker = true
    @IBAction func durationClicked(sender: UIButton) {
        if hiddenDateEndPicker {
            heightOfDurationPicker.constant = 162
            dateEndPicker.alpha = 1
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            hiddenDateEndPicker = false
        } else {
            heightOfDurationPicker.constant = 0
            dateEndPicker.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
            hiddenDateEndPicker = true
        }
    }
    
    // MARK: - Switch actions
    
    @IBOutlet weak var containerViewForDurationOfMeeting: UIView!
    @IBAction func wholeDayToggled(sender: UISwitch) {
        if sender.on {
            dateEndButtonDisplay.hidden = true
            endOfMeetingLabel.hidden = true
            containerViewForDurationOfMeeting.hidden = true
        } else {
            dateEndButtonDisplay.hidden = false
            endOfMeetingLabel.hidden = false
            containerViewForDurationOfMeeting.hidden = false
        }
    }
    
    // MARK: - barButtonItem actions
    @IBAction func saveMeeting(sender: UIBarButtonItem) {
        // Ajouter le meeting
        
        // Dismiss the popoverView
        self.presentingViewController?.contentViewController.presenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelAddingMeeting(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.presenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var contactsOfAccountBarButtonItem: UIBarButtonItem! {
        didSet {
            contactsOfAccountBarButtonItem.enabled = false
        }
    }
    @IBAction func findContactsOfAccount(sender: UIBarButtonItem) {
        allContactsBarButtonItem.enabled = true
        contactsOfAccountBarButtonItem.enabled = false
        allContactsTableView.hidden = true
        contactsTableView.hidden = false
    }
    
    @IBOutlet weak var allContactsBarButtonItem: UIBarButtonItem!
    
    @IBAction func findAllContacts(sender: UIBarButtonItem) {
        allContactsBarButtonItem.enabled = false
        contactsOfAccountBarButtonItem.enabled = true
        allContactsTableView.hidden = false
        contactsTableView.hidden = true
    }
    
    
    // MARK: - TableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == allContactsTableView {
            return allContacts.count
        } else if tableView == contactsTableView {
            return accountContacts.count
        }
        return 0
    }
    
    private struct cells {
        static let cellIdentifierForContactsOfAccount = "cell for contacts"
        static let cellIdentifierForAllContacts = "all contacts "
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == allContactsTableView {
            let cell = tableView.dequeueReusableCellWithIdentifier(cells.cellIdentifierForAllContacts, forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = allContacts[indexPath.row].firstNameContact + " " + allContacts[indexPath.row].lastNameContact
            return cell
        } else if tableView == contactsTableView {
            let cell = tableView.dequeueReusableCellWithIdentifier(cells.cellIdentifierForContactsOfAccount, forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = accountContacts[indexPath.row].firstNameContact + " " + accountContacts[indexPath.row].lastNameContact
            return cell
        }
        return UITableViewCell()
    }

    // MARK: - Functions

    let dateFormatter = NSDateFormatter()
    func fromdatePickerDateToFullyCustomizedDateOnSwift(date: NSDate) -> String {
        var customDateString = ""
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        customDateString = dateFormatter.stringFromDate(date)
        
        return customDateString
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
                let scrollView = self.scrollViewContainer
                println(scrollView.contentInset)
                scrollView.contentInset = contentInset
                scrollView.scrollIndicatorInsets = contentInset
            }
        }
    }
    func keyboardWillBeHidden(aNotification: NSNotification) {
        println("le keyboard a disparu")
        let contentInsets = UIEdgeInsetsZero
        scrollViewContainer.contentInset = contentInsets
        scrollViewContainer.scrollIndicatorInsets = contentInsets
    }
}
