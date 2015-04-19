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
    
    
    
    var account: AccountModel!
    var viewDidItsLayouts = false
    var contacts: [ContactModel] = []
    var contactSelected = ContactModel()
    
    
    let widthPopover = CGFloat(800)
    let heightPopover = CGFloat(800)
    
    
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
            println(screen)
            let widthBetweenLeftRightComponents = widthScreen - 750
            let heightScreen = screen.size.height
            widthBetweenComponents.constant = widthBetweenLeftRightComponents
            heightBeforeBottom.constant = heightScreen - 400
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
    //linkedingContactOfAccount
    
    @IBAction func linkedinAccess(sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        var linkedinAccess: LinkedinContactOfAccountViewController = storyboard.instantiateViewControllerWithIdentifier("linkedingContactOfAccount") as LinkedinContactOfAccountViewController
        linkedinAccess.linkedinAccount = self.contactSelected.linkedinProfileContact
        linkedinAccess.modalPresentationStyle = .Popover
        linkedinAccess.preferredContentSize = CGSizeMake(widthPopover, heightPopover)
        let popoverAddMeetingWithoutDateViewController = linkedinAccess.popoverPresentationController
        popoverAddMeetingWithoutDateViewController?.permittedArrowDirections = .allZeros
        popoverAddMeetingWithoutDateViewController?.delegate = self
        popoverAddMeetingWithoutDateViewController?.sourceView = self.view
        popoverAddMeetingWithoutDateViewController?.sourceRect = CGRectMake(200/2, 100/2, 1, 1)
        self.view.window?.rootViewController?.presentViewController(linkedinAccess, animated: true, completion: nil)
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
        
        heightBeforeBottom.constant = heightBeforeBottom.constant - 100
        self.view.setNeedsUpdateConstraints()
    }
    
}
