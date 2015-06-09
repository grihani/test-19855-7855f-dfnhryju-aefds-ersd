//
//  DetailsOfParticipantsOfMeetingsViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 12/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class DetailsOfParticipantsOfMeetingsViewController: UIViewController {
    var contact: ContactModel = ContactModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        let contactViewController = storyboard?.instantiateViewControllerWithIdentifier("contactDetailsViewController") as! ContactDetailsViewController
        contactViewController.view.frame = view.frame
        contactViewController.contact = contact
        contactViewController.read = true
        contactViewController.leftSlidingBar.hidden = true
        
        switchViewController(from: nil, to: contactViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMoveToParentViewController(nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0)
            toVC!.didMoveToParentViewController(self)
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
