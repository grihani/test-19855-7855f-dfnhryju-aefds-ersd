//
//  MeetingContactDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class MeetingContactDataModel {
    
    func insertMeetingContactModel (meetingContactModel: MeetingContactModel) -> String {
        println("inserting Into MeetingContactModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Meetings_Contacts (idContact,idMeeting) VALUES ( ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: meetingContactModel.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}