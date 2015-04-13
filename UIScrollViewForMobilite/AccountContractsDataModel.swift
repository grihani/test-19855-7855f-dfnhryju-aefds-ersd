//
//  AccountContractsDataModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 01/04/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation
class AccountContractsDataModel {
    
    func insertAccountContracts(accountContract: AccountContractsModel) -> String {
        var erreur = String()
        let insertSQL = "INSERT INTO Account_Contracts (idAccount,idContract) VALUES ( ?, ?)"
        let result = contactDataBase.executeUpdate(insertSQL, withArgumentsInArray: accountContract.arrayFromModel())
        if !result {
            erreur += "\n Error: \(contactDataBase.lastErrorMessage())"
        }
        return erreur
    }
}