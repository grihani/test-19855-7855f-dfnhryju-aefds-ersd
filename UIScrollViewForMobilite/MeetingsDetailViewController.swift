//
//  MeetingsDetailViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 05/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsDetailViewController: UIViewController {
    
    // MARK: - Model for the view
    var meeting: MeetingModel! {
        didSet {
            subjectMeeting?.text = meeting.subjectMeeting
            regardingMeeting?.text = meeting.regardingMeeting
            dateBeginMeeting?.text = meeting.dateBeginMeeting
            durationMeeting?.text = calculateDurationOfMeeting(meeting: meeting)
            adressMeeting?.text = meeting.adressMeeting
            descriptionMeeting?.text = meeting.descriptionMeeting
        }
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var subjectMeeting: UILabel!
    @IBOutlet weak var regardingMeeting: UILabel!
    @IBOutlet weak var dateBeginMeeting: UILabel!
    @IBOutlet weak var durationMeeting: UILabel!
    @IBOutlet weak var adressMeeting: UILabel!
    @IBOutlet weak var descriptionMeeting: UITextView!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let meeting = meeting {
            subjectMeeting.text = meeting.subjectMeeting
            regardingMeeting.text = meeting.regardingMeeting
            dateBeginMeeting.text = fromSQLiteDateToFullyCustomizedDateOnSwift(meeting.dateBeginMeeting)
            durationMeeting?.text = calculateDurationOfMeeting(meeting: meeting)
            adressMeeting.text = meeting.adressMeeting
            descriptionMeeting.text = meeting.descriptionMeeting
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func fromSQLiteDateToFullyCustomizedDateOnSwift(date: String) -> String {
        var customDateString = ""
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateFromString = dateFormatter.dateFromString(date)
        if dateFromString != nil {
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            dateFormatter.timeStyle = .ShortStyle
            customDateString = dateFormatter.stringFromDate(dateFromString!)
        } else {
            customDateString = "Please contact the developper"
        }
        return customDateString
    }
    func calculateDurationOfMeeting(#meeting: MeetingModel) -> String {
        if meeting.allDayMeeting == 1 {
            return "Whole day meeting"
        }
        else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
            let dateBeginMeeting = dateFormatter.dateFromString(meeting.dateBeginMeeting)
            let dateEndMeeting = dateFormatter.dateFromString(meeting.dateEndMeeting)
            if dateBeginMeeting != nil && dateEndMeeting != nil {
                let secondsBetweenDates = dateEndMeeting?.timeIntervalSinceDate(dateBeginMeeting!)
                let numberOfHours = Int(secondsBetweenDates! % 3600)
                let numberOfMinutes = Int(secondsBetweenDates! % 60)
                var stringForDuration = ""
                if numberOfHours != 0 && numberOfMinutes != 0 {
                    stringForDuration += "\(numberOfHours) hours and \(numberOfMinutes) minutes"
                } else if numberOfHours != 0 {
                    stringForDuration += "\(numberOfHours) hours"
                } else if numberOfMinutes != 0 {
                    stringForDuration += "\(numberOfMinutes) minutes"
                } else {
                    stringForDuration += "No duration was specified"
                }
            }
        }
        return "The dates are not well formatted"
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show participants of meeting" {
            let destinationViewController = segue.destinationViewController as! ParticipantsOfMeetingOfAccountTableViewController
            destinationViewController.meeting = meeting
        }
    }
    

}
