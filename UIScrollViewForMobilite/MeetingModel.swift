//
//  MeetingModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class MeetingModel {
    let meetingCreateSQL = "CREATE TABLE IF NOT EXISTS Meetings (idMeeting INTEGER NOT NULL, subjectMeeting TEXT, dateBeginMeeting TEXT, adressMeeting TEXT, dateEndMeeting TEXT, allDayMeeting INTEGER, priorityMeeting TEXT, descriptionMeeting TEXT, regardingMeeting TEXT, reportMeeting TEXT, CONSTRAINT PK_Meetings PRIMARY KEY (idMeeting)); "
    
    var idMeeting: Int
    var subjectMeeting: String
    var dateBeginMeeting: String
    var adressMeeting: String
    var dateEndMeeting: String
    var allDayMeeting: Int
    var priorityMeeting: String
    var descriptionMeeting: String
    var regardingMeeting: String
    var reportMeeting: String
    
    init() {
        self.idMeeting = 0
        self.subjectMeeting = ""
        self.dateBeginMeeting = ""
        self.adressMeeting = ""
        self.dateEndMeeting = ""
        self.allDayMeeting = 0
        self.priorityMeeting = ""
        self.descriptionMeeting = ""
        self.regardingMeeting = ""
        self.reportMeeting = ""
    }
    
    init(idMeeting: Int, subjectMeeting: String, dateBeginMeeting: String, adressMeeting: String, dateEndMeeting: String, allDayMeeting: Int, priorityMeeting: String, descriptionMeeting: String, regardingMeeting: String, reportMeeting: String) {
        self.idMeeting = idMeeting
        self.subjectMeeting = subjectMeeting
        self.dateBeginMeeting = dateBeginMeeting
        self.adressMeeting = adressMeeting
        self.dateEndMeeting = dateEndMeeting
        self.allDayMeeting = allDayMeeting
        self.priorityMeeting = priorityMeeting
        self.descriptionMeeting = descriptionMeeting
        self.regardingMeeting = regardingMeeting
        self.reportMeeting = reportMeeting
    }
    
    func arrayFromModel() -> [AnyObject] {
        return [self.subjectMeeting, self.dateBeginMeeting, self.adressMeeting, self.dateEndMeeting, self.allDayMeeting, self.priorityMeeting, self.descriptionMeeting, self.regardingMeeting, self.reportMeeting]
    }
}