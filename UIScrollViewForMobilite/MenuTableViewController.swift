//
//  MenuTableViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 06/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var presentingViewIndex = 0
        let row = indexPath.row
        let presentingViewController = self.presentingViewController?.presenterViewController
        if let presentingViewController = presentingViewController {
            if presentingViewController is DetailAccountsViewController {
                presentingViewIndex = 0
            }
            if presentingViewController is DetailContactsViewController {
                presentingViewIndex = 1
            }
            if presentingViewController is DetailMeetingsViewController {
                presentingViewIndex = 2
            }
        }
        if row == presentingViewIndex {
            presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            if let homePageUserController = presentingViewController?.presentingViewController?.contentViewController as? HomepageUserViewController {
                homePageUserController.dismissViewControllerAnimated(false, completion: nil)
                switch row {
                case 0:
                    homePageUserController.performSegueWithIdentifier("goToModuleAccount", sender: nil)
                case 1:
                    homePageUserController.performSegueWithIdentifier("goToModuleContacts", sender: nil)
                case 2:
                    homePageUserController.performSegueWithIdentifier("goToModuleMeetings", sender: nil)
                default: break
                }
            }
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
