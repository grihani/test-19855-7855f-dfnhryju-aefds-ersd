//
//  TasksOfAccountV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 05/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class TasksOfAccountV2ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var topHeight: NSLayoutConstraint!
    @IBOutlet weak var midHeight: NSLayoutConstraint!
    @IBOutlet weak var botHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        topHeight.constant = 1000
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var heightOfExpandedView: CGFloat = 0
    var viewDidItsLayoutForExpandedTableView = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !viewDidItsLayoutForExpandedTableView {
            println("viewDidLayoutSubviews")
            heightOfExpandedView = containerView.frame.size.height - 88
            topHeight.constant = heightOfExpandedView
            midHeight.constant = 44
            botHeight.constant = 44
            containerView.layoutIfNeeded()
            viewDidItsLayoutForExpandedTableView = true
        }
    }
    
    // MARK: - IBActions for collapsing and expanding the tableViews
    @IBAction func tapTop(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = self.heightOfExpandedView
            self.midHeight.constant = 44
            self.botHeight.constant = 44
            self.containerView.layoutIfNeeded()
            }, completion: nil)
    }
    @IBAction func tapMid(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = 44
            self.midHeight.constant = self.heightOfExpandedView
            self.botHeight.constant = 44
            self.containerView.layoutIfNeeded()
            }, completion: nil)
    }
    @IBAction func tapBot(sender: UIBarButtonItem) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topHeight.constant = 44
            self.midHeight.constant = 44
            self.botHeight.constant = self.heightOfExpandedView
            self.containerView.layoutIfNeeded()
            }, completion: nil)
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
