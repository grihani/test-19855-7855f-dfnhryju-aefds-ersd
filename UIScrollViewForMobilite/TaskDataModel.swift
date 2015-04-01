//
//  TaskDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class TaskDataModel {
    
    func insertTask(task: TaskModel) -> String {
        println("inserting Into TaskModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Tasks (subjectTask,dateTask,statusTask) VALUES (?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: task.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}