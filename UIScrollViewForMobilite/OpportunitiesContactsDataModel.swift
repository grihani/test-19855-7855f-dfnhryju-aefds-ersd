//
//  OpportunitiesContactsDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class OpportunitiesContactsDataModel {
    
    func insertOpportunitiesContacts(opportunitiesContacts: OpportunitiesContactsModel) -> String {
        println("inserting Into OpportunitiesContactsModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Opportunites_Contacts (idContact,idOpportunite) VALUES (?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: opportunitiesContacts.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}