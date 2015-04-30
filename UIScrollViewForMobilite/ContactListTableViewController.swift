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
    
    // MARK: - view life cycle
    
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
    
    // MARK: - Navigation
    
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

}
