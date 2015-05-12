//
//  ParticipantsOfMeetingOfAccountTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 12/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ParticipantsOfMeetingOfAccountTableViewController: UITableViewController {
    
    var meeting: MeetingModel! {
        didSet {
            contactParticipants = ContactDataModel().contactsOfMeeting(meeting: meeting)
        }
    }
    
    var contactParticipants: [ContactModel]! = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Participants"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactParticipants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contacts", forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = contactParticipants[row].lastNameContact + " " + contactParticipants[row].firstNameContact
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show details of contact" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                let destinationViewController = segue.destinationViewController as DetailsOfParticipantsOfMeetingsViewController
                destinationViewController.contact = contactParticipants[indexPath.row]
            }
        }
    }
    

}
