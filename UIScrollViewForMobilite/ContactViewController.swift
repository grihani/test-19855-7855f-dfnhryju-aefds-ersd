//
//  ContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 27/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    var idUser: Int = 0

    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts: [ContactModel] = []
    var filteredContacts: [ContactModel] = []
    var searchActive: Bool = false
    
    var resultSearchController: UISearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var userModel = UserDataModel().getUserWithIdUser(idUser)
        contacts = UserContactDataModel().contactOfUser(userModel.idUser)
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            self.contactsTableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        contactsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return self.filteredContacts.count
        } else {
            return self.contacts.count
        }
    }
    
    // MARK: - TableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCellWithIdentifier("contactCell") as UITableViewCell
        var contact: ContactModel
        let row = indexPath.row
        if self.resultSearchController.active {
            contact = filteredContacts[row]
        } else {
            contact = contacts[row]
        }
        cell.textLabel?.text = contact.lastNameContact + " " + contact.firstNameContact
        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filteredContacts.removeAll(keepCapacity: false)
        let name = searchController.searchBar.text
        filteredContacts = UserContactDataModel().contactWithLastNameOrFirstName(name, firstName: name)
        contactsTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        contactsTableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let contactSelec = contacts[row]
        println("nom: \(contactSelec.lastNameContact)")
        println("prénom: \(contactSelec.firstNameContact)")
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        var keys: [String] = []
        for contact in contacts {
            keys.append(contact.lastNameContact)
        }
        return keys
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
