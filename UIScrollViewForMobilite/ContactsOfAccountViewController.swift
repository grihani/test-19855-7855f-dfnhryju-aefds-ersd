//
//  ContactsOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 16/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactsOfAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var widthBetweenComponents: NSLayoutConstraint!
    
    @IBOutlet weak var civilityContact: UITextField!
    @IBOutlet weak var firstAndLastNameContact: UITextField!
    @IBOutlet weak var firstNameContact: UITextField!
    @IBOutlet weak var lastNameContact: UITextField!
    @IBOutlet weak var jobTitleContact: UITextField!
    @IBOutlet weak var countryContact: UITextField!
    @IBOutlet weak var typeContact: UITextField!
    @IBOutlet weak var birthdateContact: UITextField!
    @IBOutlet weak var phoneBusinessContact: UITextField!
    @IBOutlet weak var phoneMobileContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var preferredLanguageContact: UITextField!
    @IBOutlet weak var workingAdressContact: UITextView!
    @IBOutlet weak var linkedinProfileContact: UITextField!
    @IBOutlet weak var idContact1: UITextField!
    
    
    
    
    var account: AccountModel!
    var viewDidItsLayouts = false
    var contacts: [ContactModel] = []
    var contactSelected = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contacts = ContactDataModel().contactsOfAccount(account: account)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayouts {
            let screen = UIScreen.mainScreen().bounds
            let widthScreen = screen.size.width
            let widthBetweenLeftRightComponents = widthScreen - 750
            widthBetweenComponents.constant = widthBetweenLeftRightComponents
            self.view.setNeedsUpdateConstraints()
            viewDidItsLayouts = true
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellForContact") as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = contacts[row].lastNameContact + " " + contacts[row].firstNameContact
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.contactSelected = contacts[indexPath.row]
        self.civilityContact.text = contactSelected.civilityContact
        self.firstAndLastNameContact.text = contactSelected.firstNameContact + " " + contactSelected.lastNameContact
        self.firstNameContact.text = contactSelected.firstNameContact
        self.lastNameContact.text = contactSelected.lastNameContact
        self.jobTitleContact.text = contactSelected.jobTitleContact
        self.countryContact.text = contactSelected.countryContact
        self.typeContact.text = contactSelected.typeContact
        self.birthdateContact.text = contactSelected.birthdateContact
        self.phoneBusinessContact.text = contactSelected.phoneBusinessContact
        self.phoneMobileContact.text = contactSelected.phoneMobileContact
        self.emailContact.text = contactSelected.emailContact
        self.preferredLanguageContact.text = contactSelected.preferredLanguageContact
        self.workingAdressContact.text = contactSelected.workingAdressContact
        self.linkedinProfileContact.text = contactSelected.linkedinProfileContact
        self.idContact1.text = String(contactSelected.idContact1)
    }
    
    
}
