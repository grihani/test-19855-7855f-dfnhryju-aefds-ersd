//
//  CountryPickerOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 23/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class CountryPickerOfContactViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var countries = ["Morocco", "France", "Spain", "Germany", "Great Britain", "Portugal"]
    var chosenCountry = [String]()
    @IBOutlet weak var chosenCountryLabel: UILabel!
    
    @IBOutlet weak var countryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenCountry = countries
        chosenCountryLabel.text = chosenCountry[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return chosenCountry.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return chosenCountry[row]
    }
    
    @IBAction func enteringNameForSearch(sender: UITextField) {
        if sender.text != "" {
            chosenCountry = []
            var enteredText = sender.text
            enteredText = enteredText.uppercaseString
            var indexesOfChoice = []
            for country in countries {
                println(country)
                if (country.uppercaseString.rangeOfString(enteredText) != nil) {
                    chosenCountry.append(country)
                }
            }
        } else {
            chosenCountry = countries
        }
        chosenCountryLabel.text = chosenCountry[0]
        countryPicker.reloadAllComponents()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenCountryLabel.text = chosenCountry[row]
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
