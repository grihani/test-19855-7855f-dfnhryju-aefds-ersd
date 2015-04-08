//
//  AccountDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountDataModel {
    
    //ASC for ascendant, DESC for descendant
    func allAccountsAToZ(order: String) -> [AccountModel] {
        println("getting All Accounts")
        var allAccounts: [AccountModel] = []
        
        var querySQL = "SELECT * FROM Account  ORDER BY nameAccount "
        querySQL += order
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
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
        return allAccounts
    }
    
    func accountsPerMeeting() -> [AccountModel] {
        var accountsPerMeeting: [AccountModel] = []
        
        DataBase().createViewForAccountsThatHaveMeetings()
        println("getting the Accounts who do have meetings")
        var querySQL = "SELECT DISTINCT idAccount, nameAccount, shortNameAccount, leadSource, statusAccount, industryAccount, segmentAccount, websiteAccount, phoneAccount, faxAccount, coverageAccount, regionAccount, adressAccount, idAccount1, countryAccount FROM Account_Contact_Meeting"
        var results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
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
                
                accountsPerMeeting.append(account)
            }
            println("got the accounts that have meetings, now to the rest of them")
        }
        querySQL = "SELECT * FROM Account WHERE idAccount NOT IN (SELECT idAccount FROM Account_Contact_Meeting) ORDER BY nameAccount"
        results = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
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
                
                accountsPerMeeting.append(account)
            }
            println("got the accounts that don't have meetings")
        }
        return accountsPerMeeting
    }
    
    
    
    func insertAccount(account : AccountModel) -> String {
        println("inserting Into AccountModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Account (nameAccount,shortNameAccount,leadSource,statusAccount,industryAccount,segmentAccount,websiteAccount,phoneAccount,faxAccount,coverageAccount,regionAccount,adressAccount,idAccount1,countryAccount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: account.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}