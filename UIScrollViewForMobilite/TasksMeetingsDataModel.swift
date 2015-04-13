//
//  TasksMeetingsDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class TasksMeetingsDataModel {
    
    func insertTasksMeeting(tasksMeeting: TasksMeetingsModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO tasks_Meetings (idTask,idMeeting) VALUES (?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: tasksMeeting.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}