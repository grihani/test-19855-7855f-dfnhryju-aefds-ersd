//
//  ContactDetailsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    
    @IBOutlet weak var accountDetails: UILabel!
    var account: AccountModel! {
        didSet {
            accountDetails.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
        }
    }
    
    var idContact: Int = 0
    var jobTitleContact: String = ""
    var countryContact: String = ""
    var civilityContact: String = ""
    var firstNameContact: String = ""
    var lastNameContact: String = ""
    var typeContact: String = ""
    var birthdateContact: String = ""
    var phoneBusinessContact: String = ""
    var phoneMobileContact: String = ""
    var emailContact: String = ""
    var preferredLanguageContact: String = ""
    var workingAdressContact: String = ""
    var linkedinProfileContact: String = ""
    var idContact1: Int = 0
    
    var cellContact : ContactCell! {
        didSet {
            updateUI()
        }
    }
    @IBOutlet weak var accountOfContact: UIButton!
    @IBOutlet weak var statusSave: UILabel!
    
//    @IBOutlet weak var contactCell: ContactCell!
    var contact: ContactModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        println("contact was set")
        cellContact.contact = self.contact
    }
    
    // Mark: - tableview data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("cellForRowAtIndexPath")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        let cell = tableView.dequeueReusableCellWithIdentifier("cellForShowingcontact") as ContactCell
        cell.contact = contact
        cellContact = cell
        return cell
        
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        println("hello World")
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "civility of contact" {
            if let civilityView = segue.destinationViewController as? CivilityPickerViewController {
                civilityView.civilityButton = cellContact.civilityContact
                civilityView.civilityContact = self.civilityContact
                if let ppc = civilityView.popoverPresentationController {
                    let minimumSize = civilityView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    civilityView.preferredContentSize = minimumSize
                }
            }
        }
        else if segue.identifier == "birthday of contact" {
            if let birthdayView = segue.destinationViewController as? BirthDayPickerOfContactViewController {
                birthdayView.date = cellContact.birthdateContact
                birthdayView.birthdateContact = self.birthdateContact
                if let ppc = birthdayView.popoverPresentationController {
                    let minimumSize = birthdayView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    birthdayView.preferredContentSize = minimumSize
                    
                }
            }
        }
        else if segue.identifier == "country of contact" {
            if let countryView = segue.destinationViewController as? CountryPickerOfContactViewController {
                if let ppc = countryView.popoverPresentationController {
                    let minimumSize = countryView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    countryView.preferredContentSize = minimumSize
                    countryView.countryContact = self.countryContact
                    countryView.chosenCountryButton = cellContact.countryContact
                }
            }
        }
        else if segue.identifier == "linkedin of contact" {
            if let linkedinView = segue.destinationViewController as? LinkedinOfContactViewController {
                if self.linkedinProfileContact == "" {
                    linkedinProfileContact = "https://www.linkedin.com/vsearch/f?type=all&keywords=&orig=GLHD&rsid=&pageKey=oz-winner&trkInfo=&search=Search"
                }
                linkedinView.linkedinProfileContact = self.linkedinProfileContact
                linkedinView.linkedinProfileContactButton = cellContact.linkedinProfileContact
                if let ppc = linkedinView.popoverPresentationController {
                    let maximumSize = linkedinView.view.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
                    let width: CGFloat = 921
                    linkedinView.preferredContentSize = CGSize(width: width, height: maximumSize.height)
                }
            }
        }
        else if segue.identifier == "preferred language of contact" {
            if let preferredLanguageView = segue.destinationViewController as? PreferredLanguageOfContactViewController {
                preferredLanguageView.preferredLanguageContact = self.preferredLanguageContact
                preferredLanguageView.preferredLanguage = cellContact.preferredLanguageContact
                if let ppc = preferredLanguageView.popoverPresentationController {
                    let minimumSize = preferredLanguageView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    preferredLanguageView.preferredContentSize = minimumSize
                }
            }
        }
        else if segue.identifier == "account of contact" {
            if let accountView = segue.destinationViewController as? AccountOfContactViewController {
                accountView.buttonOfAccount = self.accountOfContact
                accountView.account = self.account
                if let ppc = accountView.popoverPresentationController {
                    let minimumSize = accountView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    let minimumWidth: CGFloat = 320
                    accountView.preferredContentSize = CGSize(width: minimumWidth, height: minimumSize.height)
                }
            }
        }
    }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }
    @IBAction func showContact(sender: UIButton) {
        println("idContact: \(idContact)")
        println("jobTitleContact: \(jobTitleContact)")
        println("countryContact: \(countryContact)")
        println("civilityContact: \(civilityContact)")
        println("firstNameContact: \(firstNameContact)")
        println("lastNameContact: \(lastNameContact)")
        println("typeContact: \(typeContact)")
        println("birthdateContact: \(birthdateContact)")
        println("phoneBusinessContact: \(phoneBusinessContact)")
        println("phoneMobileContact: \(phoneMobileContact)")
        println("emailContact: \(emailContact)")
        println("preferredLanguageContact: \(preferredLanguageContact)")
        println("workingAdressContact: \(workingAdressContact)")
        println("linkedinProfileContact: \(linkedinProfileContact)")
        println("idContact1: \(idContact1)")
    }

}

class ContactCell: UITableViewCell {
    var contact: ContactModel! {
        didSet {
            if contact != nil {
                self.civilityContact.setTitle(contact.civilityContact, forState: .Normal)
                self.lastNameContact.text = contact.lastNameContact
                self.firstNameContact.text = contact.firstNameContact
                self.jobTitleContact.text = contact.jobTitleContact
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let birthdate = dateFormatter.dateFromString(contact.birthdateContact)
                dateFormatter.dateStyle = .MediumStyle
                dateFormatter.timeStyle = .NoStyle
                let todayDate = dateFormatter.stringFromDate(birthdate!)
                self.birthdateContact.setTitle(todayDate, forState: .Normal)
                self.phoneBusinessContact.text = contact.phoneBusinessContact
                self.phoneMobileContact.text = contact.phoneMobileContact
                self.workingAdressContact.text = contact.workingAdressContact
                self.linkedinProfileContact.setTitle(contact.linkedinProfileContact, forState: .Normal)
                self.countryContact.setTitle(contact.countryContact, forState: .Normal)
                self.preferredLanguageContact.setTitle(contact.preferredLanguageContact, forState: .Normal)
                self.typeContact.setTitle(contact.typeContact, forState: .Normal)
                self.idContact1.setTitle(String(contact.idContact1), forState: .Normal)
            }
        }
    }
    
    @IBOutlet weak var civilityContact: UIButton! {didSet { civilityContact.setTitle("Mr", forState: .Normal) }}
    @IBOutlet weak var firstNameContact: UITextField!
    @IBOutlet weak var lastNameContact: UITextField!
    @IBOutlet weak var jobTitleContact: UITextField!
    @IBOutlet weak var birthdateContact: UIButton! {didSet { setTodayDate() } }
    @IBOutlet weak var phoneBusinessContact: UITextField!
    @IBOutlet weak var countryContact: UIButton! {didSet { countryContact.setTitle("France", forState: .Normal) } }
    @IBOutlet weak var phoneMobileContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var workingAdressContact: UITextView! {didSet { workingAdressContact.layer.cornerRadius = 8
        workingAdressContact.layer.borderColor = UIColor.grayColor().CGColor
        workingAdressContact.layer.borderWidth = 1
        } }
    @IBOutlet weak var linkedinProfileContact: UIButton!
    @IBOutlet weak var preferredLanguageContact: UIButton!
    @IBOutlet weak var typeContact: UIButton!
    @IBOutlet weak var idContact1: UIButton!
    
    func setTodayDate() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        let todayDate = dateFormatter.stringFromDate(NSDate())
        birthdateContact.setTitle(todayDate, forState: .Normal)
    }
}