//
//  TasksOfAccountV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 05/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class TasksOfAccountV2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets for collapsing and expanding tableviews
    @IBOutlet weak var topHeight: NSLayoutConstraint!
    @IBOutlet weak var midHeight: NSLayoutConstraint!
    @IBOutlet weak var botHeight: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tasksOfAccounts: UITableView!{
        didSet{
            tasksOfAccounts.delegate = self
            tasksOfAccounts.dataSource = self
        }
    }
    @IBOutlet weak var tasksOfContacts: UITableView!
    @IBOutlet weak var tasksOfMeetings: UITableView!
    
    
    // MARK: - Variables
    var account: AccountModel!
    var chosenTask: TaskModel!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOfTasksOfAccounts = TaskDataModel().tasksOfAccountAsArray(account: self.account)
        for dictionary in collectionOfTasksOfAccounts {
            if let dictionary = dictionary as? [String: [TaskModel]] {
                for nameSection in dictionary.keys {
                    statusTasksOfAccounts.append(nameSection)
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var heightOfExpandedView: CGFloat = 0
    var viewDidItsLayoutForExpandedTableView = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !viewDidItsLayoutForExpandedTableView {
            println("viewDidLayoutSubviews")
            heightOfExpandedView = containerView.frame.size.height - 88
            topHeight.constant = heightOfExpandedView
            midHeight.constant = 44
            botHeight.constant = 44
            containerView.layoutIfNeeded()
            viewDidItsLayoutForExpandedTableView = true
        }
    }
    
    // MARK: - IBActions for collapsing and expanding the tableViews
    @IBAction func tapTop(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = self.heightOfExpandedView
            self.midHeight.constant = 44
            self.botHeight.constant = 44
            self.containerView.layoutIfNeeded()
            }, completion: nil)
    }
    @IBAction func tapMid(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = 44
            self.midHeight.constant = self.heightOfExpandedView
            self.botHeight.constant = 44
            self.containerView.layoutIfNeeded()
            }, completion: nil)
    }
    @IBAction func tapBot(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = 44
            self.midHeight.constant = 44
            self.botHeight.constant = self.heightOfExpandedView
            self.containerView.layoutIfNeeded()
            }, completion: nil)
    }
    
    //MARK: - TableviewDataSource
    var collectionOfTasksOfAccounts: NSMutableArray = NSMutableArray()
    var statusTasksOfAccounts: [String] = []
    var chosenTaskOfAccount: TaskModel = TaskModel()
    let dateFormatter =  NSDateFormatter()
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tasksOfAccounts {
            return statusTasksOfAccounts[section]
        }
        return ""
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if tableView == tasksOfAccounts {
        return statusTasksOfAccounts.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tasksOfAccounts {
            if let dictionary: NSDictionary = collectionOfTasksOfAccounts.objectAtIndex(section) as? NSDictionary {
                let key = statusTasksOfAccounts[section]
                if let tasksOfSection = dictionary.objectForKey(key) as? [TaskModel] {
                    return tasksOfSection.count
                }
            }
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == tasksOfAccounts {
            let cell = tableView.dequeueReusableCellWithIdentifier("tasks of accounts", forIndexPath: indexPath) as UITableViewCell
            let section = indexPath.section
            let row = indexPath.row
            if let dictionary: NSDictionary = collectionOfTasksOfAccounts.objectAtIndex(section) as? NSDictionary {
                
                
                let key = statusTasksOfAccounts[section]
                if let tasksOfSection = dictionary.objectForKey(key) as? [TaskModel] {
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let date: NSDate = dateFormatter.dateFromString(tasksOfSection[row].dateTask)!
                    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
                    dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                    let stringFromDate = dateFormatter.stringFromDate(date)
                    cell.textLabel?.text = stringFromDate + " : " + tasksOfSection[row].subjectTask
                }
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath) as UITableViewCell
            return cell
        }
    }
    
    //MARK: - TableviewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
