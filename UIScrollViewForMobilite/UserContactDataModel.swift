//
//  UserContactDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 28/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class UserContactDataModel {
    
    func insertUserContact(userContact: UserContactModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Users_Contacts (idUser,idContact) VALUES (?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: userContact.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
    
    func contactOfUser(idUser: Int) -> [ContactModel] {
        var contactsOfUser: [ContactModel] = []
        var querySQL = "SELECT * FROM Contacts WHERE idContact in (SELECT idContact FROM Users_Contacts WHERE idUser = \(idUser)) ORDER BY firstNameContact "
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var idContact: Int = Int(results.intForColumn("idContact"))
                var jobTitleContact: String = results.stringForColumn("jobTitleContact")
                var countryContact: String = results.stringForColumn("countryContact")
                var civilityContact: String = results.stringForColumn("civilityContact")
                var firstNameContact: String = results.stringForColumn("firstNameContact")
                var lastNameContact: String = results.stringForColumn("lastNameContact")
                var typeContact: String = results.stringForColumn("typeContact")
                var birthdateContact: String = results.stringForColumn("birthdateContact")
                var phoneBusinessContact: String = results.stringForColumn("phoneBusinessContact")
                var phoneMobileContact: String = results.stringForColumn("phoneMobileContact")
                var emailContact: String = results.stringForColumn("emailContact")
                var preferredLanguageContact: String = results.stringForColumn("preferredLanguageContact")
                var workingAdressContact: String = results.stringForColumn("workingAdressContact")
                var linkedinProfileContact: String = results.stringForColumn("linkedinProfileContact")
                var idContact1: Int = Int(results.intForColumn("idContact1"))
                
                var contact = ContactModel(idContact: idContact, jobTitleContact: jobTitleContact, countryContact: countryContact, civilityContact: civilityContact, firstNameContact: firstNameContact, lastNameContact: lastNameContact, typeContact: typeContact, birthdateContact: birthdateContact, phoneBusinessContact: phoneBusinessContact, phoneMobileContact: phoneMobileContact, emailContact: emailContact, preferredLanguageContact: preferredLanguageContact, workingAdressContact: workingAdressContact, linkedinProfileContact: linkedinProfileContact, idContact1: idContact1)
                
                contactsOfUser.append(contact)
            }
        }
        return contactsOfUser
    }
    
    func contactWithLastNameOrFirstName(lastName: String, firstName: String) -> [ContactModel] {
        var contacts: [ContactModel] = []
        var querySQl = "SELECT * FROM Contacts WHERE firstNameContact LIKE '%\(firstName)%' OR lastNameContact LIKE '%\(lastName)%' ORDER BY firstNameContact"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQl, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var idContact: Int = Int(results.intForColumn("idContact"))
                var jobTitleContact: String = results.stringForColumn("jobTitleContact")
                var countryContact: String = results.stringForColumn("countryContact")
                var civilityContact: String = results.stringForColumn("civilityContact")
                var firstNameContact: String = results.stringForColumn("firstNameContact")
                var lastNameContact: String = results.stringForColumn("lastNameContact")
                var typeContact: String = results.stringForColumn("typeContact")
                var birthdateContact: String = results.stringForColumn("birthdateContact")
                var phoneBusinessContact: String = results.stringForColumn("phoneBusinessContact")
                var phoneMobileContact: String = results.stringForColumn("phoneMobileContact")
                var emailContact: String = results.stringForColumn("emailContact")
                var preferredLanguageContact: String = results.stringForColumn("preferredLanguageContact")
                var workingAdressContact: String = results.stringForColumn("workingAdressContact")
                var linkedinProfileContact: String = results.stringForColumn("linkedinProfileContact")
                var idContact1: Int = Int(results.intForColumn("idContact1"))
                
                var contact = ContactModel(idContact: idContact, jobTitleContact: jobTitleContact, countryContact: countryContact, civilityContact: civilityContact, firstNameContact: firstNameContact, lastNameContact: lastNameContact, typeContact: typeContact, birthdateContact: birthdateContact, phoneBusinessContact: phoneBusinessContact, phoneMobileContact: phoneMobileContact, emailContact: emailContact, preferredLanguageContact: preferredLanguageContact, workingAdressContact: workingAdressContact, linkedinProfileContact: linkedinProfileContact, idContact1: idContact1)
                contacts.append(contact)
            }
        }
        return contacts
    }
}