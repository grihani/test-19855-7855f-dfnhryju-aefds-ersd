//
//  ContactDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class ContactDataModel {
    
    //ASC for ascendant, DESC for descendant
    func contactsOfAccount(#account: AccountModel) -> [ContactModel] {
        var contactsOfAccount: [ContactModel] = []
        
        var querySQL = "SELECT * FROM Contacts WHERE idContact in (SELECT idContact FROM Account_Contacts WHERE idAccount = \(account.idAccount)) ORDER BY firstNameContact "
        println(querySQL)
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
                
                contactsOfAccount.append(contact)
            }
        }
        return contactsOfAccount
    }
    
    func insertContact(contact: ContactModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Contacts (jobTitleContact,countryContact,civilityContact,firstNameContact,lastNameContact,typeContact,birthdateContact,phoneBusinessContact,phoneMobileContact,emailContact,preferredLanguageContact,workingAdressContact,linkedinProfileContact,idContact1) VALUES (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: contact.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}