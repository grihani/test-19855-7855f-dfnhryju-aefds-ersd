//
//  DetailMeetingsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 08/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailMeetingsViewController: UIViewController {
    
    var barButtonMenu:UIBarButtonItem = UIBarButtonItem()
    var barButtonHome:UIBarButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        barButtonMenu = UIBarButtonItem(image: UIImage(named: "Menu"), style: UIBarButtonItemStyle.Bordered, target: self, action: "displayMenu")
        
        barButtonHome = UIBarButtonItem(image: UIImage(named: "Home"), style: UIBarButtonItemStyle.Plain, target: self, action: "goHome")
        
        navigationItem.leftBarButtonItems?.append(barButtonMenu)
        navigationItem.rightBarButtonItem = barButtonHome

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goHome() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayMenu() {
        performSegueWithIdentifier("menuPopover", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "menuPopover" {
            if let destinationVC = segue.destinationViewController as? MenuPopoverTableViewController {
                if let ppc = destinationVC.popoverPresentationController {
                    ppc.barButtonItem = barButtonMenu
                    let minimumSize = destinationVC.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                    destinationVC.preferredContentSize = minimumSize
                }
            }
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

    @IBAction func showListMeetings(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }
    @IBAction func showListMeetings(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
    }
}
