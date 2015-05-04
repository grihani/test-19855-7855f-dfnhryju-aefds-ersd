//
//  MeetingsOfAccountTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 04/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfAccountTableViewController: UITableViewController {

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
        cell.detailTextLabel?.text = meetings[row].dateBeginMeeting

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
