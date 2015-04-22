//
//  OpportunityModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class OpportunityModel {
    let opportunityCreateSQL = "CREATE TABLE IF NOT EXISTS Opportunites (idOpportunite INTEGER NOT NULL, nomOpportunite TEXT, contractValueOpportunite TEXT, closeDateOpportunity TEXT, statusOpportunity TEXT, percentageOpportunity INTEGER, CONSTRAINT PK_Opportunites PRIMARY KEY (idOpportunite));"
    
    var idOpportunite: Int
    var nomOpportunite: String
    var contractValueOpportunite: String
    var closeDateOpportunity: String
    var statusOpportunity: String
    var percentageOpportunity: Int
    
    
    init() {
        self.idOpportunite = 0
        self.nomOpportunite = ""
        self.contractValueOpportunite = ""
        self.closeDateOpportunity = ""
        self.statusOpportunity = ""
        self.percentageOpportunity = 0
    }
    
    init(idOpportunite: Int, nomOpportunite: String, contractValueOpportunite: String, closeDateOpportunity: String, statusOpportunity: String, percentageOpportunity: Int) {
        self.idOpportunite = idOpportunite
        self.nomOpportunite = nomOpportunite
        self.contractValueOpportunite = contractValueOpportunite
        self.closeDateOpportunity = closeDateOpportunity
        self.statusOpportunity = statusOpportunity
        self.percentageOpportunity = percentageOpportunity
    }
    
    func arrayFromModel() -> [AnyObject] {
        return [self.nomOpportunite, self.contractValueOpportunite, self.closeDateOpportunity, self.statusOpportunity, self.percentageOpportunity]
    }
}