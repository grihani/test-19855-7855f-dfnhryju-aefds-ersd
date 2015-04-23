//
//  CivilityPickerViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class CivilityPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverPresentationControllerDelegate {
    
    var civility = ["Mr","Mrs","Miss"]
    @IBOutlet weak var civilityPicker: UIPickerView!
    var civilityButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        civilityButton.setTitle(civility[0], forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return civility.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return civility[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        civilityButton.setTitle(civility[row], forState: .Normal)
    }
}
