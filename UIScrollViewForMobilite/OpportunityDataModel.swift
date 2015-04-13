//
//  OpportunityDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class OpportunityDataModel {
    
    func allOpportunities() {
        
    }
    
    func insertOpportunity(opportunity: OpportunityModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Opportunites (nomOpportunite,contractValueOpportunite,closeDateOpportunity,statusOpportunity) VALUES ( ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: opportunity.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}