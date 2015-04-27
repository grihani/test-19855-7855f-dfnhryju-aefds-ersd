//
//  TypologyOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 24/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class TypologyOfContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var typology = ["Manager", "Sales", "Other"]
    var chosenTypology: String! {
        didSet {
            if chosenTypology == "" {
                chosenTypology = nil
                typologyOfContact.setTitle(typology[0], forState: .Normal)
            }
        }
    }
    var typologyOfContact: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        chosenTypology = chosenTypology ?? typology[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typology.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return typology[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typologyOfContact.setTitle(typology[row], forState: .Normal)
        chosenTypology = typology[row]
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.typeContact = chosenTypology
        }
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
