//
//  BirthDayPickerOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class BirthDayPickerOfContactViewController: UIViewController {

    var date = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        let dateOfPicker = sender.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        date.setTitle(dateFormatter.stringFromDate(dateOfPicker), forState: .Normal)
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
