//
//  MeetingsOfAccountV2ViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 04/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfAccountV2ViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var meetingsOfAccountContainer: UIView!
    
    // MARK: - variables
    var account: AccountModel!{
        didSet {
            updateMeetings()
        }
    }
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        account = AccountDataModel().accountOfNextMeeting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    private struct segueIdentifiers {
        static let segueOfContainer = "show meetings of account"
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    var destinationTableViewController: MeetingsOfAccountTableViewController?
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == segueIdentifiers.segueOfContainer {
            destinationTableViewController = segue.destinationViewController.contentViewController as? MeetingsOfAccountTableViewController
            updateMeetings()
        }
        
    }
    
    func updateMeetings() {
        if account == nil {
            account = AccountDataModel().accountOfNextMeeting()
        }
        destinationTableViewController?.meetings = MeetingDataModel().meetingsOfAccount(account: account)
    }
}
