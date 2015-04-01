//
//  ContactDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class ContactDataModel {
    
    func insertContact (contact: ContactModel) -> String {
        println("inserting Into ContactModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Contacts (jobTitleContact,countryContact,civilityContact,firstNameContact,lastNameContact,typeContact,birthdateContact,phoneBusinessContact,phoneMobileContact,emailContact,preferredLanguageContact,workingAdressContact,linkedinProfileContact,idContact1) VALUES (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: contact.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}