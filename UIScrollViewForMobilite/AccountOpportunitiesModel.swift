//
//  AccountOpportunitiesModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountOpportunitiesModel {
    
    let accountOpportunitiesCreateSQL = "CREATE TABLE IF NOT EXISTS Account_Opportunites (idAccount INTEGER NOT NULL,idOpportunite INTEGER NOT NULL,CONSTRAINT PK_Account_Opportunites PRIMARY KEY (idAccount,idOpportunite),FOREIGN KEY (idAccount) REFERENCES Account (idAccount),FOREIGN KEY (idOpportunite) REFERENCES Opportunites (idOpportunite)); "
    
    
    var idAccount: Int
    var idOpportunite: Int
    
    init() {
        self.idAccount = 0
        self.idOpportunite = 0
    }
    
    init(idAccount: Int, idOpportunite: Int) {
        self.idAccount = idAccount
        self.idOpportunite = idOpportunite
    }
    func arrayFromModel() -> [AnyObject] {
        return [self.idAccount, self.idOpportunite]
    }
}