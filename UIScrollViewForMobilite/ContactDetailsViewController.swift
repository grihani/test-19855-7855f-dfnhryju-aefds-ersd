//
//  ContactDetailsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contact: ContactModel! {
        didSet { updateUI() }
    }
    var cellContact : ContactCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
    }
    
    // Mark: - tableview data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellForShowingcontact") as ContactCell
        cellContact = cell
        return cell
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "civility of contact" {
            if let civilityView = segue.destinationViewController as? CivilityPickerViewController {
                if let ppc = civilityView.popoverPresentationController {
                    let minimumSize = civilityView.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    civilityView.preferredContentSize = minimumSize
//                    self.cellContact.civilityContact.setTitle(civilityView, forState: <#UIControlState#>)
                }
            }
        }
        else if segue.identifier == "birthday of contact" {
            if let birthdayView = segue.destinationViewController as? BirthDayPickerOfContactViewController {
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
                }
            }
        }
    }
    
    @IBAction func showList(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }

}

class ContactCell: UITableViewCell {
    
    
    
    @IBOutlet weak var civilityContact: UIButton!
    @IBOutlet weak var firstNameContact: UITextField!
    @IBOutlet weak var lastNameContact: UITextField!
    @IBOutlet weak var jobTitleContact: UITextField!
    @IBOutlet weak var birthdateContact: UIButton!
    @IBOutlet weak var phoneBusinessContact: UITextField!
    @IBOutlet weak var countryContact: UIButton!
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
    
    
}