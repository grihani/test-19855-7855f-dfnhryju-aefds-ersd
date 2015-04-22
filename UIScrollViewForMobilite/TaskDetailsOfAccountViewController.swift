//
//  TaskDetailsOfAccountViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 22/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class TaskDetailsOfAccountViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let dateFormatter = NSDateFormatter()
    var task: TaskModel!
    var account: AccountModel!
    @IBOutlet weak var subjectTask: UITextField!
    @IBOutlet weak var dateTask: UIDatePicker!
    @IBOutlet weak var statusTask: UIPickerView!
    var status = ["NO", "MAY BE", "GOOD", "GOT IT"]
    var indexOfStatus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task != nil {
            initiateOutlets()
        }
    }
    
    func initiateOutlets() {
        self.subjectTask.text = task.subjectTask
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateOfTask = dateFormatter.dateFromString(task.dateTask)
        if let dateOfTask = dateOfTask {
            self.dateTask.date = dateOfTask
        }
        self.indexOfStatus = find(status, task.statusTask.uppercaseString)!
        statusTask.selectRow(self.indexOfStatus, inComponent: 0, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopover(sender: UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return status.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return status[row]
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
