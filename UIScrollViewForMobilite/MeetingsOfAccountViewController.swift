//
//  MeetingsOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 09/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfAccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var meetingTableView: UITableView!
    @IBOutlet weak var calendarContainer: UIView!
    @IBOutlet weak var chosenDate: UILabel!
    @IBOutlet var buttonsForDays: [UIButton]!
    @IBOutlet var addMeetingDateButtons: [UIButton]!
    @IBOutlet weak var addDateMeeting: UIButton!
    @IBOutlet weak var accountsIHaveMeetingsWithOnDay: UITextView!
    
    var meetings: [MeetingModel] = []
    var daysOfCalendar: [NSDate] = []
    var account: AccountModel!
    var dateFormatter: NSDateFormatter = NSDateFormatter()
    let calendar = NSCalendar.currentCalendar()
    var viewDidItsLayout = false
    var meetingsState: [(Int,Int)] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("view meetings did load")
        if account != nil {
            meetings = MeetingDataModel().meetingsOfAccount(account: account)
        }
        let today = NSDate()
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .FullStyle
        self.chosenDate.text = dateFormatter.stringFromDate(today)
    }
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayout {
            self.daysOfCalendar = arrayOfDates()
            println("viewDidLayoutSubviews")
            viewDidItsLayout = true
            colorButtons(NSDate())
            checkForNumberOfMeetings(date: NSDate())
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func checkForMeetings(sender: UIButton) {
        let indexOfDate = find(buttonsForDays, sender)
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .FullStyle
        let chosenDate = dateFormatter.stringFromDate(daysOfCalendar[indexOfDate!])
        self.chosenDate.text = chosenDate
        colorButtons(daysOfCalendar[indexOfDate!])
        checkForNumberOfMeetings(date: daysOfCalendar[indexOfDate!])
        self.addDateMeeting.setTitle(chosenDate, forState: .Normal)
        if self.meetingsState[indexOfDate!].0 == 0 {
            accountsIHaveMeetingsWithOnDay.text = "You have no meeting on this day"
        } else if self.meetingsState[indexOfDate!].1 == 1 {
            accountsIHaveMeetingsWithOnDay.text = "You have a meeting for the whole day"
        } else {
            accountsIHaveMeetingsWithOnDay.text = "You have " + String(self.meetingsState[indexOfDate!].0) + " meetings during this day"
        }
    }
    
    @IBAction func addANewMeetingOnDate(sender: UIButton) {
        println("button is enabled")
    }
    
    @IBAction func addANewMeetingWithoutDate(sender: UIButton) {
        
    }
    
    func arrayOfDates() -> [NSDate]  {
        var dates: [NSDate] = []
        let today = NSDate()
        self.dateFormatter.dateFormat = "d"
        var dateComponents = self.calendar.components(.WeekdayCalendarUnit, fromDate: today)
        let firstDayOfWeek = calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay,
            value: (-dateComponents.weekday),
            toDate: today,
            options: .MatchNextTime)
        var i = 0
        var dayToShow = firstDayOfWeek
        for button in buttonsForDays {
            dayToShow = calendar.dateByAddingUnit(.CalendarUnitDay,
                value: 1,
                toDate: dayToShow!,
                options: .MatchNextTime)
            let stringFromDate = dateFormatter.stringFromDate(dayToShow!)
            button.setTitle(stringFromDate, forState: UIControlState.Normal)
            if let dayToShow = dayToShow {
                dates.append(dayToShow)
                println(dayToShow)
            }
            checkForNumberOfMeetings(date: dayToShow!, button: button)
        }
        return dates
    }
    
    func checkForNumberOfMeetings(#date: NSDate, button: UIButton) {
        let (numberOfMeetings, allDayMeeting) = MeetingDataModel().numberOfMeetingsInDay(date)
        self.meetingsState.append((numberOfMeetings, allDayMeeting))
        var frame = button.frame
        if allDayMeeting == 1 {
            var labelNumberOfMeetings = UILabel(frame: frame)
            labelNumberOfMeetings.layer.masksToBounds = true
            labelNumberOfMeetings.layer.cornerRadius = 20
            labelNumberOfMeetings.backgroundColor = UIColor.orangeColor()
            labelNumberOfMeetings.alpha = 0.2
            calendarContainer.addSubview(labelNumberOfMeetings)
        } else if numberOfMeetings > 0 {
            frame.size.width -= 30
            frame.size.height -= 25
            frame.origin.x += 30
            var labelNumberOfMeetings = UILabel(frame: frame)
            labelNumberOfMeetings.font = UIFont(name: labelNumberOfMeetings.font.fontName, size: 10)
            labelNumberOfMeetings.textColor = UIColor.blackColor()
            labelNumberOfMeetings.text = String(numberOfMeetings)
            calendarContainer.addSubview(labelNumberOfMeetings)
        }
    }
    
    func checkForNumberOfMeetings(#date: NSDate) {
        let (numberOfMeetings, allDayMeeting) = MeetingDataModel().numberOfMeetingsInDay(date)
        if allDayMeeting == 1 {
            for button in self.addMeetingDateButtons {
                button.enabled = false
                button.tintColor = UIColor.grayColor()
            }
        } else {
            for button in self.addMeetingDateButtons {
                button.enabled = true
                button.tintColor = blueButtonColor
            }
        }
    }
    func colorButtons(date: NSDate) {
        var i = 0
        var dateIndex = 0
        dateFormatter.dateFormat = "yyyy-MM-dd"
        for button in buttonsForDays {
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 20
            button.tintColor = blackColor
            button.backgroundColor = whiteColor
            if dateFormatter.stringFromDate(date) == dateFormatter.stringFromDate(self.daysOfCalendar[i]) {
                dateIndex = i
            }
            i++
        }
        self.buttonsForDays[dateIndex].backgroundColor = blueCheckedColor
        self.buttonsForDays[dateIndex].tintColor = whiteColor
    }
    
    // Mark: - TableViewDelegate
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return meetings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("meetingsAccount", forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        tableView.rowHeight = 72
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .FullStyle
        
        var dateBeginMeeting = Dates().fromSQLiteDayToDate(meetings[row].dateBeginMeeting)
        if let dateBeginMeeting = dateBeginMeeting {
            let stringFromDateBeginMeeting = dateFormatter.stringFromDate(dateBeginMeeting)
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.text = stringFromDateBeginMeeting + " : \n" + meetings[row].subjectMeeting
        }
        return cell
    }
}
