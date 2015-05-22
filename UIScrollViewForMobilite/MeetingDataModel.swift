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
        var querySQL = "SELECT * FROM Meetings WHERE (datetime(dateBeginMeeting) >= datetime('\(dateFromString)')) ORDER BY datetime(dateBeginMeeting) ASC"
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
    
    func allMeetings(#fromDate: NSDate, toDate: NSDate) -> [MeetingModel] {
        var allMeetings: [MeetingModel] = []
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFromString = dateFormatter.stringFromDate(fromDate)
        let dateToString = dateFormatter.stringFromDate(toDate)
        var querySQL = "SELECT * FROM Meetings WHERE date(dateBeginMeeting) BETWEEN date('\(dateFromString)') AND date('\(dateToString)') ORDER BY datetime(dateBeginMeeting) ASC"
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
                
                allMeetings.append(meeting)
            }
        }
        return allMeetings
    }
    
    func meetingsOfAccount(#account: AccountModel) -> [MeetingModel] {
        var meetingsOfAccount: [MeetingModel] = []
        
        // Create the view if not already created
        DataBase().createViewForAccountsThatHaveMeetings()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var querySQL = "SELECT idMeeting, subjectMeeting, dateBeginMeeting, adressMeeting, dateEndMeeting, allDayMeeting, priorityMeeting, descriptionMeeting, regardingMeeting, reportMeeting FROM Account_Contact_Meeting WHERE idAccount = \(account.idAccount) ORDER BY datetime(dateBeginMeeting) ASC"
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
                
                meetingsOfAccount.append(meeting)
            }
        }
        if meetingsOfAccount.isEmpty {
            
        }
        return meetingsOfAccount
    }
    
    func meetingFromIdMeeting(#idMeeting: Int) -> MeetingModel {
        var meeting: MeetingModel = MeetingModel()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var querySQL = "SELECT * FROM Meetings WHERE idMeeting = \(idMeeting)"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            if results.next() == true {
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
                
                meeting = MeetingModel(idMeeting: idMeeting, subjectMeeting: subjectMeeting, dateBeginMeeting: dateBeginMeeting, adressMeeting: adressMeeting, dateEndMeeting: dateEndMeeting, allDayMeeting: allDayMeeting, priorityMeeting: priorityMeeting, descriptionMeeting: descriptionMeeting, regardingMeeting: regardingMeeting, reportMeeting: reportMeeting)
            }
        }
        
        return meeting
    }
    
    
    
    func insertMeeting(meeting: MeetingModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Meetings (subjectMeeting,dateBeginMeeting,adressMeeting,dateEndMeeting,allDayMeeting,priorityMeeting,descriptionMeeting,regardingMeeting,reportMeeting) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: meeting.arrayFromModel())
            
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
    
    func numberOfMeetingsInDay(date:NSDate) -> (Int, Int) {
        var numberOfMeetingsInDay = (0,0)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringFromDate = dateFormatter.stringFromDate(date)
        var querySQL = "SELECT count(*) as countOfMeetings, allDayMeeting FROM Meetings WHERE date(dateBeginMeeting) = date('\(stringFromDate)')"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            if results.next() == true {
                numberOfMeetingsInDay = (Int(results.intForColumn("countOfMeetings")),Int(results.intForColumn("allDayMeeting")))
            }
        }
        return numberOfMeetingsInDay
    }
    
    func checkEmptyMeeting() -> Bool {
        
        var querySQL = "SELECT count(*) as COUNT FROM Meetings"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                var count: Int = Int(results.intForColumn("COUNT"))
                if count == 0 {
                    
                    return true
                }
            }
        }
        
        return false
    }
}