//
//  AccountDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountDataModel {
    
    let dateFormatter = NSDateFormatter()
    
    //ASC for ascendant, DESC for descendant
    func allAccountsAToZ(#order: String) -> [AccountModel] {
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
                
                allAccounts.append(account)
            }
        }
        return allAccounts
    }
    
    func accountOfContact(#contact: ContactModel) -> AccountModel? {
        var accountOfContact: AccountModel!
        
        var querySQL = "SELECT * FROM Account WHERE idAccount = (Select idAccount From Account_Contacts WHERE idContact = \(contact.idContact))"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            if results.next() {
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                accountOfContact = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
            }
        }
        return accountOfContact
    }
    
    // Order the accounts by dates of meetings
    func accountsPerMeeting() -> [AccountModel] {
        var accountsPerMeeting: [AccountModel] = []
        
        DataBase().createViewForAccountsThatHaveMeetings()
        
        var querySQL = "SELECT DISTINCT idAccount, nameAccount, shortNameAccount, leadSource, statusAccount, industryAccount, segmentAccount, websiteAccount, phoneAccount, faxAccount, coverageAccount, regionAccount, adressAccount, idAccount1, countryAccount, typeAccount, favoriteAccount FROM Account_Contact_Meeting"
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
                
                accountsPerMeeting.append(account)
            }
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
                
                accountsPerMeeting.append(account)
            }
            
        }
        return accountsPerMeeting
    }
    
    func searchForParentAccount(#account: AccountModel) -> AccountModel {
        var parentAccount: AccountModel!
        var querySQL = "SELECT * FROM Account WHERE idAccount = \(account.idAccount1)"
        var result: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = result {
            if result.next() {
                var idAccount: Int = Int(result.intForColumn("idAccount"))
                var nameAccount: String = result.stringForColumn("nameAccount")
                var shortNameAccount: String = result.stringForColumn("shortNameAccount")
                var leadSource: String = result.stringForColumn("leadSource")
                var statusAccount: String = result.stringForColumn("statusAccount")
                var industryAccount: String = result.stringForColumn("industryAccount")
                var segmentAccount: String = result.stringForColumn("segmentAccount")
                var websiteAccount: String = result.stringForColumn("websiteAccount")
                var phoneAccount: String = result.stringForColumn("phoneAccount")
                var faxAccount: String = result.stringForColumn("faxAccount")
                var coverageAccount: String = result.stringForColumn("coverageAccount")
                var regionAccount: String = result.stringForColumn("regionAccount")
                var adressAccount: String = result.stringForColumn("adressAccount")
                var idAccount1: Int = Int(result.intForColumn("idAccount1"))
                var countryAccount: String = result.stringForColumn("countryAccount")
                var typeAccount: String = result.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(result.intForColumn("favoriteAccount"))
                parentAccount = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
            }
        }
        return parentAccount
    }
    
    func searchForAccountsOnNameOrSmallName(#dataSearch: String) -> [AccountModel] {
        var searchedAccount: [AccountModel] = []
        
        var querySQL = "SELECT * FROM Account WHERE nameAccount LIKE '%\(dataSearch)%' OR shortNameAccount LIKE '%\(dataSearch)%' ORDER BY nameAccount "
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
                
                searchedAccount.append(account)
            }
        }
        return searchedAccount
    }
    
    func accountOfNextMeeting() -> AccountModel? {
        var accountOfNextMeeting: AccountModel?
        
        DataBase().createViewForAccountsThatHaveMeetings()
        var querySQL = "SELECT DISTINCT idAccount, nameAccount, shortNameAccount, leadSource, statusAccount, industryAccount, segmentAccount, websiteAccount, phoneAccount, faxAccount, coverageAccount, regionAccount, adressAccount, idAccount1, countryAccount, typeAccount, favoriteAccount FROM Account_Contact_Meeting LIMIT 1"
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                accountOfNextMeeting = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
            }
            
        } else {
            return nil
        }
        return accountOfNextMeeting
    }
    
    func accountsMetOnDate(#date: NSDate) -> [AccountModel] {
        var accountsMetOnDate: [AccountModel] = []
        
        DataBase().createViewForAccountsThatHaveMeetings()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        var querySQL = "SELECT idAccount, nameAccount, shortNameAccount, leadSource, statusAccount, industryAccount, segmentAccount, websiteAccount, phoneAccount, faxAccount, coverageAccount, regionAccount, adressAccount, idAccount1, countryAccount FROM Account_Contact_Meeting WHERE date(dateBeginMeeting) = date('\(dateFormatter.stringFromDate(date))')"
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
                var typeAccount: String = results.stringForColumn("typeAccount")
                var favoriteAccount: Int = Int(results.intForColumn("favoriteAccount"))
                let account = AccountModel(idAccount: idAccount, nameAccount: nameAccount, shortNameAccount: shortNameAccount, leadSource: leadSource, statusAccount: statusAccount, industryAccount: industryAccount, segmentAccount: segmentAccount, websiteAccount: websiteAccount, phoneAccount: phoneAccount, faxAccount: faxAccount, coverageAccount: coverageAccount, regionAccount: regionAccount, adressAccount: adressAccount, idAccount1: idAccount1, countryAccount: countryAccount, typeAccount: typeAccount, favoriteAccount: favoriteAccount)
                
                accountsMetOnDate.append(account)
            }
        }
        return accountsMetOnDate
    }
    
    func accountNameFromIdAccount(idAccount: Int) -> String {
        var accountName: String = ""
        var querySQL = "SELECT nameAccount FROM Account WHERE idAccount = \(idAccount)"
        let results = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let result = results {
            while result.next() == true {
                accountName = result.stringForColumn("nameAccount")
            }
        }
        
        return accountName
    }
    
    // update the accounts
    func updateAccount(#account: AccountModel) {
        var erreur = String()
        
        var arrayAccount = account.arrayFromModel()
        //the id of the account has to be added at the end
        arrayAccount.append(account.idAccount)
        let insertSQL = "Update Account SET nameAccount = ?, shortNameAccount = ?, leadSource = ?, statusAccount = ?, industryAccount = ?, segmentAccount = ?, websiteAccount = ?, phoneAccount = ?, faxAccount = ?, coverageAccount = ?, regionAccount = ?, adressAccount = ?, idAccount1 = ?, countryAccount = ?, typeAccount = ?, favoriteAccount = ? Where IdAccount= ?"
        let result = contactDataBase.executeUpdate(insertSQL,
            withArgumentsInArray: arrayAccount)
        
        if !result {
            erreur = "Error: \(contactDataBase.lastErrorMessage())"
        }
        println(erreur)
    }
    
    // insert a new Account (used only in the case of creation in the CRM)
    func insertAccount(account : AccountModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Account (nameAccount,shortNameAccount,leadSource,statusAccount,industryAccount,segmentAccount,websiteAccount,phoneAccount,faxAccount,coverageAccount,regionAccount,adressAccount,idAccount1,countryAccount, typeAccount, favoriteAccount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: account.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}