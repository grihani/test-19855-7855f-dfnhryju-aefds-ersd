//
//  TasksMeetingsModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class TasksMeetingsModel {
    
    let tasksMeetingsCreateSQL = "CREATE TABLE IF NOT EXISTS Tasks_Meetings (idTask INTEGER NOT NULL,idMeeting INTEGER NOT NULL,CONSTRAINT PK_Tasks_Meetings PRIMARY KEY (idTask,idMeeting),FOREIGN KEY (idMeeting) REFERENCES Meetings (idMeeting),FOREIGN KEY (idTask) REFERENCES Tasks (idTask));"
    
    var idTask: Int
    var idMeeting: Int
    
    init() {
        self.idTask = 0
        self.idMeeting = 0
    }
    
    init(idTask: Int, idMeeting: Int) {
        self.idTask = idTask
        self.idMeeting = idMeeting
    }
    func arrayFromModel() -> [AnyObject] {
        return [self.idTask, self.idMeeting]
    }
    
}