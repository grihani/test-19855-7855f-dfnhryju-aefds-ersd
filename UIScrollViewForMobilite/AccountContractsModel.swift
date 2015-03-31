//
//  AccountContractsModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountContractsModel {
    
    let accountContractCreateSQL = "CREATE TABLE IF NOT EXISTS Account_Contracts (idAccount INTEGER NOT NULL,idContract INTEGER NOT NULL,CONSTRAINT PK_Account_Contracts PRIMARY KEY (idAccount,idContract),FOREIGN KEY (idAccount) REFERENCES Account (idAccount),FOREIGN KEY (idContract) REFERENCES Contracts (idContract)); "
    
    var idAccount: Int
    var idContract: Int
    
    init() {
        self.idAccount = 0
        self.idContract = 0
    }
    
    init(idAccount: Int, idContract: Int) {
            self.idAccount = idAccount
            self.idContract = idContract
    }
}