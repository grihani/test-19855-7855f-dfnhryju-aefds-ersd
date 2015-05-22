//
//  MeetingsOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 20/05/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class MeetingsOfContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var chosenDate: UILabel!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet var buttonsForDays: [UIButton]!
    @IBOutlet weak var titleToolbar: UIBarButtonItem! {
        didSet {
            titleToolbar.title = "Chosen day's meetings"
            titleToolbar.tintColor = UIColor.blackColor()
        }
    }
    
    @IBOutlet weak var addMeetingButton: UIBarButtonItem!
    @IBOutlet weak var meetingsTableView: UITableView! {
        didSet {
            meetingsTableView.dataSource = self
            meetingsTableView.delegate = self
        }
    }
    
    // MARK: - Constants
    let dateFormatter: NSDateFormatter = NSDateFormatter()
    let calendar = NSCalendar.currentCalendar()
    
    // MARK: - Variables
    var contact: ContactModel! {
        didSet {
            updateMeetings()
        }
    }
    
    var meetings: [MeetingModel]! {
        didSet {
            meetingsTableView?.reloadData()
        }
    }
    
    var dateToSendToPopover = NSDate()
    var daysOfCalendar: [NSDate] = []
    
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
//        for button in buttonsForDays {
//            dayToShow = calendar.dateByAddingUnit(.CalendarUnitDay,
//                value: 1,
//                toDate: dayToShow!,
//                options: .MatchNextTime)
//            let stringFromDate = dateFormatter.stringFromDate(dayToShow!)
//            button.setTitle(stringFromDate, forState: UIControlState.Normal)
//            if let dayToShow = dayToShow {
//                dates.append(dayToShow)
//            }
//            checkForNumberOfMeetings(date: dayToShow!, button: button)
//        }
        return dates
    }
    
    var meetingsState: [(Int,Int)] = []
    
    var datePicked = NSDate()
    
    let widthPopover = CGFloat(800)
    let heightPopover = CGFloat(500)
    
    var viewDidItsLayout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let today = NSDate()
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .FullStyle
        //self.chosenDate.text = dateFormatter.stringFromDate(today)
        meetings = MeetingDataModel().allMeetings(fromDate: today, toDate: today)
        println(daysOfCalendar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayout {
            self.daysOfCalendar = arrayOfDates()
            viewDidItsLayout = true
            //colorButtons(NSDate())
            //checkForNumberOfMeetings(date: NSDate())
        }
    }
    
    func updateMeetings() {
        if contact == nil {
            account = AccountDataModel().accountOfNextMeeting()
        }
        destinationTableViewController?.meetings = MeetingDataModel().meetingsOfAccount(account: account)
    }
    
    // MARK: - IBActions
    
//    @IBAction func checkForMeetings(sender: UIButton) {
//        let indexOfDate = find(buttonsForDays, sender)
//        if let indexOfDate = indexOfDate {
//            dateFormatter.timeStyle = .NoStyle
//            dateFormatter.dateStyle = .FullStyle
//            let chosenDate = dateFormatter.stringFromDate(daysOfCalendar[indexOfDate])
//            self.dateToSendToPopover = daysOfCalendar[indexOfDate]
//            self.datePicked = daysOfCalendar[indexOfDate]
//            self.chosenDate.text = chosenDate
//            colorButtons(daysOfCalendar[indexOfDate])
//            checkForNumberOfMeetings(date: daysOfCalendar[indexOfDate])
//            meetings = MeetingDataModel().allMeetings(fromDate: daysOfCalendar[indexOfDate], toDate: daysOfCalendar[indexOfDate])
//        }
//    }
    
    // MARK: - Functions
    
//    func checkForNumberOfMeetings(#date: NSDate, button: UIButton) {
//        let (numberOfMeetings, allDayMeeting) = MeetingDataModel().numberOfMeetingsInDay(date)
//        self.meetingsState.append((numberOfMeetings, allDayMeeting))
//        var frame = button.frame
//        if allDayMeeting == 1 {
//            var labelNumberOfMeetings = UILabel(frame: frame)
//            labelNumberOfMeetings.layer.masksToBounds = true
//            labelNumberOfMeetings.layer.cornerRadius = 20
//            labelNumberOfMeetings.backgroundColor = UIColor.orangeColor()
//            labelNumberOfMeetings.alpha = 0.2
//            calendarView.addSubview(labelNumberOfMeetings)
//        } else if numberOfMeetings > 0 {
//            frame.size.width -= 30
//            frame.size.height -= 25
//            frame.origin.x += 30
//            var labelNumberOfMeetings = UILabel(frame: frame)
//            labelNumberOfMeetings.font = UIFont(name: labelNumberOfMeetings.font.fontName, size: 10)
//            labelNumberOfMeetings.textColor = UIColor.blackColor()
//            labelNumberOfMeetings.text = String(numberOfMeetings)
//            calendarView.addSubview(labelNumberOfMeetings)
//        }
//    }
    
//    func checkForNumberOfMeetings(#date: NSDate) {
//        let (numberOfMeetings, allDayMeeting) = MeetingDataModel().numberOfMeetingsInDay(date)
//        if allDayMeeting == 1 {
//            addMeetingButton.enabled = false
//        } else {
//            addMeetingButton.enabled = true
//        }
//    }
    
    func colorButtons(date: NSDate) {
        var i = 0
        var dateIndex = 0
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        for button in buttonsForDays {
//            button.layer.masksToBounds = true
//            button.layer.cornerRadius = 20
//            button.tintColor = blackColor
//            button.backgroundColor = whiteColor
//            if dateFormatter.stringFromDate(date) == dateFormatter.stringFromDate(self.daysOfCalendar[i]) {
//                dateIndex = i
//            }
//            i++
//        }
//        self.buttonsForDays[dateIndex].backgroundColor = blueCheckedColor
//        self.buttonsForDays[dateIndex].tintColor = whiteColor
    }
    
    // MARK: - talbeViewDataSource
    
    private struct cellIdentifiers {
        static let meetingsOfDay = "meetings of day x"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiers.meetingsOfDay, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = meetings[indexPath.row].subjectMeeting
        cell.detailTextLabel?.text = fromSQLiteDateToFullyCustomizedDateOnSwift(meetings[indexPath.row].dateBeginMeeting)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func fromSQLiteDateToFullyCustomizedDateOnSwift(date: String) -> String {
        var customDateString = ""
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateFromString = dateFormatter.dateFromString(date)
        if dateFromString != nil {
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = .ShortStyle
            customDateString = dateFormatter.stringFromDate(dateFromString!)
        } else {
            customDateString = "Please contact the developper"
        }
        
        return customDateString
    }
}
