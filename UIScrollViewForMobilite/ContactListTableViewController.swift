//
//  ContactListTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias typeAliasSection = [(sectionName: String, contacts: [(ContactModel,String)])]
    var listeTypeAlias: typeAliasSection = []
    var listeAccountName: [(idAccount: Int,nameAccount: String)] = []
    var listeAlphabet: [(String, [(ContactModel,String)])] = []
    var contact: [ContactModel] = []
    
    @IBOutlet weak var segmentedControl: UISegmentedControl! {
        didSet {
            
        }
    }
    @IBOutlet var listContacts: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listeTempAccount = AccountContactDataModel().listeNameAccountOfContact()
        
        for temp in listeTempAccount {
            listeAccountName.append(idAccount: temp.idAccount, nameAccount: temp.nameAccount)
        }
        for account in listeAccountName {
            var contactTemp = ContactDataModel().contactsOfAccountWithIdAccount(idAccount: account.idAccount)
            listeTypeAlias += [(sectionName: account.nameAccount, contacts: contactTemp)]
        }
        
//        listContacts.estimatedRowHeight = listContacts.rowHeight
//        listContacts.rowHeight = UITableViewAutomaticDimension
        listContacts.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return listeAccountName.count
        case 1:
            return listeTypeAlias.count
        case 2:
            return 01
        default:
            return 01
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listeTypeAlias[section].contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        let row = indexPath.row
        let section = indexPath.section
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("cell contact par account", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = listeTypeAlias[section].contacts[row].0.firstNameContact + " " + listeTypeAlias[section].contacts[row].0.lastNameContact
        case 1:
            let cellTemp = tableView.dequeueReusableCellWithIdentifier("cell contact A to Z", forIndexPath: indexPath) as! ContactListTableViewCell
            cellTemp.labelNomPrenom.text = listeTypeAlias[section].contacts[row].0.firstNameContact + " " + listeTypeAlias[section].contacts[row].0.lastNameContact
            cellTemp.labelAccount.text = listeTypeAlias[section].contacts[row].1
            return cellTemp
        case 2:
            let cellTemp = tableView.dequeueReusableCellWithIdentifier("cell contact A to Z", forIndexPath: indexPath) as! ContactListTableViewCell
            cellTemp.labelNomPrenom.text = listeTypeAlias[section].contacts[row].0.firstNameContact + " " + listeTypeAlias[section].contacts[row].0.lastNameContact
            cellTemp.labelAccount.text = listeTypeAlias[section].contacts[row].1
            cell = cellTemp
        default: break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listeTypeAlias[section].sectionName
    }
    
    // MARK: - Navigation
    @IBAction func changeContactList(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let listeTempAccount = AccountContactDataModel().listeNameAccountOfContact()
            listeTypeAlias.removeAll(keepCapacity: false)
            for temp in listeTempAccount {
                listeAccountName.append(idAccount: temp.idAccount, nameAccount: temp.nameAccount)
            }
            for account in listeAccountName {
                var contactTemp = ContactDataModel().contactsOfAccountWithIdAccount(idAccount: account.idAccount)
                listeTypeAlias += [(sectionName: account.nameAccount, contacts: contactTemp)]
            }
            listContacts.reloadData()
        case 1:
            listeAlphabet = ContactDataModel().getListeAlphabet(order: "ASC")
            listeTypeAlias.removeAll(keepCapacity: false)
            for temp in listeAlphabet {
                listeTypeAlias += [(sectionName: temp.0, contacts: temp.1)]
            }
            listContacts.reloadData()
        case 2:
            let contact = ContactDataModel().allContactsFavorite()
            listeTypeAlias.removeAll(keepCapacity: false)
            listeTypeAlias += [(sectionName: "Favoris", contacts: contact)]
            listContacts.reloadData()
        default: break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chosenContactParAccount" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                if let controller = segue.destinationViewController.contentViewController as? DetailContactsViewController {
                    controller.read = true
                    controller.update = false
                    controller.create = false
                    controller.delete = false
                    let row = indexPath.row
                    let section = indexPath.section
                    controller.contact = listeTypeAlias[section].contacts[row].0
                    controller.account = AccountDataModel().accountOfContact(contact: controller.contact)
                    println("Contact choisit : \(controller.contact)")
                    println()
                }
            }
        } else if segue.identifier == "chosenContactAtoZ" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                if let controller = segue.destinationViewController.contentViewController as? DetailContactsViewController {
                    controller.read = true
                    controller.update = false
                    controller.create = false
                    controller.delete = false
                    let row = indexPath.row
                    let section = indexPath.section
                    controller.contact = listeTypeAlias[section].contacts[row].0
                    controller.account = AccountDataModel().accountOfContact(contact: controller.contact)
                }
            }
        }
    }
}

class ContactListTableViewCell: UITableViewCell {
    @IBOutlet weak var labelNomPrenom: UILabel!
    @IBOutlet weak var labelAccount: UILabel!
}
