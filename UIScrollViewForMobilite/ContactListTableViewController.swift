//
//  ContactListTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {

    var contact: [ContactModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contact = ContactDataModel().allContacts()
        println("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellContact", forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = contact[row].civilityContact + " " + contact[row].firstNameContact + " " + contact[row].lastNameContact
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chosenContact" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                if let controller = segue.destinationViewController.contentViewController as? ContactDetailsViewController {
                    controller.read = true
                    controller.update = false
                    controller.create = false
                    controller.delete = false
                    controller.contact = contact[indexPath.row]
                }
            }
        }
        else if segue.identifier == "createContact" {
            if let controller = segue.destinationViewController.contentViewController as? ContactDetailsViewController {
                controller.read = false
                controller.update = false
                controller.create = true
                controller.delete = false
            }
        }
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
