//
//  TasksAccountDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class TasksAccountDataModel {
    
    func insertTaskAccount(taskAccount: TasksAccountModel) -> String {
        println("inserting Into TasksAccountModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Tasks_Account (idAccount,idTask) VALUES (?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: taskAccount.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}