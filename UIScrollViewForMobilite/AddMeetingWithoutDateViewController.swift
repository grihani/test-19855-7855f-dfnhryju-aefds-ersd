//
//  AddMeetingWithoutDateViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 13/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit
import MapKit

class AddMeetingWithoutDateViewController: UIViewController, MKMapViewDelegate, UITextViewDelegate, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let dateFormatter = NSDateFormatter()
    
    var geocoder = CLGeocoder()
    
    var account: AccountModel!
    var date: NSDate!
    var locationManager = CLLocationManager()
    var viewDidItsLayouts = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var searchForMeetingsInDay = MeetingDataModel().allMeetings(fromDate: date, toDate: date)
        var accountsForMeetingsInDay = AccountDataModel().accountsMetOnDate(date: date)
        
//        var dictionaryOfAddresses: [String] = ["8 rue pierre curie, 92600, Asnieres sur seine", "10 place des vosges, 92400, Courbevoie"]
        var i = 0
        for address in searchForMeetingsInDay {
            var geocoder = CLGeocoder()
            geocoder.geocodeAddressString(address.adressMeeting, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                if let placemark = placemarks?[0] as? CLPlacemark {
                    if placemark.location != nil {
                        let span = MKCoordinateSpanMake(0.1, 0.1)
                        let region = MKCoordinateRegionMake(placemark.location.coordinate, span)
                        self.mapView.setRegion(region, animated: false)
                        let annotation = MKPointAnnotation()
                        annotation.setCoordinate(placemark.location.coordinate)
                        annotation.title = accountsForMeetingsInDay[i].nameAccount
                        annotation.subtitle = "From " + address.dateBeginMeeting + " To " + address.dateEndMeeting
                        self.mapView.addAnnotation(annotation)
                        self.mapView.selectAnnotation(annotation, animated: true)
                    }
                }
            })
            i++
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    // Mark : - Table view data source
    
    let identifiersForTableView = ["subject", "Address", "dateBeginMeeting", "pickerMeeting", "wholeDay", "durationMeeting", "pickerForDuration", "Contacts", "save"]
    var pickerForDateBeginIsShown = false
    var cellSubject = CellWithTextField()
    var cellAdress = CellWithTextView()
    var cellForEnteringDateBeginMeeting = CellForEnteringDateBeginMeeting()
    var cellForDateBeginMeetingPicker = CellForDateBeginMeetingPicker()
    var cellForWholeDayMeeting = CellForWholeDayMeeting()
    var cellForDurationOfMeeting = CellForDurationOfTheMeeting()
    var cellForDurationPicker = CellForPickerForDuration()
    var cellForContacts = CellForContacts()
    var switchIsOn = false
    var pickerForDurationIsShown = false
    
    @IBOutlet weak var tableViewForAddingAMeeting: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiersForTableView.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        let row = indexPath.row
        let identifier = identifiersForTableView[row]
        if row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellWithTextField
            self.cellSubject = cell
            return cell
        }
        else if row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellWithTextView
            cellAdress = cell
            return cell
        }
        else if row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForEnteringDateBeginMeeting
            cell.setDateBeginMeeting(self.date)
            cellForEnteringDateBeginMeeting = cell
            return cell
        }
        else if row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForDateBeginMeetingPicker
            if !pickerForDateBeginIsShown{
                cell.datePickerBeginMeeting.alpha = 0
            } else {
                cell.datePickerBeginMeeting.alpha = 1
            }
            cell.cellForEnteringDateBeginMeeting = self.cellForEnteringDateBeginMeeting
            cellForDateBeginMeetingPicker = cell
            return cell
        }
        else if row == 4 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForWholeDayMeeting
            self.cellForWholeDayMeeting = cell
            return cell
        }
        else  if row == 5 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForDurationOfTheMeeting
            if !switchIsOn {
                cell.durationOfTheMeeting.alpha = 1
            } else {
                cell.durationOfTheMeeting.alpha = 0
            }
            cellForDurationOfMeeting = cell
            return cell
        }
        else if row == 6 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForPickerForDuration
            cell.cellForDurationOfMeeting = cellForDurationOfMeeting
            cell.pickerForDuration.dataSource = cell
            cell.pickerForDuration.delegate = cell
            cellForDurationPicker = cell
            return cell
        }
        else if row == 7 {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as CellForContacts
            cell.tableViewForContacts.dataSource = cell
            cell.tableViewForContacts.delegate = cell
            cell.tableViewForContacts.editing = true
            cell.contacts = ContactDataModel().contactsOfAccount(account: self.account)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 2:
            if !pickerForDateBeginIsShown {
                pickerForDateBeginIsShown = true
            } else {
                pickerForDateBeginIsShown = false
            }
        case 5:
            if !pickerForDurationIsShown {
                pickerForDurationIsShown = true
            } else {
                pickerForDurationIsShown = false
            }
        default:
            break
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0.01
        switch indexPath.row {
        case 3:
            if pickerForDateBeginIsShown {
                height = 162
                
            } else {
                height = 0.01
            }
        case 5:
            if !switchIsOn {
                height = 44
            } else {
                height = 0.01
            }
        case 6:
            if switchIsOn || !pickerForDurationIsShown {
                height = 0.01
            } else {
                height = 162
            }
        case 7:
            height = 152
        default:
            height = 44
        }
        return height
    }
    
    @IBAction func wholeDayToggled(sender: UISwitch) {
        let indexPathDuration = NSIndexPath(forRow: 5, inSection: 0)
        let cellDuration = self.tableViewForAddingAMeeting.cellForRowAtIndexPath(indexPathDuration)
        let indexPathPicker = NSIndexPath(forRow: 6, inSection: 0)
        let cellPicker = self.tableViewForAddingAMeeting.cellForRowAtIndexPath(indexPathPicker)
        switch sender.on {
        case true:
            switchIsOn = true
        case false:
            switchIsOn = false
        default: break
        }
        self.tableViewForAddingAMeeting.reloadData()
    }
    @IBAction func save(sender: UIButton) {
        saveMeeting()
    }
    func saveMeeting() {
        println(cellSubject.returnSubject())
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}

class CellWithTextField: UITableViewCell {
    @IBOutlet weak var subjectMeeting: UITextField!
    
    func returnSubject() -> String {
        return subjectMeeting.text
    }
}

class CellWithTextView: UITableViewCell {
    @IBOutlet weak var addressMeeting: UITextView!
    func returnAdressMeeting() -> String {
        return addressMeeting.text
    }
}

class CellForEnteringDateBeginMeeting: UITableViewCell {
    
    @IBOutlet weak var dateBeginMeeting: UILabel!
    func setDateBeginMeeting(date: NSDate) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        self.dateBeginMeeting.text = dateFormatter.stringFromDate(date)
    }
}

class CellForDateBeginMeetingPicker : UITableViewCell{
    var cellForEnteringDateBeginMeeting: CellForEnteringDateBeginMeeting!
    let dateFormatter = NSDateFormatter()
    @IBOutlet weak var datePickerBeginMeeting: UIDatePicker!
    func returnDatePicked() -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.stringFromDate(datePickerBeginMeeting.date)
    }
    
    @IBAction func changeDate(sender: UIDatePicker) {
        self.cellForEnteringDateBeginMeeting.setDateBeginMeeting(sender.date)
    }
}

class CellForWholeDayMeeting: UITableViewCell {
    @IBOutlet weak var wholeDaySwitch: UISwitch!
}

class CellForDurationOfTheMeeting: UITableViewCell {
    @IBOutlet weak var durationOfTheMeeting: UILabel!
}

class CellForPickerForDuration: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerForDuration: UIPickerView!
    var cellForDurationOfMeeting: CellForDurationOfTheMeeting!
    let minutes = [0,5,10,15,20,25,30,35,40,45,50,55]
    let hours = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        } else {
            return minutes.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0 {
            return String(hours[row])
        } else {
            return String(minutes[row])
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let rowHour = pickerView.selectedRowInComponent(0)
        let rowMinutes = pickerView.selectedRowInComponent(1)
        let duration = String(hours[rowHour]) + " hours and " + String(minutes[rowMinutes]) + " minutes "
        cellForDurationOfMeeting.durationOfTheMeeting.text = duration
    }
}

class CellForContacts: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewForContacts: UITableView!
    var contacts: [ContactModel] = []
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactNames") as UITableViewCell
        let row = indexPath.row
        let contactsOfAccount = contacts[row]
        cell.textLabel?.text = contactsOfAccount.firstNameContact + " " + contactsOfAccount.lastNameContact
        return cell
    }
}