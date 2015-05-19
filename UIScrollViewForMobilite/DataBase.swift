//
//  DataBase.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class DataBase {
    let defaults = NSUserDefaults.standardUserDefaults()
    let DATABASEPATHKEY = "dataBasePath"
    let filemgr = NSFileManager.defaultManager()
    
    func createDataBase(dataBasePath: NSString) -> Bool {
        var createDB = false
        var erreursDataBase = "Tout s'est bien passé"
        let contactDB = FMDatabase(path: dataBasePath)
            
        if contactDB == nil {
            erreursDataBase = ""
            erreursDataBase += "Error: \(contactDB.lastErrorMessage());\n"
        }
            
        if contactDB.open() {
            let sql_stmt = createTablesStatement()
            
            if !contactDB.executeStatements(sql_stmt) {
                erreursDataBase += "Error: \(contactDB.lastErrorMessage());\n"
            } else {
                createDB = true
            }
            contactDB.close()
        } else {
            erreursDataBase += "Error: \(contactDB.lastErrorMessage()); \n"
        }
        return createDB
    }
    
    func createTablesStatement() -> String {
        
        var sqlStatement = ""
        // AccountModel
        var accountModel = AccountModel()
        sqlStatement += accountModel.accountCreateSQL
        
        // MeetingModel
        var meetingModel = MeetingModel()
        sqlStatement += meetingModel.meetingCreateSQL
        
        
        // OpportunityModel
        var opportunityModel = OpportunityModel()
        sqlStatement += opportunityModel.opportunityCreateSQL
        
        // ContactModel
        var contactModel = ContactModel()
        sqlStatement += contactModel.contactCreateSQL
        
        // AccountContactModel
        var accountContactModel = AccountContactModel()
        sqlStatement += accountContactModel.accountContactCreateSQL

        
        // OpportunitiesContactsModel
        var opportunitiesContactsModel = OpportunitiesContactsModel()
        sqlStatement += opportunitiesContactsModel.opportunitiesContactsCreateSQL

        
        // AccountOpportunitiesModel
        var accountOpportunitiesModel = AccountOpportunitiesModel()
        sqlStatement += accountOpportunitiesModel.accountOpportunitiesCreateSQL
        
        
        // MeetingContactModel
        var meetingContactModel = MeetingContactModel()
        sqlStatement += meetingContactModel.meetingContactCreateSQL
        
        
        // ContractsModel
        var contractModel = ContractsModel()
        sqlStatement += contractModel.contractCreateSQL
        
        
        // AccountContractsModel
        var accountContractModel = AccountContractsModel()
        sqlStatement += accountContractModel.accountContractCreateSQL
        
        // TaskModel
        var taskModel = TaskModel()
        sqlStatement += taskModel.taskCreateSQL
        
        // TasksAccountModel
        var tasksAccountModel = TasksAccountModel()
        sqlStatement += tasksAccountModel.tasksAccountCreateSQL
        
        // TasksContactsModel
        var tasksContactModel = TasksContactsModel()
        sqlStatement += tasksContactModel.tasksContactCreateSQL
        
        // TasksMeetingsModel
        var tasksMeetingsModel = TasksMeetingsModel()
        sqlStatement += tasksMeetingsModel.tasksMeetingsCreateSQL
        
        var userModel = UserModel()
        sqlStatement += userModel.userCreateSQL


        println(sqlStatement)
        println("_____________________")
        return sqlStatement
    }
    
    func checkingAndInsertingTables() {
        var empty: Bool
        if checkEmptyTable("Account") {
            Bouchonnage().insertingAccounts()
        }
        if checkEmptyTable("Account_Contacts"){
            Bouchonnage().insertingAccountContacts()
        }
        if checkEmptyTable("Account_Contracts"){
            Bouchonnage().insertingAccountContracts()
        }
        if checkEmptyTable("Account_Opportunites"){
            Bouchonnage().insertingAccountOpportunities()
        }
        if checkEmptyTable("Contacts"){
            Bouchonnage().insertingContacts()
        }
        if checkEmptyTable("Contracts"){
            Bouchonnage().insertingContracts()
        }
        if checkEmptyTable("Meetings"){
            Bouchonnage().insertingMeetings()
        }
        if checkEmptyTable("Meetings_Contacts"){
            Bouchonnage().insertingContactMeetings()
        }
        if checkEmptyTable("Opportunites"){
            Bouchonnage().insertingOpportunities()
        }
        if checkEmptyTable("Opportunites_Contacts"){
            Bouchonnage().insertingContactOpportunities()
        }
        if checkEmptyTable("Tasks"){
            Bouchonnage().insertingTasks()
        }
        if checkEmptyTable("Tasks_Account"){
            Bouchonnage().insertingAccountTasks()
        }
        if checkEmptyTable("Tasks_Contacts"){
            Bouchonnage().insertingContactTasks()
        }
        if checkEmptyTable("Tasks_Meetings"){
            Bouchonnage().insertingTaskMeetings()
        }
        if checkEmptyTable("User") {
            Bouchonnage().insertingUser()
        }
    }
    
    func checkEmptyTable(table: String) -> Bool {
//        println("checking if \(table) is empty")
        var querySQL = "SELECT count(*) as COUNT FROM \(table)"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var count: Int = Int(results.intForColumn("COUNT"))
                if count == 0 {
                    println("\(table) est vide")
                    return true
                }
            }
        }
//        println("\(table) n'est pas vide")
        return false
    }
    
    func readDataBasePath() -> String {
        if let databasePath = defaults.stringForKey(DATABASEPATHKEY)
        {
            return databasePath
        }
        return ""
    }
    
    func createViewForAccountsThatHaveMeetings() {
        
        var querySQL = "CREATE TEMPORARY VIEW IF NOT EXISTS Account_Contact_Meeting AS SELECT * FROM Account INNER JOIN Account_Contacts ON account.idAccount = account_contacts.idAccount INNER JOIN Contacts ON account_contacts.idcontact = Contacts.idContact INNER JOIN Meetings_contacts ON contacts.idcontact = Meetings_contacts.idContact INNER JOIN Meetings ON Meetings_contacts.idMeeting = Meetings.idMeeting WHERE datetime(dateBeginMeeting) >= datetime('now') order by date(dateBeginMeeting) ASC"
        if !contactDataBase.executeStatements(querySQL) {
            
            
        } else {
            
            
        }
    }
    
    func createViewForContactsThatHaveAccounts() {
        
        var querySQL = "CREATE TEMPORARY VIEW IF NOT EXISTS Contact_Account AS SELECT * FROM Contacts INNER JOIN Account_Contacts ON Contacts.idContact = account_contacts.idContact INNER JOIN Account ON account_contacts.idAccount = Account.idAccount ORDER BY Contacts.lastNameContact ASC"
        if !contactDataBase.executeStatements(querySQL) {
            
            
        } else {
            
            
        }
    }
}

// méthodes de récupération de NSUserDefaults

// the first 4 methods return 0/0/0.0/0.0 if not found as they are not optional
//func boolForKey(defaultName: String) -> Bool
//func integerForKey(defaultName: String) -> Int
//func floatForKey(defaultName: String) -> Float
//func doubleForKey(defaultName: String) -> Double


//func objectForKey(defaultName: String) -> AnyObject?
//func URLForKey(defaultName: String) -> NSURL?
//func dataForKey(defaultName: String) -> NSData?
//func stringForKey(defaultName: String) -> String?
//func stringArrayForKey(defaultName: String) -> [AnyObject]?
//func arrayForKey(defaultName: String) -> [AnyObject]?
//func dictionaryForKey(defaultName: String) -> [NSObject : AnyObject]?