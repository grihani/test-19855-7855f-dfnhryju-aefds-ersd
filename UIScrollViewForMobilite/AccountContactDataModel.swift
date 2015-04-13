//
//  AccountContactDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountContactDataModel {
    
    func insertAccountContact(accountContact: AccountContactModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Account_Contacts (idAccount,idContact,roleContact) VALUES (?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: accountContact.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}