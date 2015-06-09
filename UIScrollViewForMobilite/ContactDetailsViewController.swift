//
//  ContactDetailsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UITextFieldDelegate {
    
    let dateFormatter = NSDateFormatter()
    let disabledColor = UIColor.blackColor()
    
    // MARK: - Animation Read/Update View
    var first = true
    var read: Bool = false {
        didSet {
            if read {
                updateUIForReading()
            }
        }
    }
    var update: Bool = false {
        didSet {
            if update {
                updateUIForUpdating()
            }
        }
    }
    var delete: Bool = false
    var create: Bool = false {
        didSet {
            if create {
                updateUIForCreating()
            }
        }
    }
    
    
    func updateUIForReading() {
//        statusSave?.text = ""
        if let account = account {
            accountOfContact?.setTitle(account.nameAccount, forState: .Normal)
            accountDetails?.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
        }
        accountOfContact?.enabled = false
        self.animationUIForReading()
    }
    
    func animationUIForReading() {
        if !self.first {
            UIView.animateWithDuration(0.2,
                animations: { () -> Void in
                    self.civilityContact.alpha = 0
                    self.firstNameContact.alpha = 0
                    self.lastNameContact.alpha = 0
                    self.jobTitleContact.alpha = 0
                    self.birthdateContact.alpha = 0
                    self.phoneBusinessContact.alpha = 0
                    self.countryContact.alpha = 0
                    self.phoneMobileContact.alpha = 0
                    self.emailContact.alpha = 0
                    self.workingAdressContact.alpha = 0
                    self.linkedinProfileContact.alpha = 0
                    self.preferredLanguageContact.alpha = 0
                    self.typeContact.alpha = 0
                    self.idContact1.alpha = 0
                }) { animation in
                    self.civilityContact.alpha = 01
                    self.firstNameContact.alpha = 01
                    self.lastNameContact.alpha = 01
                    self.jobTitleContact.alpha = 01
                    self.birthdateContact.alpha = 01
                    self.phoneBusinessContact.alpha = 01
                    self.countryContact.alpha = 01
                    self.phoneMobileContact.alpha = 01
                    self.emailContact.alpha = 01
                    self.workingAdressContact.alpha = 01
                    self.linkedinProfileContact.alpha = 01
                    self.preferredLanguageContact.alpha = 01
                    self.typeContact.alpha = 01
                    self.idContact1.alpha = 01
                    self.appearAfterEndAnimation()
            }
        } else {
            self.appearAfterEndAnimation()
            self.first = false
        }
    }
    
    func appearAfterEndAnimation() {
        self.civilityContact?.enabled = false
        self.firstNameContact?.borderStyle = .None
        self.firstNameContact?.textAlignment = NSTextAlignment.Left
        self.firstNameContact?.enabled = false
        self.lastNameContact?.borderStyle = UITextBorderStyle.None
        self.lastNameContact?.enabled = false
        self.jobTitleContact?.borderStyle = .None
        self.jobTitleContact?.enabled = false
        self.birthdateContact?.enabled = false
        self.birthdateContact?.contentHorizontalAlignment = .Left
        self.phoneBusinessContact?.enabled = false
        self.phoneBusinessContact?.borderStyle = .None
        self.countryContact?.enabled = false
        self.countryContact?.contentHorizontalAlignment = .Left
        self.phoneMobileContact?.enabled = false
        self.phoneMobileContact?.borderStyle = .None
        self.emailContact?.enabled = false
        self.emailContact?.borderStyle = .None
        self.workingAdressContact?.editable = false
        self.workingAdressContact?.layer.borderWidth = 0
        self.linkedinProfileContact?.enabled = false
        self.linkedinProfileContact?.contentHorizontalAlignment = .Left
        self.preferredLanguageContact?.enabled = false
        self.preferredLanguageContact?.contentHorizontalAlignment = .Left
        self.typeContact?.enabled = false
        self.typeContact?.contentHorizontalAlignment = .Left
        self.idContact1?.enabled = false
        self.idContact1?.contentHorizontalAlignment = .Left
    }
    
    func updateUIForUpdating() {
        if let account = account {
            accountOfContact?.setTitle(account.nameAccount, forState: .Normal)
            accountDetails?.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
        }
        accountOfContact?.enabled = true
        self.animationUIForUpdating()
    }
    
    func animationUIForUpdating() {
        
        self.civilityContact.enabled = true
        self.firstNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.firstNameContact.textAlignment = NSTextAlignment.Left
        self.firstNameContact.enabled = true
        self.lastNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.lastNameContact.enabled = true
        self.jobTitleContact.borderStyle = .RoundedRect
        self.jobTitleContact.enabled = true
        self.birthdateContact.enabled = true
        self.birthdateContact.contentHorizontalAlignment = .Left
        self.phoneBusinessContact.enabled = true
        self.phoneBusinessContact.borderStyle = .RoundedRect
        self.countryContact.enabled = true
        self.countryContact.contentHorizontalAlignment = .Left
        self.phoneMobileContact.enabled = true
        self.phoneMobileContact.borderStyle = .RoundedRect
        self.emailContact.enabled = true
        self.emailContact.borderStyle = .RoundedRect
        self.workingAdressContact.editable = true
        self.workingAdressContact.layer.borderWidth = 1
        self.workingAdressContact.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).CGColor
        
        self.linkedinProfileContact.enabled = true
        self.linkedinProfileContact.contentHorizontalAlignment = .Left
        self.preferredLanguageContact.enabled = true
        self.preferredLanguageContact.contentHorizontalAlignment = .Left
        self.typeContact.enabled = true
        self.typeContact.contentHorizontalAlignment = .Left
        self.idContact1.enabled = true
        self.idContact1.contentHorizontalAlignment = .Left
    }
    
    func updateUIForCreating() {
        accountOfContact?.setTitle("accountOfContact", forState: .Normal)
        accountDetails?.text = "accountDetails"
        accountOfContact?.enabled = true
        self.animationUIForCreating()
    }
    
    func animationUIForCreating() {
        self.civilityContact.enabled = true
        self.civilityContact.setTitle("Civility", forState: .Normal)
        
        self.firstNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.firstNameContact.textAlignment = NSTextAlignment.Left
        self.firstNameContact.enabled = true
        self.firstNameContact.text = ""
        
        self.lastNameContact.borderStyle = UITextBorderStyle.RoundedRect
        self.lastNameContact.enabled = true
        self.lastNameContact.text = ""
        
        self.jobTitleContact.borderStyle = .RoundedRect
        self.jobTitleContact.enabled = true
        self.jobTitleContact.text = ""
        
        self.birthdateContact.enabled = true
        self.birthdateContact.contentHorizontalAlignment = .Left
        let today = NSDate()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        let todayDate = dateFormatter.stringFromDate(today)
        self.birthdateContact.setTitle("Birthdate", forState: .Normal)
        
        self.phoneBusinessContact.enabled = true
        self.phoneBusinessContact.borderStyle = .RoundedRect
        self.phoneBusinessContact.text = ""
        
        self.countryContact.enabled = true
        self.countryContact.contentHorizontalAlignment = .Left
        self.countryContact.setTitle("Country", forState: .Normal)
        
        self.phoneMobileContact.enabled = true
        self.phoneMobileContact.borderStyle = .RoundedRect
        self.phoneMobileContact.text = ""
        
        self.emailContact.enabled = true
        self.emailContact.borderStyle = .RoundedRect
        self.emailContact.text = ""
        
        self.workingAdressContact.editable = true
        self.workingAdressContact.layer.borderWidth = 1
        self.workingAdressContact.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).CGColor
        self.workingAdressContact.text = ""
        
        self.linkedinProfileContact.enabled = true
        self.linkedinProfileContact.contentHorizontalAlignment = .Left
        self.linkedinProfileContact.setTitle("Linkedin Profil", forState: .Normal)
        
        self.preferredLanguageContact.enabled = true
        self.preferredLanguageContact.contentHorizontalAlignment = .Left
        self.preferredLanguageContact.setTitle("Preferred Language", forState: .Normal)
        
        self.typeContact.enabled = true
        self.typeContact.contentHorizontalAlignment = .Left
        self.typeContact.setTitle("Typologie", forState: .Normal)
        
        self.idContact1.enabled = true
        self.idContact1.contentHorizontalAlignment = .Left
        self.idContact1.setTitle("Assistant of", forState: .Normal)
    }
    
    func updateContact() {
        self.update = true
        self.read = false
        self.delete = false
        self.create = false
    }
    
    func saveContact() {
        self.update = false
        self.read = true
        self.delete = false
        self.create = false
    }
    
    func createContact() {
        self.update = false
        self.read = false
        self.delete = false
        self.create = true
    }
    
    var contact: ContactModel! {
        didSet {
            if contact != nil {
                self.civilityContact?.setTitle(contact.civilityContact, forState: .Normal)
                self.lastNameContact?.text = contact.lastNameContact
                self.firstNameContact?.text = contact.firstNameContact
                self.jobTitleContact?.text = contact.jobTitleContact
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let birthdate = dateFormatter.dateFromString(contact.birthdateContact)
                dateFormatter.dateStyle = .MediumStyle
                dateFormatter.timeStyle = .NoStyle
                let todayDate = dateFormatter.stringFromDate(birthdate!)
                self.birthdateContact?.setTitle(todayDate, forState: .Normal)
                self.phoneBusinessContact?.text = contact.phoneBusinessContact
                self.phoneMobileContact?.text = contact.phoneMobileContact
                self.workingAdressContact?.text = contact.workingAdressContact
                self.emailContact?.text = contact.emailContact
                self.linkedinProfileContact?.setTitle(contact.linkedinProfileContact, forState: .Normal)
                self.countryContact?.setTitle(contact.countryContact, forState: .Normal)
                self.preferredLanguageContact?.setTitle(contact.preferredLanguageContact, forState: .Normal)
                self.typeContact?.setTitle(contact.typeContact, forState: .Normal)
                self.idContact1?.setTitle(String(contact.idContact1), forState: .Normal)
                self.read = true
            }
            if self.create {
                updateUIForCreating()
            }
        }
    }
    
    @IBOutlet weak var civilityContact: UIButton! {
        didSet {
            if let contact = contact {
                self.civilityContact.setTitle(contact.civilityContact, forState: .Normal)
            } else {
                civilityContact.setTitleColor(disabledColor, forState: .Disabled)
                civilityContact.setTitle("Mr", forState: .Normal)
            }
        }
    }
    @IBOutlet weak var firstNameContact: UITextField! {
        didSet {
            if let contact = contact {
                self.firstNameContact.text = contact.firstNameContact
            }
        }
    }
    @IBOutlet weak var lastNameContact: UITextField! {
        didSet {
            if let contact = contact {
                self.lastNameContact.text = contact.lastNameContact
            }
        }
    }
    @IBOutlet weak var jobTitleContact: UITextField! {
        didSet {
            if let contact = contact {
                self.jobTitleContact.text = contact.jobTitleContact
            }
        }
    }
    @IBOutlet weak var birthdateContact: UIButton! {
        didSet {
            if let contact = contact {
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let birthdate = dateFormatter.dateFromString(contact.birthdateContact)
                dateFormatter.dateStyle = .MediumStyle
                dateFormatter.timeStyle = .NoStyle
                let todayDate = dateFormatter.stringFromDate(birthdate!)
                self.birthdateContact.setTitle(todayDate, forState: .Normal)
            } else {
                birthdateContact.setTitleColor(disabledColor, forState: .Disabled)
                let chosenDate = dateToString(NSDate())
                birthdateContact.setTitle(chosenDate, forState: .Normal)
            }
        }
    }
    @IBOutlet weak var phoneBusinessContact: UITextField! {
        didSet {
            if let contact = contact {
                self.phoneBusinessContact?.text = contact.phoneBusinessContact
            }
        }
    }
    @IBOutlet weak var countryContact: UIButton! {
        didSet {
            if let contact = contact {
                self.countryContact.setTitle(contact.countryContact, forState: .Normal)
            } else {
                countryContact.setTitleColor(disabledColor, forState: .Disabled)
                countryContact.setTitle("France", forState: .Normal)
            }
        }
    }
    @IBOutlet weak var phoneMobileContact: UITextField! {
        didSet {
            if let contact = contact {
                self.phoneMobileContact.text = contact.phoneMobileContact
            }
        }
    }
    @IBOutlet weak var emailContact: UITextField! {
        didSet {
            if let contact = contact {
                self.emailContact.text = contact.emailContact
            }
        }
    }
    @IBOutlet weak var workingAdressContact: UITextView! {
        didSet {
            if let contact = contact {
                self.workingAdressContact.text = contact.workingAdressContact
            }
            workingAdressContact.layer.cornerRadius = 8
            workingAdressContact.layer.borderColor = UIColor.grayColor().CGColor
            workingAdressContact.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var linkedinProfileContact: UIButton! {
        didSet {
            if let contact = contact {
                self.linkedinProfileContact.setTitle(contact.linkedinProfileContact, forState: .Normal)
            } else {
                linkedinProfileContact.setTitleColor(disabledColor, forState: .Disabled)
            }
        }
    }
    @IBOutlet weak var preferredLanguageContact: UIButton! {
        didSet {
            if let contact = contact {
                self.preferredLanguageContact.setTitle(contact.preferredLanguageContact, forState: .Normal)
            } else {
                preferredLanguageContact.setTitleColor(disabledColor, forState: .Disabled)
            }
        }
    }
    @IBOutlet weak var typeContact: UIButton!{
        didSet {
            if let contact = contact {
                self.typeContact.setTitle(contact.typeContact, forState: .Normal)
            } else {
                typeContact.setTitleColor(disabledColor, forState: .Disabled)
            }
        }
    }
    @IBOutlet weak var idContact1: UIButton!{
        didSet {
            if let contact = contact {
                self.idContact1.setTitle(String(contact.idContact1), forState: .Normal)
            } else {
                idContact1.setTitleColor(disabledColor, forState: .Disabled)
            }
        }
    }
    
    func dateToString(date: NSDate) -> String {
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        let chosenDate = dateFormatter.stringFromDate(date)
        return chosenDate
    }
    
    func rearrangedStringFromDate(dateInDB: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let birthdate = dateFormatter.dateFromString(dateInDB) {
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            let chosenDate = dateFormatter.stringFromDate(birthdate)
            return chosenDate
        }
        return "Non procured"
    }
    
    @IBOutlet weak var leftSlidingBar: UIView!
    
    @IBOutlet weak var accountDetails: UILabel! {
        didSet {
            if let account = account {
                accountDetails.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
            }
            if read {
                accountDetails.enabled = false
            }
        }
    }
    
    var account: AccountModel? {
        didSet {
            if let account = account {
                accountDetails?.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
                accountOfContact?.setTitle(account.nameAccount, forState: .Normal)
            }
        }
    }
    
    @IBOutlet weak var accountOfContact: UIButton! {
        didSet {
            accountOfContact.setTitleColor(UIColor.blackColor(), forState: .Disabled)
            if let account = account {
                accountOfContact.setTitle(account.nameAccount, forState: .Normal)
            }
            if read {
                accountOfContact.enabled = false
            }
        }
    }
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var idContact: Int = 0
    var favoriteContact: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Account : \(account)")
//        checkStatusOfCreationOfContact()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if contact == nil && !self.create {
            contact = ContactDataModel().getFirstFavoriteContact()
            println("création : \(create)")
            println()
        }
        if self.read {
            updateUIForReading()
        } else if self.update {
            updateUIForUpdating()
        } else if self.create {
            updateUIForCreating()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        println("hello World")
    }
    
    @IBAction func rewind(sender: UIBarButtonItem) {
        println(self.presentingViewController)
        let presentingController = self.presentingViewController?.contentViewController as? HomepageUserViewController
        presentingController?.dismissViewControllerAnimated(false, completion: nil)
        presentingController?.performSegueWithIdentifier("goToModuleAccount", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show Menu" {
            if let menuTableViewController = segue.destinationViewController as? MenuTableViewController {
                var minimumSize = menuTableViewController.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                minimumSize.width = 320
                minimumSize.height = 164
                menuTableViewController.preferredContentSize = minimumSize
                if let ppc = menuTableViewController.popoverPresentationController {
                    ppc.barButtonItem = sender as! UIBarButtonItem
                }
            }
        }
        else if segue.identifier == "civility of contact" {
            if let civilityView = segue.destinationViewController as? CivilityPickerViewController {
                civilityView.civilityButton = self.civilityContact
                civilityView.civilityContact = self.civilityContact.currentTitle!
                if let ppc = civilityView.popoverPresentationController {
                    let minimumSize = civilityView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    civilityView.preferredContentSize = minimumSize
                }
            }
        }
        else if segue.identifier == "birthday of contact" {
            if let birthdayView = segue.destinationViewController as? BirthDayPickerOfContactViewController {
                birthdayView.date = self.birthdateContact
                birthdayView.birthdateContact = self.birthdateContact.currentTitle!
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
                    countryView.countryContact = self.countryContact.currentTitle!
                    countryView.chosenCountryButton = self.countryContact
                }
            }
        }
        else if segue.identifier == "linkedin of contact" {
            if let linkedinView = segue.destinationViewController as? LinkedinOfContactViewController {
                if self.linkedinProfileContact == "" {
                    linkedinProfileContact.setTitle("https://www.linkedin.com/vsearch/f?type=all&keywords=&orig=GLHD&rsid=&pageKey=oz-winner&trkInfo=&search=Search", forState: .Normal)
                }
                linkedinView.linkedinProfileContact = contact.linkedinProfileContact
                linkedinView.linkedinProfileContactButton = self.linkedinProfileContact
                if let ppc = linkedinView.popoverPresentationController {
                    let maximumSize = linkedinView.view.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
                    let width: CGFloat = 921
                    linkedinView.preferredContentSize = CGSize(width: width, height: maximumSize.height)
                }
            }
        }
        else if segue.identifier == "preferred language of contact" {
            if let preferredLanguageView = segue.destinationViewController as? PreferredLanguageOfContactViewController {
                preferredLanguageView.preferredLanguageContact = self.preferredLanguageContact.currentTitle!
                preferredLanguageView.preferredLanguage = self.preferredLanguageContact
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
        else if segue.identifier == "typology of contact" {
            if let typologyOfContact = segue.destinationViewController as? TypologyOfContactViewController {
                typologyOfContact.typologyOfContact = self.typeContact
                typologyOfContact.chosenTypology = self.typeContact.currentTitle!
                if let ppc = typologyOfContact.popoverPresentationController {
                    let minimumSize = typologyOfContact.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    typologyOfContact.preferredContentSize = minimumSize
                }
            }
        }
    }
    
    // MARK: - Actions of showing the Master
    @IBOutlet weak var languette: UIImageView!
    var leftListShown: Bool = false {
        didSet {
            if leftListShown {
                languette?.image = UIImage(named: "languetteFermeture")
            } else {
                languette?.image = UIImage(named: "languette gauche")
            }
        }
    }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
    
    @IBAction func showListTapGestureRecognizer(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
//    
//    func checkStatusOfCreationOfContact() {
//        var stringStatus = ""
//        if account == nil {
//            stringStatus += "- Manque le compte auquel est rattaché le contact\n"
//        }
//        if firstNameContact == "" && lastNameContact == "" {
//            stringStatus += "- Manque les nom et prénom du contact \n"
//        } else if firstNameContact == "" {
//            stringStatus += "- Manque le nom du contact \n"
//        } else if lastNameContact == "" {
//            stringStatus += "- Manque le prénom du contact\n"
//        }
//        if emailContact == "" || phoneMobileContact == "" || phoneBusinessContact == "" {
//            stringStatus += "- Rajoutez au moins un E-mail ou un téléphone au contact"
//        }
//        
//        if stringStatus != "" {
//            statusSave.text = stringStatus
//        } else {
//            statusSave.text = "Il est possible d'enregistrer le contact"
//        }
//        
//    }
    
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
        //checkStatusOfCreationOfContact()
    }
}