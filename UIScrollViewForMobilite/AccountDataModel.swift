//
//  AccountDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountDataModel {
    
    func allAccountsAToZ() -> [AccountModel] {
        var allAccounts: [AccountModel] = []
        
        let dataBasePath = DataBase().readDataBasePath()
        let contactDB = FMDatabase(path: dataBasePath)
        
        if contactDB == nil {
            println("Error: \(contactDB.lastErrorMessage());\n")
        }
        if contactDB.open(){
            var querySQL = "SELECT * FROM Account  ORDER BY nameAccount"
            let results: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsInArray: nil)
            if let results = results {
                while results.next() == true {
                    var idAccount: Int = Int(results.intForColumn("idAccount"))
                    var nameAccount: String = results.stringForColumn("nameAccount")
                    var shortNameAccount: String = results.stringForColumn("shortNameAccount")
                    var leadSource: String = results.stringForColumn("leadSource")
                    var statusAccount: String = results.stringForColumn("statusAccount")
                    var industryAccount: String = results.stringForColumn("industryAccount")
                    var segmentAccount: String = results.stringForColumn("segmentAccount")
                    var websiteAccount: String = results.stringForColumn("websiteAccount")
                    var phoneAccount: String = results.stringForColumn("phoneAccount")
                    var faxAccount: String = results.stringForColumn("faxAccount")
                    var coverageAccount: String = results.stringForColumn("coverageAccount")
                    var regionAccount: String = results.stringForColumn("regionAccount")
                    var adressAccount: String = results.stringForColumn("adressAccount")
                    var idAccount1: Int = Int(results.intForColumn("idAccount1"))
                    var countryAccount: String = results.stringForColumn("countryAccount")
                
                    let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount)
                    
                    allAccounts.append(account)
                }
            }
            contactDB.close()
        } else {
            println("pas d'ouverture, Error: \(contactDB.lastErrorMessage());\n")
        }
        return allAccounts
    }
    
    func insertAccount (account : AccountModel) -> String {
        var erreur = String()
        let dataBasePath = DataBase().readDataBasePath()
        let contactDB = FMDatabase(path: dataBasePath)
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO Account (idAccount,nameAccount,shortNameAccount,leadSource,statusAccount,industryAccount,segmentAccount,websiteAccount,phoneAccount,faxAccount,coverageAccount,regionAccount,adressAccount,idAccount1,countryAccount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: account.arrayFromModel())
            
            if !result {
                erreur += "\n Error: \(contactDB.lastErrorMessage())"
            }
            
            
        } else {
            println("cannot open the database")
            erreur += "\n Error: \(contactDB.lastErrorMessage())"
        }
        return erreur
    }
    
    func checkEmptyAccount(dataBasePath: NSString) -> Bool {
        let contactDB = FMDatabase(path: dataBasePath)
        
        if contactDB == nil {
            println("contactDB == nil")
            println("Error: \(contactDB.lastErrorMessage());\n")
        }
        println("contactDB.open()")
        if contactDB.open(){
            var querySQL = "SELECT count(*) as COUNT FROM Account"
            let results: FMResultSet? = contactDB.executeQuery(querySQL, withArgumentsInArray: nil)
            if let results = results {
                while results.next() == true {
                    var count: Int = Int(results.intForColumn("COUNT"))
                    if count == 0 {
                        println("Accounts est vide")
                        return true
                    }
                }
            }
            contactDB.close()
        } else {
            println("pas d'ouverture, Error: \(contactDB.lastErrorMessage());\n")
        }
        println("Accounts n'est pas vide")
        return false
    }
}