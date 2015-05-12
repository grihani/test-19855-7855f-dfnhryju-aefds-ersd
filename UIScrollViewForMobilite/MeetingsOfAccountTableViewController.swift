//
//  MeetingsOfAccountTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 04/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfAccountTableViewController: UITableViewController {

    // MARK: - Variables
    var meetings: [MeetingModel]! {
        didSet {
            tableView.reloadData()
        }
    }
    var account: AccountModel! {
        didSet {
            if account != nil {
                meetings = MeetingDataModel().meetingsOfAccount(account: account)
            }
        }
    }
    
    // MARK: - Constants
    let dateFormatter = NSDateFormatter()
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 01
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if meetings != nil {
        return meetings.count
        }
        else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("meetings of Account", forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = meetings[row].subjectMeeting
        cell.detailTextLabel?.text = fromSQLiteDateToFullyCustomizedDateOnSwift(meetings[row].dateBeginMeeting)

        return cell
    }

    func fromSQLiteDateToFullyCustomizedDateOnSwift(date: String) -> String {
        var customDateString = ""
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateFromString = dateFormatter.dateFromString(date)
        if dateFromString != nil {
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            dateFormatter.timeStyle = .ShortStyle
            customDateString = dateFormatter.stringFromDate(dateFromString!)
        } else {
            customDateString = "Please contact the developper"
        }
        return customDateString
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show meeting details" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                let destinationViewController = segue.destinationViewController as MeetingsDetailViewController
                destinationViewController.meeting = meetings[indexPath.row]
            }
        }
    }
    

}
