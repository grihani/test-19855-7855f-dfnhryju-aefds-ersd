//
//  TasksContactsModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class TasksContactsModel {
    
    let tasksContactCreateSQL = "CREATE TABLE IF NOT EXISTS Tasks_Contacts (idTask INTEGER NOT NULL,idContact INTEGER NOT NULL,CONSTRAINT PK_Tasks_Contacts PRIMARY KEY (idTask,idContact),FOREIGN KEY (idContact) REFERENCES Contacts (idContact),FOREIGN KEY (idTask) REFERENCES Tasks (idTask)); "
    
    var idTask: Int
    var idContact: Int
    
    init() {
        self.idTask = 0
        self.idContact = 0
    }
    
    init(idTask: Int, idContact: Int) {
        self.idTask = idTask
        self.idContact = idContact
    }
}