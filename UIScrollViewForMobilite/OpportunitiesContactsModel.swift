//
//  OpportunitiesContacts.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class OpportunitiesContactsModel {
    
    let opportunitiesContactsCreateSQL = "CREATE TABLE IF NOT EXISTS Opportunites_Contacts (idContact INTEGER NOT NULL,idOpportunite INTEGER NOT NULL,CONSTRAINT PK_Opportunites_Contacts PRIMARY KEY (idContact,idOpportunite),FOREIGN KEY (idOpportunite) REFERENCES Opportunites (idOpportunite),FOREIGN KEY (idContact) REFERENCES Contacts (idContact)); "
    
    var idContact: Int
    var idOpportunite: Int
    
    init() {
        self.idContact = 0
        self.idOpportunite = 0
    }
    
    init(idContact: Int, idOpportunite: Int) {
            self.idContact = idContact
            self.idOpportunite = idOpportunite
    }
}