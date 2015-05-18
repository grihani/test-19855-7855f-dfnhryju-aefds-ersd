//
//  ContactDetailsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var read: Bool = false {
        didSet {
            if read {
                updateUIForReading()
                cellContact?.read = true
                cellContact?.update = false
                cellContact?.delete = false
                cellContact?.create = false
            }
        }
    }
    var update: Bool = false {
        didSet {
            if update {
                navigationBar.title = "Update contact : " + contact.lastNameContact
                updateUIForUpdating()
                cellContact?.read = false
                cellContact?.update = true
                cellContact?.delete = false
                cellContact?.create = false
            }
        }
    }
    var delete: Bool = false
    var create: Bool = false
    
    
    func updateUIForReading() {
        statusSave?.text = ""
        if let account = account {
            accountOfContact?.setTitle(account.nameAccount, forState: .Normal)
            accountDetails?.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
        }
        accountOfContact?.enabled = false
        let updateButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "updateContact")
        self.navigationBar.rightBarButtonItems = [updateButton]
    }
    
    func updateUIForUpdating() {
        if let account = account {
            accountOfContact?.setTitle(account.nameAccount, forState: .Normal)
            accountDetails?.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
        }
        accountOfContact?.enabled = true
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "saveContact")
        self.navigationBar.rightBarButtonItems = [saveButton]
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
    
    var contact: ContactModel! {
        didSet {
            idContact = contact.idContact
            jobTitleContact = contact.jobTitleContact
            countryContact = contact.countryContact
            civilityContact = contact.civilityContact
            firstNameContact = contact.firstNameContact
            lastNameContact = contact.lastNameContact
            typeContact = contact.typeContact
            birthdateContact = contact.birthdateContact
            phoneBusinessContact = contact.phoneBusinessContact
            phoneMobileContact = contact.phoneMobileContact
            emailContact = contact.emailContact
            preferredLanguageContact = contact.preferredLanguageContact
            workingAdressContact = contact.workingAdressContact
            linkedinProfileContact = contact.linkedinProfileContact
            idContact1 = contact.idContact1
            favoriteContact = contact.favoriteContact
            
            account = AccountDataModel().accountOfContact(contact: contact)
            navigationBar?.title = contact.lastNameContact
        }
    }
    @IBOutlet weak var leftSlidingBar: UIView!
    
    @IBOutlet weak var accountDetails: UILabel! {
        didSet {
            if let account = account {
                accountDetails.text = account.industryAccount + "\n" + account.phoneAccount + "\n" + account.adressAccount
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
    
    var cellContact : ContactCell! {
        didSet {
            cellContact.contact = self.contact
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
    @IBOutlet weak var statusSave: UILabel!
    
    @IBOutlet weak var favorisButton: UIButton! {
        didSet {
            if contact != nil {
                if contact.favoriteContact == 0 {
                    favorisButton.setImage(UIImage(named: "notFavoris")!, forState: UIControlState.Normal)
                } else {
                    favorisButton.setImage(UIImage(named: "addedToFavoris")!, forState: UIControlState.Normal)
                }
            }
        }
    }
    @IBOutlet weak var buttonToShowMenu: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        println("show menu")
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    @IBOutlet weak var buttonHome: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
//    @IBOutlet weak var contactCell: ContactCell!
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
    var favoriteContact: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkStatusOfCreationOfContact()
        navigationItem.leftBarButtonItems?.append(buttonHome)
        navigationItem.leftBarButtonItems?.append(buttonToShowMenu)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        println(self.presentingViewController)
//        println(self.presentingViewController?.contentViewController)
//        println(self.presentingViewController?.contentViewController.presenterViewController)
        contact = ContactDataModel().getFirstFavoriteContact()
        println("idContact: \(contact.idContact)")
        println("jobTitleContact: \(contact.jobTitleContact)")
        println("countryContact: \(contact.countryContact)")
        println("civilityContact: \(contact.civilityContact)")
        println("firstNameContact: \(contact.firstNameContact)")
        println("lastNameContact: \(contact.lastNameContact)")
        println("typeContact: \(contact.typeContact)")
        println("birthdateContact: \(contact.birthdateContact)")
        println("phoneBusinessContact: \(contact.phoneBusinessContact)")
        println("phoneMobileContact: \(contact.phoneMobileContact)")
        println("emailContact: \(contact.emailContact)")
        println("preferredLanguageContact: \(contact.preferredLanguageContact)")
        println("workingAdressContact: \(contact.workingAdressContact)")
        println("linkedinProfileContact: \(contact.linkedinProfileContact)")
        println("idContact1: \(contact.idContact1)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        println("hello World")
    }
    
    // Mark: - tableview data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        let cell = tableView.dequeueReusableCellWithIdentifier("cellForShowingcontact") as ContactCell
        cell.contact = self.contact
        cell.read = self.read
        cell.update = self.update
        cell.delete = self.delete
        cell.create = self.create
        cellContact = cell
        return cell
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
                    ppc.barButtonItem = sender as UIBarButtonItem
                }
            }
        }
        else if segue.identifier == "civility of contact" {
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
        else if segue.identifier == "typology of contact" {
            if let typologyOfContact = segue.destinationViewController as? TypologyOfContactViewController {
                typologyOfContact.typologyOfContact = cellContact.typeContact
                typologyOfContact.chosenTypology = self.typeContact
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
    
    
    @IBAction func showList(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
    
    func checkStatusOfCreationOfContact() {
        var stringStatus = ""
        if account == nil {
            stringStatus += "- Manque le compte auquel est rattaché le contact\n"
        }
        if firstNameContact == "" && lastNameContact == "" {
            stringStatus += "- Manque les nom et prénom du contact \n"
        } else if firstNameContact == "" {
            stringStatus += "- Manque le nom du contact \n"
        } else if lastNameContact == "" {
            stringStatus += "- Manque le prénom du contact\n"
        }
        if emailContact == "" || phoneMobileContact == "" || phoneBusinessContact == "" {
            stringStatus += "- Rajoutez au moins un E-mail ou un téléphone au contact"
        }
        
        if stringStatus != "" {
            statusSave.text = stringStatus
        } else {
            statusSave.text = "Il est possible d'enregistrer le contact"
        }
        
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
        checkStatusOfCreationOfContact()
    }

    @IBAction func favorisButtonPressed(sender: UIButton) {
        var image: UIImage = favorisButton.imageForState(UIControlState.Normal)!
        let imageFav: UIImage = UIImage(named: "notFavoris")!
        let imageFavSelec: UIImage = UIImage(named: "addedToFavoris")!
        if image == imageFav {
            favorisButton.setImage(imageFavSelec, forState: UIControlState.Normal)
            //set favoris = true (1)
            println("ajouté aux favoris")
            self.contact.favoriteContact = 1
            println("favoris: \(self.contact.favoriteContact)")
        } else {
            favorisButton.setImage(imageFav, forState: UIControlState.Normal)
            //set favoris = false (0)
            println("supprimé des favoris")
            self.contact.favoriteContact = 0
            println("favoris: \(self.contact.favoriteContact)")
        }
        ContactDataModel().updateContact(self.contact)
    }
}

class ContactCell: UITableViewCell {
    let dateFormatter = NSDateFormatter()
    let disabledColor = UIColor.blackColor()
    
    var first = true
    var read: Bool = false {
        didSet {
            if read {
                updateCellUIForReading()
            }
        }
    }
    var update: Bool = false {
        didSet {
            if update {
                updateCellUIForUpdating()
            }
        }
    }
    var delete = false
    var create = false
    
    func updateCellUIForReading() {
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
        self.civilityContact.enabled = false
        self.firstNameContact.borderStyle = .None
        self.firstNameContact.textAlignment = NSTextAlignment.Left
        self.firstNameContact.enabled = false
        self.lastNameContact.borderStyle = UITextBorderStyle.None
        self.lastNameContact.enabled = false
        self.jobTitleContact.borderStyle = .None
        self.jobTitleContact.enabled = false
        self.birthdateContact.enabled = false
        self.birthdateContact.contentHorizontalAlignment = .Left
        self.phoneBusinessContact.enabled = false
        self.phoneBusinessContact.borderStyle = .None
        self.countryContact.enabled = false
        self.countryContact.contentHorizontalAlignment = .Left
        self.phoneMobileContact.enabled = false
        self.phoneMobileContact.borderStyle = .None
        self.emailContact.enabled = false
        self.emailContact.borderStyle = .None
        self.workingAdressContact.editable = false
        self.workingAdressContact.layer.borderWidth = 0
        self.linkedinProfileContact.enabled = false
        self.linkedinProfileContact.contentHorizontalAlignment = .Left
        self.preferredLanguageContact.enabled = false
        self.preferredLanguageContact.contentHorizontalAlignment = .Left
        self.typeContact.enabled = false
        self.typeContact.contentHorizontalAlignment = .Left
        self.idContact1.enabled = false
        self.idContact1.contentHorizontalAlignment = .Left
        
    }
    
    func updateCellUIForUpdating() {
        
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
    
    var contact: ContactModel! {
        didSet {
            if contact != nil {
                contact = ContactDataModel().getFirstFavoriteContact()
                self.civilityContact.setTitle(contact.civilityContact, forState: .Normal)
                self.lastNameContact.text = contact.lastNameContact
                self.firstNameContact.text = contact.firstNameContact
                self.jobTitleContact.text = contact.jobTitleContact
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let birthdate = dateFormatter.dateFromString(contact.birthdateContact)
                dateFormatter.dateStyle = .MediumStyle
                dateFormatter.timeStyle = .NoStyle
                let todayDate = dateFormatter.stringFromDate(birthdate!)
                self.birthdateContact.setTitle(todayDate, forState: .Normal)
                self.phoneBusinessContact.text = contact.phoneBusinessContact
                self.phoneMobileContact.text = contact.phoneMobileContact
                self.workingAdressContact.text = contact.workingAdressContact
                self.emailContact.text = contact.emailContact
                self.linkedinProfileContact.setTitle(contact.linkedinProfileContact, forState: .Normal)
                self.countryContact.setTitle(contact.countryContact, forState: .Normal)
                self.preferredLanguageContact.setTitle(contact.preferredLanguageContact, forState: .Normal)
                self.typeContact.setTitle(contact.typeContact, forState: .Normal)
                self.idContact1.setTitle(String(contact.idContact1), forState: .Normal)
                
                self.read = true
            }
        }
    }
    
    @IBOutlet weak var civilityContact: UIButton! {
        didSet {
            civilityContact.setTitleColor(disabledColor, forState: .Disabled)
            civilityContact.setTitle("Mr", forState: .Normal)
        }
    }
    @IBOutlet weak var firstNameContact: UITextField!
    @IBOutlet weak var lastNameContact: UITextField!
    @IBOutlet weak var jobTitleContact: UITextField!
    @IBOutlet weak var birthdateContact: UIButton! {
        didSet {
            birthdateContact.setTitleColor(disabledColor, forState: .Disabled)
            let chosenDate = dateToString(NSDate())
            birthdateContact.setTitle(chosenDate, forState: .Normal)
        }
    }
    @IBOutlet weak var phoneBusinessContact: UITextField!
    @IBOutlet weak var countryContact: UIButton! {
        didSet {
            countryContact.setTitleColor(disabledColor, forState: .Disabled)
            countryContact.setTitle("France", forState: .Normal)
        }
    }
    @IBOutlet weak var phoneMobileContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var workingAdressContact: UITextView! {
        didSet {
            workingAdressContact.layer.cornerRadius = 8
            workingAdressContact.layer.borderColor = UIColor.grayColor().CGColor
            workingAdressContact.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var linkedinProfileContact: UIButton! {
        didSet {
            linkedinProfileContact.setTitleColor(disabledColor, forState: .Disabled)
        }
    }
    @IBOutlet weak var preferredLanguageContact: UIButton! {
        didSet {
            preferredLanguageContact.setTitleColor(disabledColor, forState: .Disabled)
        }
    }
    @IBOutlet weak var typeContact: UIButton!{
        didSet {
            typeContact.setTitleColor(disabledColor, forState: .Disabled)
        }
    }
    @IBOutlet weak var idContact1: UIButton!{
        didSet {
            idContact1.setTitleColor(disabledColor, forState: .Disabled)
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
}