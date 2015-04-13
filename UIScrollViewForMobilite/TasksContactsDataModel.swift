//
//  TasksContactsDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class TasksContactsDataModel {
    
    func insertTasksContacts(tasksContacts: TasksContactsModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Tasks_Contacts (idTask,idContact) VALUES ( ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: tasksContacts.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}