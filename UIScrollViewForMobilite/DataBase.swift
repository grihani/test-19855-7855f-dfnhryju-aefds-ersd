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
    
    func createDataBase() {
        var erreursDataBase = "Tout s'est bien passé"
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docsDir = dirPaths[0] as String
        var dataBasePath = docsDir.stringByAppendingPathComponent("DataBase.sqlite")
        if !filemgr.fileExistsAtPath(dataBasePath) {
            
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
                    self.defaults.setObject(dataBasePath, forKey: DATABASEPATHKEY)
                }
                contactDB.close()
            } else {
                erreursDataBase += "Error: \(contactDB.lastErrorMessage()); \n"
            }
        } else {
            erreursDataBase = "La base de donnée a déjà été créé"
        }
        println(erreursDataBase)
        println("_____________________")
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


        println(sqlStatement)
        println("_____________________")
        return sqlStatement
    }
    
    func readDataBasePath() -> String {
        if let databasePath = defaults.stringForKey(DATABASEPATHKEY)
        {
            return databasePath
        }
        return ""
    }
}

// méthodes de récupération de NSUserDefaults

// the first 4 methods return 0/0/0.0/0.0 if not found
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