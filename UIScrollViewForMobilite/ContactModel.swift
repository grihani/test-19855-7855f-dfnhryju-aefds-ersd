//
//  ContactModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class ContactModel {
    let contactCreateSQL = "CREATE TABLE IF NOT EXISTS Contacts (idContact INTEGER NOT NULL, jobTitleContact TEXT, countryContact TEXT, civilityContact TEXT, firstNameContact TEXT, lastNameContact TEXT, typeContact TEXT, birthdateContact TEXT, phoneBusinessContact TEXT, phoneMobileContact TEXT, emailContact TEXT, preferredLanguageContact TEXT, workingAdressContact TEXT, linkedinProfileContact TEXT, idContact1 INTEGER, statusContact INTEGER, favoriteContact INTEGER, CONSTRAINT PK_Contacts PRIMARY KEY (idContact), FOREIGN KEY (idContact1) REFERENCES Contacts (idContact)); "
    
    var idContact: Int
    var jobTitleContact: String
    var countryContact: String
    var civilityContact: String
    var firstNameContact: String
    var lastNameContact: String
    var typeContact: String
    var birthdateContact: String
    var phoneBusinessContact: String
    var phoneMobileContact: String
    var emailContact: String
    var preferredLanguageContact: String
    var workingAdressContact: String
    var linkedinProfileContact: String
    var idContact1: Int
    var statusContact: Int
    var favoriteContact: Int
    
    init() {
        self.idContact = 0
        self.jobTitleContact = ""
        self.countryContact = ""
        self.civilityContact = ""
        self.firstNameContact = ""
        self.lastNameContact = ""
        self.typeContact = ""
        self.birthdateContact = ""
        self.phoneBusinessContact = ""
        self.phoneMobileContact = ""
        self.emailContact = ""
        self.preferredLanguageContact = ""
        self.workingAdressContact = ""
        self.linkedinProfileContact = ""
        self.idContact1 = 0
        self.statusContact = 0
        self.favoriteContact = 0
    }
    
    init(idContact: Int, jobTitleContact: String, countryContact: String, civilityContact: String, firstNameContact: String, lastNameContact: String, typeContact: String, birthdateContact: String, phoneBusinessContact: String, phoneMobileContact: String, emailContact: String, preferredLanguageContact: String, workingAdressContact: String, linkedinProfileContact: String, idContact1: Int, statusContact: Int, favoriteContact: Int) {
            self.idContact = idContact
            self.jobTitleContact = jobTitleContact
            self.countryContact = countryContact
            self.civilityContact = civilityContact
            self.firstNameContact = firstNameContact
            self.lastNameContact = lastNameContact
            self.typeContact = typeContact
            self.birthdateContact = birthdateContact
            self.phoneBusinessContact = phoneBusinessContact
            self.phoneMobileContact = phoneMobileContact
            self.emailContact = emailContact
            self.preferredLanguageContact = preferredLanguageContact
            self.workingAdressContact = workingAdressContact
            self.linkedinProfileContact = linkedinProfileContact
            self.idContact1 = idContact1
            self.statusContact = statusContact
            self.favoriteContact = favoriteContact
    }
    
    func arrayFromModel() -> [AnyObject] {
        return [
            self.jobTitleContact,
            self.countryContact,
            self.civilityContact,
            self.firstNameContact,
            self.lastNameContact,
            self.typeContact,
            self.birthdateContact,
            self.phoneBusinessContact,
            self.phoneMobileContact,
            self.emailContact,
            self.preferredLanguageContact,
            self.workingAdressContact,
            self.linkedinProfileContact,
            self.idContact1,
            self.statusContact,
            self.favoriteContact
        ]
    }
}