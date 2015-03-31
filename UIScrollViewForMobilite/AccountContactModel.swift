//
//  AccountContactModel.swift
//  UIScrollViewForMobilite
//
//  Created by CSC CSC on 31/03/2015.
//  Copyright (c) 2015 CSC CSC. All rights reserved.
//

import Foundation

class AccountContactModel {
    
    let accountContactCreateSQL = "CREATE TABLE IF NOT EXISTS Account_Contacts (idAccount INTEGER NOT NULL, idContact INTEGER NOT NULL, roleContact TEXT, CONSTRAINT PK_Account_Contacts PRIMARY KEY (idAccount,idContact), FOREIGN KEY (idAccount) REFERENCES Account (idAccount), FOREIGN KEY (idContact) REFERENCES Contacts (idContact)); "
    
    var idAccount: Int
    var idContact: Int
    var roleContact: String
    
    init() {
        self.idAccount = 0
        self.idContact = 0
        self.roleContact = ""
    }
    
    init(idAccount: Int, idContact: Int, roleContact: String) {
        self.idAccount = idAccount
        self.idContact = idContact
        self.roleContact = roleContact
    }
}