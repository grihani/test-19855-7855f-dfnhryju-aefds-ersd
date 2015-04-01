//
//  MeetingDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class MeetingDataModel {
    
    let dateFormatter: NSDateFormatter = NSDateFormatter()
    
    func comingMeetings() -> [MeetingModel] {
        var allNextMeetings: [MeetingModel] = []
        
        
        let dataBasePath = DataBase().readDataBasePath()
        let contactDB = FMDatabase(path: dataBasePath)
        
        let date = NSDate()
        
        if contactDB == nil {
            println("Error: \(contactDB.lastErrorMessage());\n")
        }
        if contactDB.open() {
            
        }
        return allNextMeetings
    }
}