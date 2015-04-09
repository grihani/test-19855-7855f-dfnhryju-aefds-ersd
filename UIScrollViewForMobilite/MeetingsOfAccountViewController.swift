//
//  MeetingsOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 09/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfAccountViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var meetingTableView: UITableView!
    
    
    var meetings: [MeetingModel] = [MeetingModel]()
    var account: AccountModel!
    var dateFormatter: NSDateFormatter = NSDateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view meetings did load")
        if account != nil {
            meetings = MeetingDataModel().meetingsOfAccount(account: account)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return meetings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("meetingsAccount", forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .FullStyle
        
        var dateBeginMeeting = Dates().fromSQLiteDayToDate(meetings[row].dateBeginMeeting)
        if let dateBeginMeeting = dateBeginMeeting {
            let stringFromDateBeginMeeting = dateFormatter.stringFromDate(dateBeginMeeting)
            
            cell.textLabel?.text = stringFromDateBeginMeeting + " : " + meetings[row].subjectMeeting
        }
        return cell
    }
}
