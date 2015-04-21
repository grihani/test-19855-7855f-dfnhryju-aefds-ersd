//
//  TaskDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class TaskDataModel {
    
    let dateFormatter = NSDateFormatter()
    
    // NSMutableArray will be the same as : [[String: [TaskModel]]]
    func tasksOfAccountAsArray(#account: AccountModel) -> NSMutableArray {
        var tasksOfAccount: NSMutableArray = NSMutableArray()
        
        var tasks: [TaskModel] = []
        var key = ""
        var dictionary: NSDictionary = NSDictionary()
        
        var counterVerifier = 0
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let actualDate = dateFormatter.stringFromDate(NSDate())
        var querySQL = "SELECT DISTINCT statusTask FROM Tasks"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results{
            while results.next() == true {
                tasks = []
                var statusTask = results.stringForColumn("statusTask")
                querySQL = "SELECT * FROM tasks WHERE statusTask = '\(statusTask)'and idTask IN (SELECT idTask FROM Tasks_Account WHERE idAccount = \(account.idAccount)) AND date(dateTask) <= date('\(actualDate)') ORDER BY date(dateTask) ASC"
                let resultsInLessThanDate: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
                if let resultsInLessThanDate = resultsInLessThanDate {
                    while resultsInLessThanDate.next() == true {
                        var idTask: Int = Int(resultsInLessThanDate.intForColumn("idTask"))
                        var subjectTask: String = resultsInLessThanDate.stringForColumn("subjectTask")
                        var dateTask: String = resultsInLessThanDate.stringForColumn("dateTask")
                        var statusTask: String = resultsInLessThanDate.stringForColumn("statusTask")
                        let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                        tasks.append(task)
                        counterVerifier++
                    }
                }
                if counterVerifier > 0 {
                    key = "OVERDUE & " + statusTask
                    dictionary = NSDictionary(object: tasks, forKey: key)
                    tasksOfAccount.addObject(dictionary)
                    counterVerifier = 0
                }
                tasks = []
                querySQL = "SELECT * FROM tasks WHERE statusTask = '\(statusTask)'and idTask IN (SELECT idTask FROM Tasks_Account WHERE idAccount = \(account.idAccount)) AND date(dateTask) > date('\(actualDate)') ORDER BY date(dateTask) ASC"
                let resultsInMoreThanDate: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
                if let resultsInMoreThanDate = resultsInMoreThanDate {
                    while resultsInMoreThanDate.next() == true {
                        var idTask: Int = Int(resultsInMoreThanDate.intForColumn("idTask"))
                        var subjectTask: String = resultsInMoreThanDate.stringForColumn("subjectTask")
                        var dateTask: String = resultsInMoreThanDate.stringForColumn("dateTask")
                        var statusTask: String = resultsInMoreThanDate.stringForColumn("statusTask")
                        let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                        tasks.append(task)
                        counterVerifier++
                    }
                }
                if counterVerifier > 0 {
                    key = "YET TO COME & " + statusTask
                    dictionary = NSDictionary(object: tasks, forKey: key)
                    tasksOfAccount.addObject(dictionary)
                    counterVerifier = 0
                }
            }
        }
        
        return tasksOfAccount
    }
    
    func tasksOfContactsAsArray(#account: AccountModel) -> NSMutableArray {
        var tasksOfContacts: NSMutableArray = NSMutableArray()
        
        var tasks: [TaskModel] = []
        var key = ""
        var dictionary: NSDictionary = NSDictionary()
        
        var counterVerifier = 0
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let actualDate = dateFormatter.stringFromDate(NSDate())
        
        let contactsOfAccount = ContactDataModel().contactsOfAccount(account: account)
        
        for contact in contactsOfAccount {
            tasks = []
            var querySQL = "SELECT * FROM Tasks WHERE idTask IN (SELECT idTask FROM Tasks_Contacts WHERE idContact = \(contact.idContact)) GROUP BY statusTask ORDER BY date(dateTask) ASC"
            let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
            if let results = results {
                while results.next() {
                    var idTask: Int = Int(results.intForColumn("idTask"))
                    var subjectTask: String = results.stringForColumn("subjectTask")
                    var dateTask: String = results.stringForColumn("dateTask")
                    var statusTask: String = results.stringForColumn("statusTask")
                    let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                    tasks.append(task)
                    counterVerifier++
                }
            }
            if counterVerifier > 0 {
                key = String(contact.idContact)
                dictionary = NSDictionary(object: tasks, forKey: key)
                tasksOfContacts.addObject(dictionary)
                counterVerifier = 0
            }
        }
        
        
        return tasksOfContacts
    }
    
    func tasksOfMeetingsAsArray(#account: AccountModel) -> NSMutableArray {
        var tasksOfContacts: NSMutableArray = NSMutableArray()
        
        var tasks: [TaskModel] = []
        var key = ""
        var dictionary: NSDictionary = NSDictionary()
        
        var counterVerifier = 0
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let actualDate = dateFormatter.stringFromDate(NSDate())
        
        let meetingsOfAccount = MeetingDataModel().meetingsOfAccount(account: account)
        
        for meeting in meetingsOfAccount {
            tasks = []
            var querySQL = "SELECT * FROM Tasks WHERE idTask IN (SELECT idTask FROM Tasks_Meetings WHERE idMeeting = \(meeting.idMeeting)) GROUP BY statusTask ORDER BY date(dateTask) ASC"
            let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
            if let results = results {
                while results.next() {
                    var idTask: Int = Int(results.intForColumn("idTask"))
                    var subjectTask: String = results.stringForColumn("subjectTask")
                    var dateTask: String = results.stringForColumn("dateTask")
                    var statusTask: String = results.stringForColumn("statusTask")
                    let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                    tasks.append(task)
                    counterVerifier++
                    println(meeting.arrayFromModel())
                    println(task.arrayFromModel())
                }
            }
            if counterVerifier > 0 {
                key = String(meeting.idMeeting)
                dictionary = NSDictionary(object: tasks, forKey: key)
                tasksOfContacts.addObject(dictionary)
                counterVerifier = 0
            }
        }
        
        return tasksOfContacts
    }
    
    func insertTask(task: TaskModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Tasks (subjectTask,dateTask,statusTask) VALUES (?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: task.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}