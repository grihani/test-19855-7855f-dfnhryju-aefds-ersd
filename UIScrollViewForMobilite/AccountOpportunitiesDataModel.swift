//
//  AccountOpportunitiesDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class AccountOpportunitiesDataModel {
    
    func insertAccountOpportunities (accountOpportunities: AccountOpportunitiesModel) -> String {
        println("inserting Into AccountOpportunitiesModel")
        var erreur = String()
        let insertSQL = "INSERT INTO Account_Opportunites (idAccount,idOpportunite) VALUES ( ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: accountOpportunities.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}