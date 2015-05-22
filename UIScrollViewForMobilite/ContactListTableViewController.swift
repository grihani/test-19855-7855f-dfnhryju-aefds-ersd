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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet var listContacts: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contact = ContactDataModel().allContacts()
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
    @IBAction func changeContactList(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            println("contacts par accounts")
            contact = ContactDataModel().contactsPerAccounts()
        case 1:
            if segmentedControl.titleForSegmentAtIndex(1) == "A -> Z" {
                segmentedControl.removeSegmentAtIndex(1, animated: true)
                println("contact ordre ascendant")
                contact = ContactDataModel().allContactsWithOrder(order: "ASC")
//                segmentedControl.setTitle("A -> Z", forSegmentAtIndex: 1)
                segmentedControl.insertSegmentWithTitle("Z -> A", atIndex: 1, animated: true)
                var subview: AnyObject = segmentedControl.subviews[1]
//                subview.backgroundColor = UIColor.blueColor()
            } else {
                segmentedControl.removeSegmentAtIndex(1, animated: true)
                println("contact ordre descendant")
                contact = ContactDataModel().allContactsWithOrder(order: "DESC")
//                segmentedControl.setTitle("Z -> A", forSegmentAtIndex: 1)
                segmentedControl.insertSegmentWithTitle("A -> Z", atIndex: 1, animated: true)
            }
        case 2:
            println("contact ordre favoris")
            contact = ContactDataModel().allContactsFavorite()
        default: break
        }
        listContacts.reloadData()
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("createContact", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chosenContact" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                if let controller = segue.destinationViewController.contentViewController as? DetailContactsViewController {
                    controller.read = true
                    controller.update = false
                    controller.create = false
                    controller.delete = false
                    controller.contact = contact[indexPath.row]
                    println("Contact choisit : \(controller.contact)")
                    println()
                }
            }
        }
        else if segue.identifier == "createContact" {
            if let controller = segue.destinationViewController.contentViewController as? DetailContactsViewController {
                controller.read = false
                controller.update = false
                controller.create = true
                controller.delete = false
                println("création d'un contact")
                println()
            }
        }
    }
}
