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
    
    func listeNameAccountOfContact() -> [(idAccount: Int, nameAccount: String)] {
        var res: [(idAccount: Int, nameAccount: String)] = []
        DataBase().createViewForContactsThatHaveAccounts()
        var querySQL = "SELECT Account.idAccount, Account.nameAccount FROM Account INNER JOIN Contact_Account ON Account.idAccount = Contact_Account.idAccount GROUP BY Account.nameAccount"
        var results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = results {
            while result.next() {
                var idAccount: Int = Int(result.intForColumn("idAccount"))
                var nameAccount: String = result.stringForColumn("nameAccount")
                res += [(idAccount: idAccount, nameAccount: nameAccount)]
            }
        }
        
        return res
    }
    
    func listeAccountForContact(idContact: Int) -> [Int] {
        var idAccount: [Int] = []
        DataBase().createViewForContactsThatHaveAccounts()
        var querySQL = "SELECT idAccount FROM Contact_Account WHERE idContact = \(idContact)"
        var results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = results {
            while result.next() {
                var idTemp: Int = Int(result.intForColumn("idAccount"))
                idAccount.append(idTemp)
            }
        }
        
        return idAccount
    }
}