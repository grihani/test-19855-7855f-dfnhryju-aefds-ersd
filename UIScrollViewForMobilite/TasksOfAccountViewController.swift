//
//  TasksOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 20/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class TasksOfAccountViewController: UIViewController, UITableViewDelegate, UIPopoverPresentationControllerDelegate {

    var account: AccountModel!
    var tasksOfAccounts = TasksOfAccounts()
    var tasksOfContacts = TasksOfContacts()
    var tasksOfMeetings = TasksOfMeetings()
    @IBOutlet weak var tasksOfAccountsTableView: UITableView!
    @IBOutlet weak var tasksOfContactsTableView: UITableView!
    @IBOutlet weak var tasksOfMeetingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tasksOfAccounts.account = self.account
        tasksOfAccounts.collectionOfTasks = TaskDataModel().tasksOfAccountAsArray(account: self.account)
        for dictionary in tasksOfAccounts.collectionOfTasks {
            if let dictionary = dictionary as? [String: [TaskModel]] {
                for nameSection in dictionary.keys {
                    tasksOfAccounts.statusTasks.append(nameSection)
                }
            }
        }
//        tasksOfAccounts.container = self
        tasksOfAccountsTableView.dataSource = tasksOfAccounts
        tasksOfAccountsTableView.delegate = self
        
        
        tasksOfContacts.contacts = ContactDataModel().contactsOfAccount(account: self.account)
        tasksOfContacts.collectionOfTasks = TaskDataModel().tasksOfContactsAsArray(account: self.account)
        tasksOfContactsTableView.delegate = tasksOfContacts
        tasksOfContactsTableView.dataSource = tasksOfContacts
        
        tasksOfMeetings.meetings = MeetingDataModel().meetingsOfAccount(account: self.account)
        tasksOfMeetings.collectionOfTasks = TaskDataModel().tasksOfMeetingsAsArray(account: self.account)
        tasksOfMeetingsTableView.delegate = tasksOfMeetings
        tasksOfMeetingsTableView.dataSource = tasksOfMeetings
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == tasksOfAccountsTableView {
            let row = indexPath.row
            let section = indexPath.section
            if let dictionary = tasksOfAccounts.collectionOfTasks.objectAtIndex(section) as? NSDictionary {
                let key = tasksOfAccounts.statusTasks[section]
                if let tasksOfSection = dictionary.objectForKey(key) as? [TaskModel] {
                    tasksOfAccounts.chosenTask = tasksOfSection[row]
                    println(tasksOfSection[row].arrayFromModel())
                                    self.performSegueWithIdentifier("trialPopoverFromOtherClass", sender: self)
                }
            }
        }
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "trialPopoverFromOtherClass" {
            if let ppc = segue.destinationViewController as? TaskDetailsOfAccountViewController {
                ppc.task = tasksOfAccounts.chosenTask
            }
        }
    }

}

class TasksOfAccounts: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var account: AccountModel = AccountModel()
    var collectionOfTasks: NSMutableArray = NSMutableArray()
    var statusTasks: [String] = []
    var chosenTask: TaskModel = TaskModel()
//    var container: TasksOfAccountViewController = TasksOfAccountViewController()
    
    let dateFormatter =  NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return statusTasks[section]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            let key = statusTasks[section]
            if let tasksOfSection = dictionary.objectForKey(key) as? [TaskModel] {
                return tasksOfSection.count
            }
        }
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return statusTasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasks of accounts") as UITableViewCell
        let section = indexPath.section
        let row = indexPath.row
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            
            
            let key = statusTasks[section]
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
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        if let dictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            let key = statusTasks[section]
            if let tasksOfSection = dictionary.objectForKey(key) as? [TaskModel] {
                self.chosenTask = tasksOfSection[row]
                println(tasksOfSection[row].arrayFromModel())
//                self.container.performSegueWithIdentifier("trialPopoverFromOtherClass", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "trialPopoverFromOtherClass" {
            if let ppc = segue.destinationViewController as? TaskDetailsOfAccountViewController                                                                                                                                                                            {
                println("trying to pass a segue")
            }
            
        }
    }
}

class TasksOfContacts: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts: [ContactModel] = []
    var collectionOfTasks: NSMutableArray = NSMutableArray()
    
    let dateFormatter =  NSDateFormatter()
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var keyAsString = ""
        var contact = ContactModel()
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
        }
        if let idContact = keyAsString.toInt()? {
            contact = ContactDataModel().contactFromIdContact(idContact: idContact)
        }
        
        return contact.civilityContact + " " + contact.firstNameContact + " " + contact.lastNameContact
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var keyAsString = ""
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
            if let tasksOfSection = dictionary.objectForKey(keyAsString) as? [TaskModel] {
                return tasksOfSection.count
            }
        }
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return collectionOfTasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasks of contacts") as UITableViewCell
        let section = indexPath.section
        let row = indexPath.row
        var keyAsString = ""
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
            
            if let tasksOfSection = dictionary.objectForKey(keyAsString) as? [TaskModel] {
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
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
}

class TasksOfMeetings: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var meetings: [MeetingModel] = []
    var collectionOfTasks: NSMutableArray = NSMutableArray()
    
    let dateFormatter =  NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var meeting = MeetingModel()
//        var keyAsString = ""
//        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
//            
//            for key in dictionary.allKeys as [String] {
//                keyAsString = key
//            }
//        }
//        if let idMeeting = keyAsString.toInt() {
//            meeting = MeetingDataModel().meetingFromIdMeeting(idMeeting: idMeeting)
//        }
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        let dateMeeting = dateFormatter.dateFromString(meeting.dateBeginMeeting)
//        dateFormatter.dateStyle = .MediumStyle
//        dateFormatter.timeStyle = .ShortStyle
//        let stringFromDateMeeting = dateFormatter.stringFromDate(dateMeeting!)
//        var stringFromMeeting = stringFromDateMeeting + " : "
//        stringFromMeeting += meeting.subjectMeeting
//        return stringFromMeeting
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var keyAsString = ""
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
            if let tasksOfSection = dictionary.objectForKey(keyAsString) as? [TaskModel] {
                return tasksOfSection.count
            }
        }
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return collectionOfTasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasks of meetings") as UITableViewCell
        let section = indexPath.section
        let row = indexPath.row
        var keyAsString = ""
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
            println(keyAsString)
            if let tasksOfSection = dictionary.objectForKey(keyAsString) as? [TaskModel] {
                println(tasksOfSection[row])
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
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(44)
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var meeting = MeetingModel()
        var keyAsString = ""
        if let dictionary: NSDictionary = collectionOfTasks.objectAtIndex(section) as? NSDictionary {
            
            for key in dictionary.allKeys as [String] {
                keyAsString = key
            }
        }
        if let idMeeting = keyAsString.toInt() {
            meeting = MeetingDataModel().meetingFromIdMeeting(idMeeting: idMeeting)
        }
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateMeeting = dateFormatter.dateFromString(meeting.dateBeginMeeting)
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        let stringFromDateMeeting = dateFormatter.stringFromDate(dateMeeting!)
        var stringFromMeeting = stringFromDateMeeting + " :\n "
        stringFromMeeting += meeting.subjectMeeting
        
        var label = UILabel()
        label.numberOfLines = 2
        label.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        label.text = stringFromMeeting
        return label
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
}