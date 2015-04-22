//
//  OpportunityDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class OpportunityDataModel {
    
    func opportunitiesOfAccount(#account: AccountModel) -> [OpportunityModel] {
        var opportunitiesOfAccount: [OpportunityModel] = []
        
        var querySQL = "SELECT * FROM Opportunites WHERE idOpportunite in (SELECT idOpportunite FROM Account_Opportunites WHERE idAccount = \(account.idAccount)) ORDER BY percentageOpportunity ASC"
        let results: FMResultSet? = contactDataBase.executeQuery(querySQL, withArgumentsInArray: nil)
        if let results = results {
            while results.next() == true {
                
                var idOpportunite: Int = Int(results.intForColumn("idOpportunite"))
                var nomOpportunite: String = results.stringForColumn("nomOpportunite")
                var contractValueOpportunite: String = results.stringForColumn("contractValueOpportunite")
                var closeDateOpportunity: String = results.stringForColumn("closeDateOpportunity")
                var statusOpportunity: String = results.stringForColumn("statusOpportunity")
                var percentageOpportunity: Int = Int(results.intForColumn("percentageOpportunity"))
                
                let opportunity: OpportunityModel = OpportunityModel(idOpportunite: idOpportunite, nomOpportunite: nomOpportunite, contractValueOpportunite: contractValueOpportunite, closeDateOpportunity: closeDateOpportunity, statusOpportunity: statusOpportunity, percentageOpportunity: percentageOpportunity)
                
                opportunitiesOfAccount.append(opportunity)
            }
        }
        return opportunitiesOfAccount
    }
    
    func insertOpportunity(opportunity: OpportunityModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Opportunites (nomOpportunite,contractValueOpportunite,closeDateOpportunity,statusOpportunity,percentageOpportunity) VALUES ( ?, ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: opportunity.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}