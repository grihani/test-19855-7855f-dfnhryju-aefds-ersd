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
    
    func pastTasksThatAreYetToBeDone(#account: AccountModel) -> [TaskModel] {
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let actualDate = dateFormatter.stringFromDate(NSDate())
        var pastTasksThatAreYetToBeDone: [TaskModel] = []
        var querySQL = "SELECT * FROM Tasks WHERE statusTask = UPPER('No') AND idTask IN (SELECT idTask FROM Tasks_Account WHERE idAccount = \(account.idAccount)) AND dateTask <= date('\(actualDate)') ORDER BY dateTask"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var idTask: Int = Int(results.intForColumn("idTask"))
                var subjectTask: String = results.stringForColumn("subjectTask")
                var dateTask: String = results.stringForColumn("dateTask")
                var statusTask: String = results.stringForColumn("statusTask")
                let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                pastTasksThatAreYetToBeDone.append(task)
            }
        }
        return pastTasksThatAreYetToBeDone
    }
    
    func formalTasksThatAreYetToBeDone(#account: AccountModel) -> [TaskModel] {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let actualDate = dateFormatter.stringFromDate(NSDate())
        var formalTasksThatAreYetToBeDone: [TaskModel] = []
        var querySQL = "SELECT * FROM Tasks WHERE statusTask = UPPER('No') AND idTask IN (SELECT idTask FROM Tasks_Account WHERE idAccount = \(account.idAccount)) AND dateTask > date('\(actualDate)') ORDER BY dateTask"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var idTask: Int = Int(results.intForColumn("idTask"))
                var subjectTask: String = results.stringForColumn("subjectTask")
                var dateTask: String = results.stringForColumn("dateTask")
                var statusTask: String = results.stringForColumn("statusTask")
                let task = TaskModel(idTask: idTask, subjectTask: subjectTask, dateTask: dateTask, statusTask: statusTask)
                formalTasksThatAreYetToBeDone.append(task)
            }
        }
        return formalTasksThatAreYetToBeDone
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