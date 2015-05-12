//
//  ContactsOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 16/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactsOfAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    var actionOnContacts = "Update"

    @IBOutlet weak var widthBetweenComponents: NSLayoutConstraint!
    @IBOutlet weak var heightBeforeBottom: NSLayoutConstraint!
    
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
    
    @IBOutlet weak var accessLinkedinProfile: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var account: AccountModel!
    var viewDidItsLayouts = false
    var contacts: [ContactModel] = []
    var contactSelected = ContactModel()
    
    
    let widthPopover = CGFloat(800)
    let heightPopover = CGFloat(800)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contacts = ContactDataModel().contactsOfAccount(account: account)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.selectRowAtIndexPath(indexPath, animated: false, scrollPosition: UITableViewScrollPosition.None)
        tableView(self.tableView, didSelectRowAtIndexPath: indexPath)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayouts {
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
        if contacts.count != 0 {
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
    
    @IBAction func addAContact(sender: UIBarButtonItem) {
        self.actionOnContacts = "Create"
        self.civilityContact.text = ""
        self.civilityContact.borderStyle = UITextBorderStyle.RoundedRect
        self.firstAndLastNameContact.text = ""
        self.firstAndLastNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.firstNameContact.text = ""
        self.firstNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.lastNameContact.text = ""
        self.lastNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.jobTitleContact.text = ""
        self.jobTitleContact.borderStyle = UITextBorderStyle.RoundedRect
        self.countryContact.text = ""
        self.countryContact.borderStyle = UITextBorderStyle.RoundedRect
        self.typeContact.text = ""
        self.typeContact.borderStyle = UITextBorderStyle.RoundedRect
        self.birthdateContact.text = ""
        self.birthdateContact.borderStyle = UITextBorderStyle.RoundedRect
        self.phoneBusinessContact.text = ""
        self.phoneBusinessContact.borderStyle = UITextBorderStyle.RoundedRect
        self.phoneMobileContact.text = ""
        self.phoneMobileContact.borderStyle = UITextBorderStyle.RoundedRect
        self.emailContact.text = ""
        self.emailContact.borderStyle = UITextBorderStyle.RoundedRect
        self.preferredLanguageContact.text = ""
        self.preferredLanguageContact.borderStyle = UITextBorderStyle.RoundedRect
        self.workingAdressContact.text = ""
        self.workingAdressContact.layer.cornerRadius = 4
        self.workingAdressContact.layer.borderWidth = 1
        self.workingAdressContact.layer.borderColor = UIColor.grayColor().CGColor
        self.linkedinProfileContact.text = ""
        self.linkedinProfileContact.borderStyle = UITextBorderStyle.RoundedRect
        self.idContact1.text = ""
        self.idContact1.borderStyle = UITextBorderStyle.RoundedRect
        
        self.accessLinkedinProfile.hidden = true
       
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show linkedin account of contact" {
            if let linkedinView = segue.destinationViewController as? LinkedinContactOfAccountViewController {
                var minimumSize = UIScreen.mainScreen().bounds
                minimumSize = minimumSize.rectByInsetting(dx: 100, dy: 0)
                linkedinView.linkedinAccount = self.contactSelected.linkedinProfileContact
                linkedinView.preferredContentSize = minimumSize.size
            }
        }
    }
    
}
