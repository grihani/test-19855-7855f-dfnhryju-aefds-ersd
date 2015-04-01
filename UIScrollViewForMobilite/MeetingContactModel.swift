//
//  MeetingContactModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class MeetingContactModel {
    
    let meetingContactCreateSQL = "CREATE TABLE IF NOT EXISTS Meetings_Contacts (idContact INTEGER NOT NULL,idMeeting INTEGER NOT NULL,CONSTRAINT PK_Meetings_Contacts PRIMARY KEY (idContact,idMeeting),FOREIGN KEY (idMeeting) REFERENCES Meetings (idMeeting),FOREIGN KEY (idContact) REFERENCES Contacts (idContact)); "
    
    var idContact: Int
    var idMeeting: Int
    
    init() {
        self.idContact = 0
        self.idMeeting = 0
    }
    
    init(idContact: Int, idMeeting: Int) {
        self.idContact = idContact
        self.idMeeting = idMeeting
    }
    func arrayFromModel() -> [AnyObject] {
        return [self.idContact, self.idMeeting]
    }
}