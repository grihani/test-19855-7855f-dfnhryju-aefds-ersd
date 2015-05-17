//
//  HomepageUserViewController.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MessageUI

class HomepageUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    var idUser: Int = 0
    
    @IBOutlet weak var meetingTableView: UITableView!
    
    @IBOutlet weak var chosenDate: UILabel!
    @IBOutlet var buttonsForDays: [UIButton]!
    @IBOutlet weak var calendarContainer: UIView!
    
    var meetings: [MeetingModel] = []
    var daysOfCalendar: [NSDate] = []
    var meetingsState: [(Int,Int)] = []
    
    let dateFormatter: NSDateFormatter = NSDateFormatter()
    var datePicked = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var viewDidItsLayout = false
    var email: String = ""

    @IBOutlet weak var contactsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var userModel = UserDataModel().getUserWithIdUser(idUser)
        navigationItem.title = "Hello, Benjamin Amsaleg"
        var today = NSDate()
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .FullStyle
        self.chosenDate.text = dateFormatter.stringFromDate(today)
        meetings = MeetingDataModel().allMeetings(fromDate: today, toDate: today)
    }
    
    @IBOutlet weak var rightPanelContainer: UIView!
    var verifyHidden = false
    
    var hidden: Bool = false
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        if !viewDidItsLayout {
            self.daysOfCalendar = arrayOfDates()
            viewDidItsLayout = true
            colorButtons(NSDate())
        }
    }
    
    var viewDidItsAppearance = false
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !viewDidItsAppearance {
            hidePanels()
            viewDidItsAppearance = true
        }
    }
    
    func hidePanels() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.rightPanelContainer.center.x += 400
            self.rightPanelControl.center.x -= 50
            self.languetteToHideRightPanel.center.x += 400
            self.photoContainer.center.x = self.view.center.x
        })
    }
    
    @IBOutlet weak var photoContainer: UIView!
    @IBOutlet weak var languetteToHideRightPanel: UIView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showContactSegue" {
//            if let destinationVC = (segue.destinationViewController as UINavigationController).topViewController as? ContactViewController {
//                destinationVC.idUser = self.idUser
//            }
        }
    }
    
    @IBOutlet var showingTheRightPanel: UITapGestureRecognizer!
    @IBOutlet var hidingTheRightPanel: UITapGestureRecognizer!
    @IBOutlet weak var rightPanelControl: UIView!
    var didHideRightPanel = true
    @IBAction func showPanelContainer(sender: UITapGestureRecognizer) {
        if sender == showingTheRightPanel {
            if didHideRightPanel {
                didHideRightPanel = false
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.rightPanelContainer.center.x -= 400
                    self.rightPanelControl.center.x += 50
                    self.photoContainer.center.x -= 198
                    self.languetteToHideRightPanel.center.x -= 400
                })
            }
        }
    }
    @IBAction func hidePanelContainer(sender: UITapGestureRecognizer) {
        if sender == hidingTheRightPanel {
            if !didHideRightPanel {
                didHideRightPanel = true
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.rightPanelContainer.center.x += 400
                    self.rightPanelControl.center.x -= 50
                    self.photoContainer.center.x = self.view.center.x
                    self.languetteToHideRightPanel.center.x += 400
                })
            }
        }
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
            }
            self.checkForNumberOfMeetings(date: dayToShow!, button: button)
        }
        return dates
    }
    
    @IBAction func checkForMeetings(sender: UIButton) {
        let indexOfDate = find(buttonsForDays, sender)
        dateFormatter.timeStyle = .NoStyle
        dateFormatter.dateStyle = .FullStyle
        let chosenDate = dateFormatter.stringFromDate(daysOfCalendar[indexOfDate!])
        self.datePicked = daysOfCalendar[indexOfDate!]
        self.chosenDate.text = chosenDate
        colorButtons(daysOfCalendar[indexOfDate!])
        meetings = MeetingDataModel().allMeetings(fromDate: self.datePicked, toDate: self.datePicked)
        self.meetingTableView.reloadData()
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

    @IBAction func mailButtonPressed(sender: AnyObject) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([self.email])
        mailComposerVC.setSubject("")
        mailComposerVC.setMessageBody("", isHTML: false)
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device couldn't send email.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: - MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - TableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetings.count
    }
    
    // MARK: - TableViewDelegate
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("meetingsUser", forIndexPath: indexPath) as UITableViewCell
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - hiding subviews
    @IBOutlet weak var positionForLanguette: NSLayoutConstraint!
    @IBOutlet weak var positionForRightPanelContainerView: NSLayoutConstraint!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    

}
