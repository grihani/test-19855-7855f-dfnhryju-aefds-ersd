//
//  DetailMeetingsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 08/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailMeetingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func showListMeetings(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }
    @IBAction func showListMeetings(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
    }
}
