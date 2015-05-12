//
//  DetailMeetingsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 08/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailMeetingsViewController: UIViewController {

    @IBOutlet weak var buttonToShowMenu: UIBarButtonItem!
    @IBAction func showMenu(sender: UIBarButtonItem) {
        println("show menu")
        performSegueWithIdentifier("show Menu", sender: sender)
    }
    @IBOutlet weak var buttonHome: UIBarButtonItem!
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.presentingViewController?.contentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItems?.append(buttonHome)
        navigationItem.leftBarButtonItems?.append(buttonToShowMenu)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func showListMeetings(sender: UIBarButtonItem) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
    }
    
    
    @IBAction func showListMeetings(sender: UITapGestureRecognizer) {
        self.revealViewController().revealToggle(sender)
        if !leftListShown {
            leftListShown = true
        } else {
            leftListShown = false
        }
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
}
