//
//  DetailMeetingsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 08/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailMeetingsViewController: UIViewController {

    var buttonToShowMenu: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        println("show menu")
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    var buttonHome: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonToShowMenu = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "showMenu:")
        navigationItem.leftBarButtonItems?.append(buttonToShowMenu)
        buttonHome = UIBarButtonItem(title: "Home", style: UIBarButtonItemStyle.Done, target: self, action: "goHome:")
        navigationItem.rightBarButtonItems?.append(buttonHome)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show Menu" {
            if let menuTableViewController = segue.destinationViewController as? MenuTableViewController {
                println()
                var minimumSize = menuTableViewController.view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
                minimumSize.width = 320
                minimumSize.height = 164
                menuTableViewController.preferredContentSize = minimumSize
                if let ppc = menuTableViewController.popoverPresentationController {
                    ppc.barButtonItem = sender as UIBarButtonItem
                }
            }
        }
    }

    @IBAction func showListMeetings(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
    }
    @IBAction func showListMeetings(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
    }
}
