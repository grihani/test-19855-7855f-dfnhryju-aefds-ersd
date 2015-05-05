//
//  BirthDayPickerOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class BirthDayPickerOfContactViewController: UIViewController {

    var birthdateContact: String = ""
    var date = UIButton()
    let dateFormatter = NSDateFormatter()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if birthdateContact == "" {
            birthdateContact = dateFormatter.stringFromDate(NSDate())
        }
        
        if let dateOfPicker = dateFormatter.dateFromString(birthdateContact) {
            datePicker.date = dateOfPicker
        }
        datePicker.maximumDate = NSDate()
        println(self.presentingViewController)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        let dateOfPicker = sender.date
        
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        date.setTitle(dateFormatter.stringFromDate(dateOfPicker), forState: .Normal)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        birthdateContact = dateFormatter.stringFromDate(dateOfPicker)
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.birthdateContact = self.birthdateContact
        }
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
