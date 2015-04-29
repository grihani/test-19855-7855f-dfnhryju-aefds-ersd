//
//  UserContactModel.swift
//  UIScrollViewForMobilite
//
//  Created by Formation iOS on 27/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class UserContactModel {
    
    let userContactCreateSQL = "CREATE TABLE IF NOT EXISTS Users_Contacts (idUser INTEGER NOT NULL,idContact INTEGER NOT NULL,CONSTRAINT PK_Users_Contacts PRIMARY KEY (idUser,idContact),FOREIGN KEY (idContact) REFERENCES Contacts (idContact),FOREIGN KEY (idUser) REFERENCES User (idUser));"
    
    var idUser: Int
    var idContact: Int
    
    init() {
        self.idUser = 0
        self.idContact = 0
    }
    
    init(idUser: Int, idContact: Int) {
        self.idUser = idUser
        self.idContact = idContact
    }
    func arrayFromModel() -> [AnyObject] {
        return [self.idUser, self.idContact]
    }
    
}