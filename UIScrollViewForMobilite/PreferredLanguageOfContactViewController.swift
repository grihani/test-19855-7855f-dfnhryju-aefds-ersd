//
//  PreferredLanguageOfContactViewController.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 24/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import UIKit

class PreferredLanguageOfContactViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var languages = ["Arabic", "French", "English", "German", "Lestonian"]
    var chosenLanguages = [String]()
    var preferredLanguageContact: String = ""
    var preferredLanguage = UIButton()
    @IBOutlet weak var preferredLanguagePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenLanguages = languages
        if preferredLanguageContact == "" {
            preferredLanguageContact = languages[0]
        }
        if let index = find(chosenLanguages, preferredLanguageContact){
            preferredLanguagePicker.selectRow(index, inComponent: 0, animated: true)
        }
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
        return chosenLanguages.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return chosenLanguages[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        preferredLanguage.setTitle(chosenLanguages[row], forState: .Normal)
        preferredLanguageContact = chosenLanguages[row]
        if let presentingViewController = self.presentingViewController?.presenterViewController as? ContactDetailsViewController {
            presentingViewController.preferredLanguageContact.setTitle(self.preferredLanguageContact, forState: .Normal)
        }
    }
    
    @IBAction func chosenLanguages(sender: UITextField) {
        if sender.text != "" {
            chosenLanguages = []
            var enteredText = sender.text
            enteredText = enteredText.uppercaseString
            var indexesOfChoice = []
            for language in languages {
                if (language.uppercaseString.rangeOfString(enteredText) != nil) {
                    chosenLanguages.append(language)
                }
            }
        } else {
            chosenLanguages = languages
        }
        preferredLanguagePicker.reloadAllComponents()
        if (chosenLanguages != []) {
            preferredLanguage.setTitle(chosenLanguages[0], forState: .Normal)
            preferredLanguageContact = chosenLanguages[0]
        }
    }

}
