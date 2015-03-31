//
//  TaskModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class TaskModel {
    
    let taskCreateSQL = "CREATE TABLE IF NOT EXISTS Tasks (idTask INTEGER NOT NULL, subjectTask TEXT, dateTask TEXT, statusTask TEXT, CONSTRAINT PK_Contracts PRIMARY KEY (idTask)); "
    
    var idTask: Int
    var subjectTask: String
    var dateTask: String
    var statusTask: String
    
    init() {
        self.idTask = 0
        self.subjectTask = ""
        self.dateTask = ""
        self.statusTask = ""
    }
    
    init(idTask: Int, subjectTask: String, dateTask: String, statusTask: String) {
        self.idTask = idTask
        self.subjectTask = subjectTask
        self.dateTask = dateTask
        self.statusTask = statusTask
    }
}