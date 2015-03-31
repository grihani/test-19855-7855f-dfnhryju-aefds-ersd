//
//  TasksAccountModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class TasksAccountModel {
    
    let tasksAccountCreateSQL = "CREATE TABLE IF NOT EXISTS Tasks_Account (idAccount INTEGER NOT NULL,idTask INTEGER NOT NULL,CONSTRAINT PK_Tasks_Account PRIMARY KEY (idAccount,idTask),FOREIGN KEY (idAccount) REFERENCES Account (idAccount),FOREIGN KEY (idTask) REFERENCES Tasks (idTask)); "
    
    var idAccount: Int
    var idTask: Int
    
    init() {
        self.idAccount = 0
        self.idTask = 0
    }
    
    init(idAccount: Int, idTask: Int) {
            self.idAccount = idAccount
            self.idTask = idTask
    }
    
}