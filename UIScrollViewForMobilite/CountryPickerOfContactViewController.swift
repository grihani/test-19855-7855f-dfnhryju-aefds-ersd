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
    var chosenCountryButton = UIButton()
    var countryContact: String = ""
    
    @IBOutlet weak var countryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenCountry = countries
        countryContact = chosenCountry[0]
        chosenCountryButton.setTitle(countries[0], forState: .Normal)
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
                if (country.uppercaseString.rangeOfString(enteredText) != nil) {
                    chosenCountry.append(country)
                }
            }
        } else {
            chosenCountry = countries
        }
        countryPicker.reloadAllComponents()
        if chosenCountry != [] {
            chosenCountryButton.setTitle(chosenCountry[0], forState: .Normal)
            countryContact = chosenCountry[0]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryContact = chosenCountry[row]
        chosenCountryButton.setTitle(chosenCountry[row], forState: .Normal)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.countryContact.setTitle(self.countryContact, forState: .Normal)
        }
    }

}
