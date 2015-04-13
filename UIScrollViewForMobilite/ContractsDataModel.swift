//
//  ContractsDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class ContractsDataModel {
    
    func insertContracts(contract: ContractsModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Contracts (subjectContract,valueContract,dateContract,statusContract) VALUES ( ?, ?, ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: contract.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}