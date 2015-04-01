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
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = NSDate()
        let dateFromString = dateFormatter.stringFromDate(date)
        var querySQL = "SELECT * FROM Meetings WHERE (datetime(dateBeginMeeting) >= datetime(\(dateFromString))) ORDER BY datetime(dateBeginMeeting)"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var idMeeting: Int = Int(results.intForColumn("idMeeting"))
                var subjectMeeting: String = results.stringForColumn("subjectMeeting")
                var dateBeginMeeting: String = results.stringForColumn("dateBeginMeeting")
                var adressMeeting: String = results.stringForColumn("adressMeeting")
                var dateEndMeeting: String = results.stringForColumn("dateEndMeeting")
                var allDayMeeting: Int = Int(results.intForColumn("allDayMeeting"))
                var priorityMeeting: String = results.stringForColumn("priorityMeeting")
                var descriptionMeeting: String = results.stringForColumn("descriptionMeeting")
                var regardingMeeting: String = results.stringForColumn("regardingMeeting")
                var reportMeeting: String = results.stringForColumn("reportMeeting")
                    
                let meeting: MeetingModel = MeetingModel(idMeeting: idMeeting, subjectMeeting: subjectMeeting, dateBeginMeeting: dateBeginMeeting, adressMeeting: adressMeeting, dateEndMeeting: dateEndMeeting, allDayMeeting: allDayMeeting, priorityMeeting: priorityMeeting, descriptionMeeting: descriptionMeeting, regardingMeeting: regardingMeeting, reportMeeting: reportMeeting)
                    
                allNextMeetings.append(meeting)
            }
        }
        return allNextMeetings
    }
    
    func insertMeeting (meeting: MeetingModel) -> String {
        println("inserting Into MeetingModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Meetings (subjectMeeting,dateBeginMeeting,adressMeeting,dateEndMeeting,allDayMeeting,priorityMeeting,descriptionMeeting,regardingMeeting,reportMeeting) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: meeting.arrayFromModel())
            
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
    
    func checkEmptyMeeting() -> Bool {
        println("checking if meetings is empty")
        var querySQL = "SELECT count(*) as COUNT FROM Meetings"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var count: Int = Int(results.intForColumn("COUNT"))
                if count == 0 {
                    println("Accounts est vide")
                    return true
                }
            }
        }
        println("Meetings n'est pas vide")
        return false
    }
}